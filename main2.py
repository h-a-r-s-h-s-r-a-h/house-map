#  api => with Chat History
import os
import json
import re
import difflib  
from flask import Flask, request, jsonify
from flask_cors import CORS
import google.generativeai as genai
from dotenv import load_dotenv
from datetime import datetime
import matplotlib.pyplot as plt
import matplotlib.patches as patches
import plotly.graph_objects as go

from prompts import descriptionPrompt, layoutPrompt, chatPrompt
from store import save_to_json_file, get_latest_data

load_dotenv()

GOOGLE_API_KEY = os.getenv("GOOGLE_API_KEY") 
if not GOOGLE_API_KEY:
    raise ValueError("Google API key not found. Please set the GOOGLE_API_KEY environment variable in the .env file.")

genai.configure(api_key=GOOGLE_API_KEY)

app = Flask(__name__)
CORS(app)

app_data = get_latest_data() or {
    "Sq_ft": 1200,
    "requirement": None,
    "layout": None,
    "client_entities": [],
    "chat_history": [
        {"role": "user", "parts": "Hello"},
        {"role": "model", "parts": "Great to meet you,I'm Vastu_ChatBot. What would you like to know?"}
    ],
    "time_history": [],
    "description": "",
}

entities = [
    "kitchen", "bedroom", "bathroom", "pooja_room", "living_room", "dining_room",
    "study_room", "storeroom", "balcony", "utility_room", "guest_room",
    "home_office", "nursery", "laundry_room", "garage", "library", "media_room", "playroom", "pet_room", "reading_room", "storage_room", "balcony_garden", "washroom",
]

# mapping variations
extended_entity_mapping = {
    "toilet": ["toilet", "washroom", "bathroom", "restroom", "wc"],
    "bedroom": ["bedroom", "bedrooms", "guestroom","guest room"],
    "living_room": ["living_room", "living room", "lounge"],
    "dining_room": ["dining_room", "dining room", "dining"],
    "kitchen": ["kitchen", "cooking area", "kitchenette"],
    "balcony": ["balcony", "balcony_garden"],
    "study_room": ["study_room", "studyroom", "home office", "office"],
    "storeroom": ["storeroom", "storage room", "storerooms"],
    "pooja_room": ["pooja_room", "puja room", "prayer room"],
    "utility_room": ["utility_room", "utility space", "service room"],
    "guest_room": ["guest_room", "guest room", "visitors room"],
    "nursery": ["nursery", "child's room", "kids room"],
    "laundry_room": ["laundry_room", "laundry", "wash room"],
    "garage": ["garage", "carport", "vehicle storage"],
    "library": ["library", "reading room", "book room"],
    "media_room": ["media_room", "home theater", "entertainment room"],
    "playroom": ["playroom", "children's play area", "play area"],
    "pet_room": ["pet_room", "pet space", "animal room"],
    "reading_room": ["reading_room", "study area", "book nook"],
    "storage_room": ["storage_room", "storeroom", "storage space"],
}

essential_components = ["bedroom", "toilet", "kitchen", "living_room", "dining_room", ]
# "bathroom", "utility_room", "storeroom", "hallway"

def is_similar(input_word, entity_word, threshold=0.7):
    similarity = difflib.SequenceMatcher(None, input_word, entity_word).ratio()
    return similarity >= threshold


def match_entities(user_input):
    matched_entities = set()
    
    entity_pattern = re.compile(r'(\d+)?\s*([a-zA-Z_]+)')
    
    for match in entity_pattern.finditer(user_input):
        number = match.group(1)
        entity = match.group(2).lower()


        for main_entity, variations in extended_entity_mapping.items():
            if any(is_similar(entity, variation) for variation in variations):
                
                if number:
                    matched_entities.add(f"{number} {main_entity}")
                else:
                    matched_entities.add(main_entity)
                break
    return matched_entities

def update_entities(new_entities):
    
    current_entities = {re.sub(r'\d+', '', entity): entity for entity in app_data['client_entities']}
    
    for new_entity in new_entities:
        entity_type = re.sub(r'\d+', '', new_entity)
        if entity_type in current_entities:
            
            app_data['client_entities'] = [entity if entity != current_entities[entity_type] else new_entity for entity in app_data['client_entities']]
        else:
            
            app_data['client_entities'].append(new_entity)


def check_essential_components(requirement):
    provided_components = [comp for comp in essential_components if comp in requirement.lower()]
    return provided_components


def generate_description():
    if not all([app_data["Sq_ft"], app_data["layout"]]):
        return {"error": "App data 'Sq_ft' and 'layout' must be set by /generate_layout first."}, 400

    client_data = {
        "Sq_ft": app_data["Sq_ft"],
        "client_entities": app_data["client_entities"],
        "Layout": app_data["layout"],
    }

    formatted_prompt = descriptionPrompt.format(
        Sq_ft=client_data["Sq_ft"],
        requirement=json.dumps(client_data["client_entities"]),
        Layout=json.dumps(client_data["Layout"], indent=4)
    )

    try:
        model = genai.GenerativeModel("models/gemini-1.5-flash-latest")
        response = model.generate_content(contents=[formatted_prompt])
        desc = response.text.strip()
        
        formatted_response = desc.replace("*", "").replace("#", "").replace("**", "").replace("##", "")


        try:
            description = json.loads(formatted_response)
        except json.JSONDecodeError:
            return {"description": formatted_prompt}, 200
        
        return description

    except Exception as e:
        return {"error": str(e)}, 500


def generate_layout(Sq_ft, requirement):
    formatted_prompt = layoutPrompt.format(Sq_ft=Sq_ft, requirement=json.dumps(requirement))
    
    try:
        model = genai.GenerativeModel("models/gemini-1.5-pro-latest")
        response = model.generate_content(contents=[formatted_prompt])
        layout = json.loads(response.text.strip())
        print(layout)
        return layout

    except Exception as e:
        return {"error": str(e)}, 500

