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

from prompts import descriptionPrompt, layoutPrompt, chatPrompt
from store import save_to_json_file, get_latest_data
import matplotlib
matplotlib.use('Agg') 

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
        {"role": "model", "parts": "Great to meet you, I'm Vastu_ChatBot. What would you like to know?"}
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
    "bedroom": ["bedroom", "bedrooms", "guestroom", "guest room"],
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

essential_components = ["bedroom", "toilet", "kitchen", "living_room", "dining_room"]

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


def generate_layout(Sq_ft, client_entities):
    try:
        layout = {}
        total_rooms = len(client_entities)
        
        # Adjust room size based on available Sq_ft
        remaining_area = Sq_ft
        for entity in client_entities:
            # Extract the entity type (e.g., "toilet", "bedroom") and quantity (if any)
            entity_type = re.sub(r'\d+', '', entity).strip()  # Remove numbers for entity type
            quantity = re.findall(r'\d+', entity)  # Extract any number
            
            room_quantity = int(quantity[0]) if quantity else 1  # Default to 1 if no quantity is found
            layout[entity] = {
                "quantity": room_quantity,
                "entity_type": entity_type
            }
        
        # Distribute the remaining area equally
        for room in layout:
            room_size = remaining_area / total_rooms
            layout[room]["length"] = room_size ** 0.5  # Assign a square shape for simplicity
            layout[room]["width"] = room_size ** 0.5  # Assign a square shape for simplicity
            layout[room]["direction"] = "East"  # You can change this logic as needed
            layout[room]["size"] = room_size
        
        return layout

    except Exception as e:
        return {"error": str(e)}





# def generate_vastu_matrix(layout, Sq_ft):
#     if not isinstance(Sq_ft, (int, float)) or Sq_ft <= 0:
#         raise ValueError("Sq_ft must be a positive number.")

#     # Define Vastu constraints with adjusted percentages
#     vastu_matrix = {
#         "pooja_room": {"direction": "east-north", "percentage": 0.05},
#         "kitchen": {"direction": "south-east", "percentage": 0.12},
#         "bedroom": {"direction": "south-west", "percentage": 0.2},
#         "living_room": {"direction": "north", "percentage": 0.25},
#         "dining_room": {"direction": "north-west", "percentage": 0.1},
#         "study_room": {"direction": "east", "percentage": 0.05},
#         "storeroom": {"direction": "south-west", "percentage": 0.05},
#         "balcony": {"direction": "west", "percentage": 0.03},
#         "utility_room": {"direction": "north-east", "percentage": 0.05},
#         "guest_room": {"direction": "north-east", "percentage": 0.1},
#     }

#     # Validate total percentage
#     total_percentage = sum(v["percentage"] for v in vastu_matrix.values())
#     if total_percentage > 1.0:
#         raise ValueError("Room percentages exceed 100%. Please adjust vastu_matrix.")

#     # Initialize or update layout with Vastu properties
#     for room, properties in vastu_matrix.items():
#         size = Sq_ft * properties["percentage"]
#         if room not in layout:
#             layout[room] = {}
#         layout[room]["direction"] = properties["direction"]
#         layout[room]["size"] = round(size, 2)

#     # Check if sizes add up correctly
#     total_calculated_size = sum(room.get("size", 0) for room in layout.values())
#     if not abs(total_calculated_size - Sq_ft) < 1e-2:  # Allow a small margin of error
#         raise ValueError(
#             f"Generated layout size ({total_calculated_size}) does not match the specified Sq_ft ({Sq_ft})."
#         )

#     return layout





# def draw_layout_and_save(layout, Sq_ft):
#     try:
#         import matplotlib.pyplot as plt
#         import os

#         fig, ax = plt.subplots(figsize=(8, 8))  # Use Agg backend to avoid GUI errors
#         ax.set_title(f"Layout for {Sq_ft} Sq Ft")
#         ax.set_xlim(0, 100)
#         ax.set_ylim(0, 100)

#         for idx, (room, details) in enumerate(layout.items()):
#             x, y = idx * 10, idx * 10
#             ax.add_patch(plt.Rectangle((x, y), details["length"], details["width"], edgecolor="blue", fill=None))
#             ax.text(x + 2, y + 2, room, fontsize=10, color="black")

#         # Save the layout to a file
#         image_path = os.path.join("static", "layout.png")
#         os.makedirs("static", exist_ok=True)
#         plt.savefig(image_path)
#         plt.close(fig)
#         return image_path
#     except Exception as e:
#         return {"error": str(e)}



@app.route("/set_Sq_ft", methods=['POST'])
def set_Sq_ft():
    try:
        data = request.json
        if not data or "Sq_ft" not in data: 
            return jsonify({"error": "Sq_ft is required"}), 400
        
        app_data["Sq_ft"] = data["Sq_ft"]
        print("Sq_ft : ", data["Sq_ft"])

        save_to_json_file(app_data)
        return jsonify({"Sq_ft": data["Sq_ft"]}), 200
    
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

        layout = generate_layout(Sq_ft, client_entities)
        print(f"Initial layout: {layout}")
        
        vastu_info = generate_vastu_matrix(layout, Sq_ft)
        print(f"Generated Vastu Matrix: {vastu_info}")
        if "error" in layout:
            return jsonify(layout), 500
        
         # Generate image of layout
        layout_image_path = draw_layout_and_save(vastu_info,Sq_ft)
        print(f"Layout Image Path: {layout_image_path}")

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




if __name__ == "__main__":
    app.run(debug=True)
