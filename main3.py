import re
import matplotlib.pyplot as plt
import matplotlib.patches as patches

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

def generate_vastu_matrix(layout, Sq_ft):
    if not isinstance(Sq_ft, (int, float)) or Sq_ft <= 0:
        raise ValueError("Sq_ft must be a positive number.")

    # Define Vastu constraints with adjusted percentages
    vastu_matrix = {
        "pooja_room": {"direction": "east-north", "percentage": 0.05},
        "kitchen": {"direction": "south-east", "percentage": 0.12},
        "bedroom": {"direction": "south-west", "percentage": 0.2},
        "living_room": {"direction": "north", "percentage": 0.25},
        "dining_room": {"direction": "north-west", "percentage": 0.1},
        "study_room": {"direction": "east", "percentage": 0.05},
        "storeroom": {"direction": "south-west", "percentage": 0.05},
        "balcony": {"direction": "west", "percentage": 0.03},
        "utility_room": {"direction": "north-east", "percentage": 0.05},
        "guest_room": {"direction": "north-east", "percentage": 0.1},
        "bathroom": {"direction": "south-east", "percentage": 0.05},  # Added bathroom
    }

    # Validate total percentage
    total_percentage = sum(v["percentage"] for v in vastu_matrix.values())
    if total_percentage > 1.0:
        raise ValueError("Room percentages exceed 100%. Please adjust vastu_matrix.")

    # Initialize or update layout with Vastu properties
    for room, properties in vastu_matrix.items():
        size = Sq_ft * properties["percentage"]
        if room not in layout:
            layout[room] = {}
        layout[room]["direction"] = properties["direction"]
        layout[room]["size"] = round(size, 2)

    # Check if sizes add up correctly
    total_calculated_size = sum(room.get("size", 0) for room in layout.values())
    if not abs(total_calculated_size - Sq_ft) < 1e-2:  # Allow a small margin of error
        raise ValueError(
            f"Generated layout size ({total_calculated_size}) does not match the specified Sq_ft ({Sq_ft})."
        )

    return layout

def create_2d_map(layout):
    # Create a 20x20 grid for visualization
    fig, ax = plt.subplots(figsize=(10, 10))
    ax.set_xlim(0, 20)
    ax.set_ylim(0, 20)

    # Starting position for placing rooms
    current_x = 0
    current_y = 0
    spacing = 1  # Space between rooms

    for room, details in layout.items():
        width = details["length"]
        height = details["width"]
        
        # Create a rectangle for the room
        rect = patches.Rectangle((current_x, current_y), width, height, edgecolor='black', facecolor='lightblue', alpha=0.5)
        ax.add_patch(rect)
        ax.text(current_x + width / 2, current_y + height / 2, room, 
                horizontalalignment='center', verticalalignment='center', fontsize=10)

        # Move to the next position
        current_x += width + spacing
        if current_x >= 20:  # Move to the next row if we exceed the width
            current_x = 0
            current_y += height + spacing

    plt.title("2D House Layout")
    plt.gca().set_aspect('equal', adjustable='box')
    plt.grid()
    plt.show()

def main():
    print("Welcome to the Vastu House Layout Designer!")
    
    # Get user input for the area of the plot
    Sq_ft = float(input("Enter the total area of the plot (in sq. ft): "))

    # Get user input for the quantity of each room
    client_entities = []
    client_entities.append(input("Enter the number of Pooja Rooms: "))
    client_entities.append(input("Enter the number of Kitchens: "))
    client_entities.append(input("Enter the number of Bedrooms: "))
    client_entities.append(input("Enter the number of Living Rooms: "))
    client_entities.append(input("Enter the number of Dining Rooms: "))
    client_entities.append(input("Enter the number of Bathrooms: "))
    client_entities.append(input("Enter the number of Balconies: "))
    client_entities.append(input("Enter the number of Guest Rooms: "))

    # Generate the layout based on user input
    layout = generate_layout(Sq_ft, client_entities)
    layout = generate_vastu_matrix(layout, Sq_ft)

    # Create a 2D map of the layout
    create_2d_map(layout)

if __name__ == "__main__":
    main()