@app.route("/set_Sq_ft",methods=['POST'])
def set_Sq_ft():
    try:
        data = request.json
        if not data or "Sq_ft" not in data: 
            return jsonify({"error": "Sq_ft is required"}), 400
        
        app_data["Sq_ft"] = data["Sq_ft"]
        print("Sq_ft : ",data["Sq_ft"])

        save_to_json_file(app_data)
        return jsonify({"Sq_ft":data["Sq_ft"]}), 200
    
    except Exception as e:
        print(f"An unexpected error occurred /set_Sq_ft: {e}")
        return jsonify({"error": str(e)}), 500


@app.route('/chat', methods=['POST'])
def chat_with_model():
    try:
        data = request.json
        if not data or "user_input" not in data:
            return jsonify({"error": "Message is required"}), 400

        user_input = data.get("user_input").strip()
        if not user_input:
            return jsonify({"error": "Message cannot be empty"}), 400


        if 'client_entities' not in app_data:
            app_data['client_entities'] = []

        history = app_data.get("chat_history")
        time_history = app_data.get("time_history", [])


        matched_entities = match_entities(user_input)
        
        update_entities(matched_entities)
        
        print(f'Requirements : {app_data["client_entities"]}')

        # format => "YYYY-MM-DD[HH:MM:SS]"
        current_time = datetime.now().strftime("%Y-%m-%d[%H:%M:%S]")
        

        formatted_chatPrompt = chatPrompt.format(
            Sq_ft=app_data["Sq_ft"],
            client_entities=app_data["client_entities"],
            essential_components=essential_components,
            user_input=user_input
        )
        
        model = genai.GenerativeModel("models/gemini-1.5-flash-latest")
        chat = model.start_chat(history=history)
        
        response = chat.send_message(formatted_chatPrompt)

        formatted_response = response.text.replace("*", "")

        history.append({"role": "user", "parts": user_input})
        history.append({"role": "model", "parts": formatted_response})  
        app_data["chat_history"] = history  

        time_history.append(current_time)
        app_data["time_history"] = time_history

        save_to_json_file(app_data)

        return jsonify({"response": formatted_response, "history": history, "current_time": current_time, "time_history": time_history, "client_entities":app_data["client_entities"]}), 200

    
    except Exception as e:
        print(f"An unexpected error occurred in /chat: {e}")
        return jsonify({"error": str(e)}), 500


@app.route('/clear_data', methods=['POST'])
def clear_data():
    try:
        global app_data
        previous_appData = app_data
        app_data = {
            "Sq_ft": 1200,
            "requirement": None,
            "layout": None,
            "client_entities": [],
            "chat_history": [
                {"role": "user", "parts": "Hello"},
                {"role": "model", "parts": "Great to meet you. What would you like to know?"}
            ],
        }
        save_to_json_file(app_data)

        return jsonify({"Previous App Data":previous_appData,"message": "Data cleared successfully."}), 200
    
    except Exception as e:
        return jsonify({"error": str(e)}), 500

@app.route('/show_data', methods=['POST'])
def show_data():
    try:
        global app_data
        return jsonify({"App Data":app_data,"message": "Here is your App Data."}), 200
    
    except Exception as e:
        return jsonify({"error": str(e)}), 500




def generate_vastu_matrix(room_list, Sq_ft):
    if not isinstance(Sq_ft, (int, float)) or Sq_ft <= 0:
        raise ValueError("Sq_ft must be a positive number.")

    if not isinstance(room_list, list):
        raise ValueError("The layout must be a list of room types.")

    # Define Vastu constraints with corrected percentages
    vastu_matrix = {
        "pooja_room": {"direction": "east-north", "percentage": 0.05},
        "kitchen": {"direction": "south-east", "percentage": 0.1},
        "bedroom": {"direction": "south-west", "percentage": 0.2},
        "living_room": {"direction": "north", "percentage": 0.3},
        "dining_room": {"direction": "north-west", "percentage": 0.1},
        "study_room": {"direction": "east", "percentage": 0.05},
        "storeroom": {"direction": "south-west", "percentage": 0.05},
        "balcony": {"direction": "west", "percentage": 0.03},
        "utility_room": {"direction": "north-east", "percentage": 0.02},
        "guest_room": {"direction": "north-east", "percentage": 0.05},
        "toilet": {"direction": "north-west", "percentage": 0.05},
    }

    # Validate total percentage in vastu_matrix
    total_percentage = sum(v["percentage"] for v in vastu_matrix.values())
    if total_percentage > 1.0:
        raise ValueError(f"Room percentages exceed 100% ({total_percentage * 100:.2f}%). Please adjust vastu_matrix.")

    # Generate layout based on the room list
    generated_layout = []
    for room_type in room_list:
        if room_type not in vastu_matrix:
            raise ValueError(f"Unknown room type '{room_type}' provided.")
        vastu_details = vastu_matrix[room_type]
        room_size = Sq_ft * vastu_details["percentage"]
        generated_layout.append({
            "room_type": room_type,
            "direction": vastu_details["direction"],
            "size": round(room_size, 2)
        })

    # Automatically call generate_house_map after updating layout
    print(generated_layout)
    # generate_house_map(generated_layout, Sq_ft)
    # plot_house_layout()
    # plot_house_layout1()
    generate_layout12()
    # generate_layout(generated_layout)

    return generated_layout


def plot_house_layout1():
    # Initialize the plot
    fig, ax = plt.subplots(figsize=(12, 8))
    ax.set_xlim(-1, 25)
    ax.set_ylim(-1, 20)
    ax.set_title("House Layout", fontsize=16)

    # Room definitions (name, x, y, width, height)
    rooms = [
        {"name": "DiningRoom", "x": 1, "y": 14.5, "width": 3.5, "height": 2.5},
        {"name": "Study 2", "x": 4.5, "y": 14.5, "width": 3.5, "height": 2.5},
        {"name": "Kitchen", "x": 1, "y": 10.5, "width": 4, "height": 4},
        {"name": "Study 1", "x": 5, "y": 9, "width": 4.5, "height": 5.5},
        {"name": "Treasury Room4", "x": 1, "y": 6.5, "width": 4, "height": 4},
        {"name": "BR2", "x": 5, "y": 5, "width": 5, "height": 4},
        {"name": "Ent", "x": 1, "y": 2.5, "width": 4, "height": 4},
        {"name": "Living", "x": 9.5, "y": 9, "width": 6, "height": 8},
        {"name": "Lib", "x": 10, "y": 2.5, "width": 5, "height": 6.5},
        {"name": "BedRoom2", "x": 15, "y": 2.5, "width": 4, "height": 6.5},
        {"name": "BR1", "x": 15.5, "y": 15, "width": 2, "height": 2},
        {"name": "BedRoom1", "x": 19, "y": 6.5, "width": 3, "height": 6},
        {"name": "Guest Room3", "x": 19, "y": 2.5, "width": 4, "height": 4},
        {"name": "Play Room", "x": 15.5, "y": 9, "width": 3.5, "height": 6},
        {"name": "WC2", "x": 5, "y": 2.5, "width": 2.5, "height": 2.5},
        {"name": "WC1", "x": 7.5, "y": 2.5, "width": 2.5, "height": 2.5},
    ]

    # Draw rooms
    for room in rooms:
        rect = patches.Rectangle(
            (room["x"], room["y"]), room["width"], room["height"],
            linewidth=1, edgecolor="red", facecolor="none"
        )
        ax.add_patch(rect)
        ax.text(
            room["x"] + room["width"] / 2,
            room["y"] + room["height"] / 2,
            room["name"],
            ha="center", va="center", fontsize=8, color="red"
        )

    # Add cardinal directions
    ax.text(12, 19.5, "N", ha="center", va="center", fontsize=16, color="black")
    ax.text(12, -0.5, "S", ha="center", va="center", fontsize=16, color="black")
    ax.text(-0.5, 10, "E", ha="center", va="center", fontsize=16, color="black")
    ax.text(24.5, 10, "W", ha="center", va="center", fontsize=16, color="black")

    # Add gridlines
    plt.grid(True, linestyle="--", linewidth=0.5)
    plt.show()

plot_house_layout1()
# def generate_vastu_matrix(room_list, Sq_ft):
#     """
#     Generates a Vastu-compliant layout based on the given room list and total square footage.

#     Args:
#         room_list (list): List of room types to include in the layout.
#         Sq_ft (float): Total square footage of the house.

#     Returns:
#         list: A list of dictionaries representing the layout with room details.

#     Raises:
#         ValueError: If inputs are invalid or room types are unknown.
#     """
#     # Input validation
#     if not isinstance(Sq_ft, (int, float)) or Sq_ft <= 0:
#         raise ValueError("Sq_ft must be a positive number.")
#     if not isinstance(room_list, list):
#         raise ValueError("The layout must be a list of room types.")

#     # Define Vastu constraints
#     vastu_matrix = {
#         "pooja_room": {"direction": "east-north", "percentage": 0.05},
#         "kitchen": {"direction": "south-east", "percentage": 0.1},
#         "bedroom": {"direction": "south-west", "percentage": 0.2},
#         "living_room": {"direction": "north", "percentage": 0.3},
#         "dining_room": {"direction": "north-west", "percentage": 0.1},
#         "study_room": {"direction": "east", "percentage": 0.05},
#         "storeroom": {"direction": "south-west", "percentage": 0.05},
#         "balcony": {"direction": "west", "percentage": 0.03},
#         "utility_room": {"direction": "north-east", "percentage": 0.02},
#         "guest_room": {"direction": "north-east", "percentage": 0.05},
#         "toilet": {"direction": "north-west", "percentage": 0.05},
#     }

#     # Validate total percentage in Vastu constraints
#     total_percentage = sum(v["percentage"] for v in vastu_matrix.values())
#     if total_percentage > 1.0:
#         raise ValueError(
#             f"Room percentages exceed 100% ({total_percentage * 100:.2f}%). Please adjust vastu_matrix."
#         )

#     # Generate the layout
#     generated_layout = []
#     for room_type in room_list:
#         if room_type not in vastu_matrix:
#             raise ValueError(f"Unknown room type '{room_type}' provided.")
#         vastu_details = vastu_matrix[room_type]
#         room_size = Sq_ft * vastu_details["percentage"]
#         generated_layout.append({
#             "room_type": room_type,
#             "direction": vastu_details["direction"],
#             "size": round(room_size, 2)
#         })

#     # Automatically call generate_layout or generate_house_map
#     print(generated_layout)
#     generate_layout(generated_layout)

#     return generated_layout




# def generate_house_map(layout, Sq_ft):
#     # Initialize figure
#     fig, ax = plt.subplots(figsize=(10, 10))
#     ax.set_xlim(0, 1)
#     ax.set_ylim(0, 1)
#     ax.set_title("House Layout Map", fontsize=16)

#     # Calculate total area of all rooms
#     total_area = sum(room["size"] for room in layout) / Sq_ft

#     # Scale down if the total area exceeds available space
#     if total_area > 1:
#         scale_factor = 1 / total_area
#         for room in layout:
#             room["size"] *= scale_factor

#     # Directions mapping
#     directions = {"north": [], "south": [], "east": [], "west": [],
#                   "north-east": [], "south-west": [], "north-west": [], "south-east": []}

#     # Sort rooms by their direction
#     for room in layout:
#         room_directions = room["direction"].lower().split("-")
#         for dir_part in room_directions:
#             if dir_part in directions:
#                 directions[dir_part].append(room)

#     # Helper function to allocate rooms within a region
#     def allocate_rooms(room_list, x_start, y_start, x_end, y_end):
#         x_offset, y_offset = x_start, y_start
#         remaining_width, remaining_height = x_end - x_start, y_end - y_start

#         for i, room in enumerate(room_list):
#             room_area = room["size"] / Sq_ft  # Normalized area

#             # Calculate room size based on available space
#             room_width = min(remaining_width, (room_area / remaining_height) ** 0.5)
#             room_height = room_area / room_width

#             # Prevent room from exceeding remaining space
#             if room_width > remaining_width or room_height > remaining_height:
#                 print(f"Warning: Adjusting size for {room['room_type']} to fit.")
#                 room_width = remaining_width
#                 room_height = remaining_height

#             # Draw the room
#             color = plt.cm.tab20(i % 20)  # Dynamic color assignment
#             rect = patches.Rectangle(
#                 (x_offset, y_offset), room_width, room_height, linewidth=1, edgecolor='black', facecolor=color, alpha=0.7
#             )
#             ax.add_patch(rect)

#             # Label the room
#             ax.text(
#                 x_offset + room_width / 2,
#                 y_offset + room_height / 2,
#                 f'{room["room_type"]}\n{room["size"]:.1f} SqFt\n({room["direction"]})',
#                 ha="center", va="center", fontsize=8, color="white"
#             )

#             # Update the available space
#             x_offset += room_width
#             remaining_width -= room_width

#             # If space runs out in the current row, move to the next row
#             if remaining_width <= 0:
#                 y_offset += room_height
#                 x_offset = x_start
#                 remaining_width = x_end - x_start

#     # Allocate rooms in their respective directions
#     north_height = 0.5  # Top half for north-related rooms
#     south_height = 0.5  # Bottom half for south-related rooms
#     east_width = 0.5    # Right half for east-related rooms
#     west_width = 0.5    # Left half for west-related rooms

#     # North region (Top half of the layout)
#     allocate_rooms(directions["north"], 0, 0.5, 1, 1)

#     # South region (Bottom half of the layout)
#     allocate_rooms(directions["south"], 0, 0, 1, 0.5)

#     # East region (Right half of the layout)
#     allocate_rooms(directions["east"], 0.5, 0, 1, 0.5)
#     allocate_rooms(directions["east"], 0.5, 0.5, 1, 1)

#     # West region (Left half of the layout)
#     allocate_rooms(directions["west"], 0, 0, 0.5, 0.5)
#     allocate_rooms(directions["west"], 0, 0.5, 0.5, 1)

#     # North-East (Top-right quadrant)
#     allocate_rooms(directions["north-east"], 0.5, 0.5, 1, 1)

#     # South-East (Bottom-right quadrant)
#     allocate_rooms(directions["south-east"], 0.5, 0, 1, 0.5)

#     # North-West (Top-left quadrant)
#     allocate_rooms(directions["north-west"], 0, 0.5, 0.5, 1)

#     # South-West (Bottom-left quadrant)
#     allocate_rooms(directions["south-west"], 0, 0, 0.5, 0.5)

#     # Finalize the plot
#     plt.axis("off")
#     plt.savefig("house_map.png")
#     print("House map saved as 'house_map.png'")
#     plt.close()

# import matplotlib.pyplot as plt
# import matplotlib.patches as patches


# def generate_layout12():
#     fig, ax = plt.subplots()

#     # Set the plot limits and grid
#     ax.set_xlim(0, 20)
#     ax.set_ylim(0, 15)
#     ax.set_aspect('equal', adjustable='box')
#     ax.grid(visible=True, color='gray', linestyle='--', linewidth=0.5)

#     def draw_room(x, y, width, height, label):
#         # Draw a rectangle representing a room
#         ax.add_patch(patches.Rectangle((x, y), width, height, edgecolor='red', facecolor='none'))
#         # Add label to the center of the room
#         ax.text(x + width / 2, y + height / 2, label, ha='center', va='center', fontsize=8)

#     # Draw rooms with their positions and sizes
#     draw_room(1, 10, 4, 3, "Kitchen1")
#     draw_room(1, 6, 4, 3, "Kitchen2")
#     draw_room(5, 6, 6, 3, "Living")
#     draw_room(5, 10, 6, 3, "DiningRoom")
#     draw_room(11, 13, 6, 3, "BedRoom1")
#     draw_room(11, 10, 3, 3, "Toilet2")
#     draw_room(8, 6, 3, 3, "Toilet1")
#     draw_room(14, 6, 6, 3, "BedRoom2")
#     draw_room(17, 10, 3, 3, "Toilet3")
#     draw_room(14, 10, 6, 6, "BedRoom3")

#     # Add cardinal directions
#     ax.text(10, 14.5, "N", ha='center', va='center', fontsize=12, fontweight='bold')
#     ax.text(10, 0.5, "S", ha='center', va='center', fontsize=12, fontweight='bold')
#     ax.text(19.5, 7.5, "W", ha='center', va='center', fontsize=12, fontweight='bold')
#     ax.text(0.5, 7.5, "E", ha='center', va='center', fontsize=12, fontweight='bold')

#     # Show the plot
#     plt.show()
# generate_layout12()

# Generate the layout

# def generate_layout(layout):
#     import matplotlib.pyplot as plt
#     import matplotlib.patches as patches

#     # Initialize figure
#     fig, ax = plt.subplots(figsize=(10, 10))
#     ax.set_xlim(-5, 15)
#     ax.set_ylim(-5, 15)
#     ax.set_title("House Layout", fontsize=16)

#     # Default room setup with coordinates and sizes
#     rooms = [
#         {"name": None, "x": -4, "y": 3, "width": 4, "height": 3},  # Placeholder for room names
#         {"name": None, "x": -4, "y": 0, "width": 4, "height": 3},
#         {"name": None, "x": 0, "y": 0, "width": 5, "height": 3},
#         {"name": None, "x": 0, "y": 3, "width": 5, "height": 4},
#         {"name": None, "x": 5, "y": 4, "width": 4, "height": 3},
#         {"name": None, "x": 7, "y": 1, "width": 3, "height": 3},
#         {"name": None, "x": 10, "y": 0, "width": 4, "height": 3},
#         {"name": None, "x": 5, "y": 0, "width": 2, "height": 2},
#         {"name": None, "x": 5, "y": 2, "width": 2, "height": 2},
#         {"name": None, "x": 10, "y": 3, "width": 2, "height": 2},
#     ]

#     # Map layout room types to available spaces in the house
#     layout_rooms = {room["room_type"]: room for room in layout}
#     used_rooms = set()

#     # Assign names from the layout to predefined rooms
#     for room in rooms:
#         # Find the first available room from the layout that hasn't been assigned yet
#         for room_type, room_details in layout_rooms.items():
#             if room_type not in used_rooms:
#                 room["name"] = room_type.replace("_", " ").capitalize()
#                 used_rooms.add(room_type)
#                 break

#     # Mark remaining rooms as "Unused" if not assigned
#     for room in rooms:
#         if room["name"] is None:
#             room["name"] = "Unused"

#     # Draw rectangles for each room
#     for room in rooms:
#         rect = patches.Rectangle(
#             (room["x"], room["y"]), room["width"], room["height"], 
#             linewidth=1, edgecolor='red', facecolor='none'
#         )
#         ax.add_patch(rect)
#         ax.text(
#             room["x"] + room["width"] / 2, room["y"] + room["height"] / 2, 
#             room["name"], ha="center", va="center", fontsize=10, color="red"
#         )

#     # Add cardinal directions
#     ax.text(5, 14, "N", ha="center", va="center", fontsize=16, color="black")
#     ax.text(5, -4, "S", ha="center", va="center", fontsize=16, color="black")
#     ax.text(-4, 5, "E", ha="center", va="center", fontsize=16, color="black")
#     ax.text(14, 5, "W", ha="center", va="center", fontsize=16, color="black")

#     # Finalize layout
#     plt.grid(True, which='both', linestyle='--', linewidth=0.5)
#     plt.savefig("house_layout2.png")
#     plt.show()


def plot_similar_layout():
    # Initialize the plot
    fig, ax = plt.subplots(figsize=(12, 8))
    ax.set_xlim(-1, 25)
    ax.set_ylim(-1, 20)
    ax.set_title("House Layout", fontsize=16)

    # Room definitions (name, x, y, width, height)
    rooms = [
        {"name": "Kitchen", "x": 1, "y": 14, "width": 4, "height": 4},
        {"name": "DiningRoom", "x": 5, "y": 12.5, "width": 6, "height": 5.5},
        {"name": "Study 2", "x": 1, "y": 8.5, "width": 4, "height": 5.5},
        {"name": "Study 1", "x": 5, "y": 7, "width": 5, "height": 5.5},
        {"name": "Treasury Room 4", "x": 1, "y": 2.5, "width": 4, "height": 4},
        {"name": "BR2", "x": 5, "y": 3, "width": 5, "height": 4},
        {"name": "Lib", "x": 10, "y": 2.5, "width": 4, "height": 5.5},
        {"name": "Living", "x": 11, "y": 8, "width": 6, "height": 8},
        {"name": "BedRoom2", "x": 17, "y": 12, "width": 4, "height": 6},
        {"name": "BedRoom1", "x": 21, "y": 8.5, "width": 3, "height": 6},
        {"name": "BR1", "x": 20, "y": 7, "width": 2, "height": 1.5},
        {"name": "Guest Room 3", "x": 20, "y": 3, "width": 4, "height": 4},
        {"name": "Play Room", "x": 17, "y": 6, "width": 3, "height": 6},
        {"name": "WC2", "x": 14, "y": 4, "width": 2, "height": 2},
        {"name": "WC1", "x": 16, "y": 2.5, "width": 2, "height": 2},
        {"name": "Ent", "x": 1, "y": 6.5, "width": 2, "height": 2},
    ]

    # Draw rooms
    for room in rooms:
        rect = patches.Rectangle(
            (room["x"], room["y"]), room["width"], room["height"],
            linewidth=1, edgecolor="red", facecolor="none"
        )
        ax.add_patch(rect)
        ax.text(
            room["x"] + room["width"] / 2,
            room["y"] + room["height"] / 2,
            room["name"],
            ha="center", va="center", fontsize=8, color="red"
        )

    # Add cardinal directions
    ax.text(12, 19.5, "N", ha="center", va="center", fontsize=16, color="black")
    ax.text(12, -0.5, "S", ha="center", va="center", fontsize=16, color="black")
    ax.text(-0.5, 10, "E", ha="center", va="center", fontsize=16, color="black")
    ax.text(24.5, 10, "W", ha="center", va="center", fontsize=16, color="black")

    # Grid and display
    plt.grid(True, linestyle="--", linewidth=0.5)
    plt.show()

plot_similar_layout()

#big house layout
def plot_house_layout():
    # Initialize the plot
    fig, ax = plt.subplots(figsize=(12, 8))
    ax.set_xlim(-1, 15)
    ax.set_ylim(-1, 10)
    ax.set_title("House Layout", fontsize=16)

    # Room definitions (name, x, y, width, height)
    rooms = [
        {"name": "PoojaRoom", "x": 0, "y": 6, "width": 2, "height": 2},
        {"name": "StudyRoom1", "x": 0, "y": 4.5, "width": 1.8, "height": 1.5},
        {"name": "Kitchen", "x": 0, "y": 2.5, "width": 1.8, "height": 2},
        {"name": "DiningRoom", "x": 0, "y": 0, "width": 1.8, "height": 2.5},
        {"name": "DrawingRoom", "x": 1.8, "y": 0, "width": 3.2, "height": 4},
        {"name": "Varandah", "x": 1.8, "y": 4, "width": 3.2, "height": 2},
        {"name": "BedRoom2", "x": 2, "y": 6, "width": 3, "height": 2},
        {"name": "CourtYard", "x": 5, "y": 5.5, "width": 4, "height": 2},
        {"name": "ChildrenRoom", "x": 5, "y": 3.5, "width": 4, "height": 2},
        {"name": "Store", "x": 5, "y": 0, "width": 4, "height": 3.5},
        {"name": "GuestRoom", "x": 9, "y": 4, "width": 3, "height": 2},
        {"name": "TreasuryRoom", "x": 9, "y": 2, "width": 3, "height": 2},
        {"name": "Bath", "x": 9, "y": 1, "width": 3, "height": 1},
        {"name": "BedRoom", "x": 12, "y": 0, "width": 2, "height": 3},
        {"name": "Staircase", "x": 12, "y": 3, "width": 1, "height": 2},
        {"name": "Garage", "x": 9, "y": 6, "width": 2, "height": 1},
    ]

    # Draw rooms
    for room in rooms:
        rect = patches.Rectangle(
            (room["x"], room["y"]), room["width"], room["height"],
            linewidth=1, edgecolor="red", facecolor="none"
        )
        ax.add_patch(rect)
        ax.text(
            room["x"] + room["width"] / 2,
            room["y"] + room["height"] / 2,
            room["name"],
            ha="center", va="center", fontsize=8, color="red"
        )

    # Add cardinal directions
    ax.text(7.5, 9, "N", ha="center", va="center", fontsize=16, color="black")
    ax.text(7.5, -0.5, "S", ha="center", va="center", fontsize=16, color="black")
    ax.text(-0.5, 5, "E", ha="center", va="center", fontsize=16, color="black")
    ax.text(14.5, 5, "W", ha="center", va="center", fontsize=16, color="black")

    # Entrance indicators
    ax.plot([13.5, 14.5], [8.5, 8.5], color="black", linewidth=3)
    ax.text(13.5, 8.6, "Entrance", fontsize=8, ha="center", va="center")

    plt.grid(True, linestyle="--", linewidth=0.5)
    plt.show()
plot_house_layout()
#small house
def generate_layout123():
    # Initialize figure
    fig, ax = plt.subplots(figsize=(10, 10))
    ax.set_xlim(-5, 15)
    ax.set_ylim(-5, 15)
    ax.set_title("House Layout", fontsize=16)
    
    # Draw rectangles for each room
    rooms = [
        {"name": "Kitchen1", "x": -4, "y": 3, "width": 4, "height": 3},
        {"name": "Kitchen2", "x": -4, "y": 0, "width": 4, "height": 3},
        {"name": "Living", "x": 0, "y": 0, "width": 5, "height": 3},
        {"name": "DiningRoom", "x": 0, "y": 3, "width": 5, "height": 4},
        {"name": "BedRoom1", "x": 5, "y": 4, "width": 4, "height": 3},
        {"name": "BedRoom2", "x": 7, "y": 1, "width": 3, "height": 3},
        {"name": "BedRoom3", "x": 10, "y": 0, "width": 4, "height": 3},
        {"name": "Toilet1", "x": 5, "y": 0, "width": 2, "height": 2},
        {"name": "Toilet2", "x": 5, "y": 2, "width": 2, "height": 2},
        {"name": "Toilet3", "x": 10, "y": 3, "width": 2, "height": 2},
    ]

    for room in rooms:
        rect = patches.Rectangle(
            (room["x"], room["y"]), room["width"], room["height"], 
            linewidth=1, edgecolor='red', facecolor='none'
        )
        ax.add_patch(rect)
        ax.text(
            room["x"] + room["width"] / 2, room["y"] + room["height"] / 2, 
            room["name"], ha="center", va="center", fontsize=10, color="red"
        )

    # Add cardinal directions
    ax.text(5, 14, "N", ha="center", va="center", fontsize=16, color="black")
    ax.text(5, -4, "S", ha="center", va="center", fontsize=16, color="black")
    ax.text(-4, 5, "E", ha="center", va="center", fontsize=16, color="black")
    ax.text(14, 5, "W", ha="center", va="center", fontsize=16, color="black")

    # Finalize layout
    plt.grid(True, which='both', linestyle='--', linewidth=0.5)
    plt.savefig("house_layout2.png")
    plt.show()
    
# generate_layout123()


# def generate_layout1234():
#     # Initialize figure
#     fig, ax = plt.subplots(figsize=(10, 10))
#     ax.set_xlim(-5, 15)
#     ax.set_ylim(-5, 15)
#     ax.set_title("House Layout", fontsize=16)
    
#     # Draw rectangles for each room
#     rooms = [
#         {"name": "Living_room_1", "x": -4, "y": 4, "width": 4, "height": 3},
#         {"name": "Laundary_room", "x": -4, "y": 3, "width": 4, "height": 1},
#         {"name": "Kitchen1", "x": -4, "y": 0, "width": 4, "height": 3},
#         {"name": "Living_room_2", "x": 2, "y": 0, "width": 3, "height": 4},
#         {"name": "DiningRoom", "x": 0, "y": 4, "width": 4, "height": 3},
#         {"name": "BedRoom1", "x": 4, "y": 4, "width": 4, "height": 3},
#         {"name": "BedRoom2", "x": 7, "y": 0, "width": 3, "height": 4},
#         {"name": "BedRoom3", "x": 10, "y": 0, "width": 4, "height": 3},
#         {"name": "Toilet1", "x": 0, "y": 0, "width": 2, "height": 2},
#         {"name": "Study_room_1", "x": 0, "y": 2, "width": 2, "height": 2},
#         {"name": "Library", "x": 8, "y": 4, "width": 2, "height": 3},
#         {"name": "Toilet2", "x": 5, "y": 0, "width": 2, "height": 4},
#         {"name": "Toilet3", "x": 10, "y": 5, "width": 2, "height": 2},
#         {"name": "Study_room_2", "x": 10, "y": 3, "width": 4, "height": 2},
        
#     ]

#     for room in rooms:
#         rect = patches.Rectangle(
#             (room["x"], room["y"]), room["width"], room["height"], 
#             linewidth=1, edgecolor='red', facecolor='none'
#         )
#         ax.add_patch(rect)
#         ax.text(
#             room["x"] + room["width"] / 2, room["y"] + room["height"] / 2, 
#             room["name"], ha="center", va="center", fontsize=10, color="red"
#         )

#     # Add cardinal directions
#     ax.text(5, 14, "N", ha="center", va="center", fontsize=16, color="black")
#     ax.text(5, -4, "S", ha="center", va="center", fontsize=16, color="black")
#     ax.text(-4, 5, "E", ha="center", va="center", fontsize=16, color="black")
#     ax.text(14, 5, "W", ha="center", va="center", fontsize=16, color="black")

#     # Finalize layout
#     plt.grid(True, which='both', linestyle='--', linewidth=0.5)
#     plt.savefig("house_layout2.png")
#     plt.show()
    
# generate_layout1234()

def generate_layout1234():
    # Initialize figure
    fig, ax = plt.subplots(figsize=(10, 10))  # Ensure the figure is square
    ax.set_xlim(-5, 15)  # Keep limits equal for square appearance
    ax.set_ylim(-5, 15)
    ax.set_aspect('equal')  # Force square aspect ratio
    ax.set_title("House Layout", fontsize=16)
    
    # Draw rectangles for each room
    rooms = [
        {"name": "Living_room_1", "x": -4, "y": 5, "width": 3, "height": 3},
        {"name": "Laundary_room", "x": -4, "y": 3, "width": 3, "height": 2},
        {"name": "Kitchen1", "x": -4, "y": 0, "width": 3, "height": 3},
        {"name": "Living_room_2", "x": 2, "y": 0, "width": 3, "height": 4},
        {"name": "DiningRoom", "x": -1, "y": 4, "width": 4, "height": 4},
        {"name": "BedRoom1", "x": 3, "y": 4, "width": 4, "height": 4},
        {"name": "BedRoom2", "x": 7, "y": 0, "width": 3, "height": 4},
        {"name": "BedRoom3", "x": 10, "y": 0, "width": 4, "height": 4},
        {"name": "Toilet1", "x": -1, "y": 0, "width": 3, "height": 2},
        {"name": "Study_room_1", "x": -1, "y": 2, "width": 3, "height": 2},
        {"name": "Library", "x": 7, "y": 4, "width": 3, "height": 4},
        {"name": "Toilet2", "x": 5, "y": 0, "width": 2, "height": 2},
        {"name": "Toilet3", "x": 5, "y": 2, "width": 2, "height": 2},
        {"name": "Study_room_2", "x": 10, "y": 4, "width": 4, "height": 4},
    ]

    for room in rooms:
        rect = patches.Rectangle(
            (room["x"], room["y"]), room["width"], room["height"], 
            linewidth=1, edgecolor='red', facecolor='none'
        )
        ax.add_patch(rect)
        ax.text(
            room["x"] + room["width"] / 2, room["y"] + room["height"] / 2, 
            room["name"], ha="center", va="center", fontsize=10, color="red"
        )

    # Add cardinal directions
    ax.text(5, 14, "N", ha="center", va="center", fontsize=16, color="black")
    ax.text(5, -4, "S", ha="center", va="center", fontsize=16, color="black")
    ax.text(-4, 5, "E", ha="center", va="center", fontsize=16, color="black")
    ax.text(14, 5, "W", ha="center", va="center", fontsize=16, color="black")

    # Finalize layout
    plt.grid(True, which='both', linestyle='--', linewidth=0.5)
    plt.savefig("house_layout_square.png")
    plt.show()
    
generate_layout1234()


# def generate_house_map(layout, Sq_ft):
#     # Initialize figure
#     fig, ax = plt.subplots(figsize=(10, 10))
#     ax.set_xlim(0, 1)
#     ax.set_ylim(0, 1)
#     ax.set_title("House Layout Map", fontsize=16)

#     # Calculate total area of all rooms
#     total_area = sum(room["size"] for room in layout) / Sq_ft

#     # Scale down if the total area exceeds available space
#     if total_area > 1:
#         scale_factor = 1 / total_area
#         for room in layout:
#             room["size"] *= scale_factor

#     # Directions mapping (only considering primary directions)
#     directions = {"north": [], "south": [], "east": [], "west": []}

#     # Sort rooms by their primary direction (ignoring sub-directions like 'east-north')
#     for room in layout:
#         room_directions = room["direction"].lower().split("-")
#         primary_direction = room_directions[0]  # Use only the first part (primary direction)
#         if primary_direction in directions:
#             directions[primary_direction].append(room)

#     # Define the available regions for each direction
#     north_height = 0.25  # Top portion for north-related rooms
#     south_height = 0.25  # Bottom portion for south-related rooms
#     east_width = 0.25    # Right portion for east-related rooms
#     west_width = 0.25    # Left portion for west-related rooms

#     # Helper function to allocate rooms within a region
#     def allocate_rooms(room_list, x_start, y_start, width, height):
#         x_offset, y_offset = x_start, y_start
#         remaining_width, remaining_height = width, height

#         for i, room in enumerate(room_list):
#             room_area = room["size"] / Sq_ft  # Normalized area

#             # Calculate room size based on available space
#             room_width = min(remaining_width, (room_area / remaining_height) ** 0.5)
#             room_height = room_area / room_width

#             # Prevent room from exceeding remaining space
#             if room_width > remaining_width or room_height > remaining_height:
#                 print(f"Warning: Adjusting size for {room['room_type']} to fit.")
#                 room_width = remaining_width
#                 room_height = remaining_height

#             # Draw the room
#             color = plt.cm.tab20(i % 20)  # Dynamic color assignment
#             rect = patches.Rectangle(
#                 (x_offset, y_offset), room_width, room_height, linewidth=1, edgecolor='black', facecolor=color, alpha=0.7
#             )
#             ax.add_patch(rect)

#             # Label the room
#             ax.text(
#                 x_offset + room_width / 2,
#                 y_offset + room_height / 2,
#                 f'{room["room_type"]}\n{room["size"]:.1f} SqFt\n({room["direction"]})',
#                 ha="center", va="center", fontsize=8, color="white"
#             )

#             # Update the available space
#             x_offset += room_width
#             remaining_width -= room_width

#             # If space runs out in the current row, move to the next row
#             if remaining_width <= 0:
#                 y_offset += room_height
#                 x_offset = x_start
#                 remaining_width = width

#     # Allocate rooms in their respective directions
#     allocate_rooms(directions["north"], 0, 0.75, 1, north_height)
#     allocate_rooms(directions["south"], 0, 0, 1, south_height)
#     allocate_rooms(directions["east"], 0.75, 0, east_width, 1)
#     allocate_rooms(directions["west"], 0, 0, west_width, 1)

#     # Finalize the plot
#     plt.axis("off")
#     plt.savefig("house_map1.png")
#     print("House map saved as 'house_map.png'")
#     plt.close()
# generate_house_map()


# def generate_house_map(layout, Sq_ft):
#     fig, ax = plt.subplots(figsize=(10, 10))
#     ax.set_xlim(0, 1)
#     ax.set_ylim(0, 1)
#     ax.set_title("House Layout Map", fontsize=16)

#     # Calculate total area and adjust rooms proportionally if necessary
#     total_area = sum(room["size"] for room in layout) / Sq_ft

#     if total_area > 1:
#         scale_factor = 1 / total_area
#         for room in layout:
#             room["size"] *= scale_factor

#     # Directions dictionary to classify rooms by direction
#     directions = {"north": [], "south": [], "east": [], "west": [], "center": []}

#     for room in layout:
#         direction = room.get("direction", "").lower()
#         if "north" in direction:
#             directions["north"].append(room)
#         elif "south" in direction:
#             directions["south"].append(room)
#         elif "east" in direction:
#             directions["east"].append(room)
#         elif "west" in direction:
#             directions["west"].append(room)
#         else:
#             directions["center"].append(room)

#     # Define helper function to allocate rooms and handle collisions
#     def allocate_rooms(room_list, start_x, start_y, width, height):
#         x_offset, y_offset = start_x, start_y
#         remaining_width, remaining_height = width, height
#         used_space = []  # Keeps track of used spaces to avoid collisions

#         for room in room_list:
#             room_area = room["size"] / Sq_ft  # Normalized room area
#             room_width = min(remaining_width, (room_area / remaining_height) ** 0.5)
#             room_height = room_area / room_width

#             if room_width > remaining_width or room_height > remaining_height:
#                 print(f"Warning: Adjusting size for {room['room_type']} to fit.")
#                 room_width = remaining_width
#                 room_height = remaining_height

#             # Avoid overlap by checking the space before placing
#             while any(
#                 (x_offset <= x < x_offset + room_width and y_offset <= y < y_offset + room_height)
#                 for (x, y, w, h) in used_space
#             ):
#                 # Adjust position if space is already used
#                 y_offset += room_height
#                 if y_offset + room_height > start_y + height:
#                     x_offset += room_width
#                     y_offset = start_y

#             # Place the room
#             color = plt.cm.tab20(len(used_space) % 20)
#             rect = patches.Rectangle(
#                 (x_offset, y_offset), room_width, room_height, linewidth=1, edgecolor='black', facecolor=color, alpha=0.7
#             )
#             ax.add_patch(rect)

#             ax.text(
#                 x_offset + room_width / 2,
#                 y_offset + room_height / 2,
#                 f'{room["room_type"]}\n{room["size"]:.1f} SqFt',
#                 ha="center", va="center", fontsize=8, color="white"
#             )

#             used_space.append((x_offset, y_offset, room_width, room_height))  # Track used space

#             x_offset += room_width
#             remaining_width -= room_width
#             if remaining_width <= 0:
#                 y_offset += room_height
#                 x_offset = start_x
#                 remaining_width = width

#     # Allocate rooms based on direction, respecting the regions for each direction
#     # North: Place in upper part
#     allocate_rooms(directions["north"], 0, 0.5, 1, 0.5)
#     # South: Place in lower part
#     allocate_rooms(directions["south"], 0, 0, 1, 0.5)
#     # East: Place to the right
#     allocate_rooms(directions["east"], 0.5, 0, 0.5, 1)
#     # West: Place to the left
#     allocate_rooms(directions["west"], 0, 0, 0.5, 1)
#     # Center: Place remaining rooms in the middle area
#     allocate_rooms(directions["center"], 0, 0, 1, 1)

#     # Finalize the plot
#     plt.axis("off")
#     plt.savefig("house_map.png")
#     print("House map saved as 'house_map.png'")
#     plt.show()

@app.route('/generate_layout', methods=['GET'])
def api_generate_layout():
    try:
        
        Sq_ft = app_data.get('Sq_ft')
        client_entities = app_data.get('client_entities', [])

        present_components = []
        
        for entity in client_entities:
            entity_type = re.sub(r'\d+', '', entity).strip()  
            if entity_type in essential_components:
                present_components.append(entity_type)
        
        missing_components = [component for component in essential_components if component not in present_components]

        if missing_components:
            return jsonify({
                "error": "Missing essential components.",
                "missing_components": missing_components
            }), 400

        if not Sq_ft or not client_entities:
            return jsonify({
                "error": "Insufficient data: Please make sure Sq_ft and client_entities are present."
            }), 400

        # layout = generate_layout(Sq_ft, client_entities)
        # print(layout)
        layout = generate_vastu_matrix(client_entities,Sq_ft)
        # print(layout)
        if "error" in layout:
            return jsonify(layout), 500

        description = generate_description()
        if isinstance(description, dict) and "error" in description:
            return jsonify(description), 400

        app_data["layout"] = layout
        app_data["description"] = description

        save_to_json_file(app_data)

        return jsonify({
            "layout": layout,
            "description": description
        }), 200

    except Exception as e:
        print(f"An unexpected error occurred in /generate_layout: {e}")
        return jsonify({"error": str(e)}), 500

# @app.route('/generate_description', methods=['GET'])
# def api_generate_description():
#     description = generate_description()

#     if isinstance(description, dict) and "error" in description:
#         return jsonify(description), 400

#     return jsonify(description), 200


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8000, debug=True)
