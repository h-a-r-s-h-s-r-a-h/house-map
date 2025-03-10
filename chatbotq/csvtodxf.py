# import csv
# import ezdxf

# # Create a new DXF document
# doc = ezdxf.new("R2010")
# msp = doc.modelspace()

# # Define layers for better organization
# doc.layers.new(name="Rooms", dxfattribs={"color": 1})  # Red
# doc.layers.new(name="Doors", dxfattribs={"color": 3})  # Green
# doc.layers.new(name="Windows", dxfattribs={"color": 4})  # Cyan
# doc.layers.new(name="Walls", dxfattribs={"color": 5})  # Blue
# doc.layers.new(name="Labels", dxfattribs={"color": 6})  # Magenta

# # Read the CSV file
# csv_file_path = "asked.csv"
# with open(csv_file_path, 'r') as csvfile:
#     reader = csv.reader(csvfile)
    
#     # Skip header row
#     next(reader)
    
#     for row in reader:
#         element_type, name, length, width, x_pos, y_pos, rotation, color = row
        
#         length = float(length)
#         width = float(width)
#         x_pos = float(x_pos)
#         y_pos = float(y_pos)
#         rotation = float(rotation)
        
#         # Handle "Room" element_type
#         if element_type.lower() == "room":
#             # Add the room rectangle
#             msp.add_lwpolyline(
#                 [
#                     (x_pos, y_pos),
#                     (x_pos + length, y_pos),
#                     (x_pos + length, y_pos + width),
#                     (x_pos, y_pos + width),
#                     (x_pos, y_pos),  # Closing the rectangle
#                 ],
#                 close=True,
#                 dxfattribs={"layer": "Rooms"}
#             )
#             # Add a label in the center of the room
#             text = msp.add_text(
#                 name,
#                 dxfattribs={
#                     "layer": "Labels",
#                     "height": 10  # Text height
#                 }
#             )
#             # Position the text at the center of the room
#             text.dxf.insert = (x_pos + length / 2, y_pos + width / 2)

#         # Handle "Door" element_type
#         elif element_type.lower() == "door":
#             msp.add_lwpolyline(
#                 [
#                     (x_pos, y_pos),
#                     (x_pos + length, y_pos),
#                     (x_pos + length, y_pos + width),
#                     (x_pos, y_pos + width),
#                     (x_pos, y_pos),  # Closing the rectangle
#                 ],
#                 close=True,
#                 dxfattribs={"layer": "Doors"}
#             )
        
#         # Handle "Wall" element_type
#         elif element_type.lower() == "wall":
#             msp.add_line(
#                 (x_pos, y_pos),
#                 (x_pos + length, y_pos + width),
#                 dxfattribs={"layer": "Walls"}
#             )
        
#         # Handle "Window" element_type
#         elif element_type.lower() == "window":
#             msp.add_lwpolyline(
#                 [
#                     (x_pos, y_pos),
#                     (x_pos + length, y_pos),
#                     (x_pos + length, y_pos + width),
#                     (x_pos, y_pos + width),
#                     (x_pos, y_pos),  # Closing the rectangle
#                 ],
#                 close=True,
#                 dxfattribs={"layer": "Windows"}
#             )

# # Save the DXF file
# output_path = "output_with_labels.dxf"
# doc.saveas(output_path)

# print(f"DXF file with labels saved as {output_path}")


import csv
import ezdxf

def csv_to_dxf(csv_file, output_dxf):
    # Create a new DXF document
    doc = ezdxf.new()
    msp = doc.modelspace()

    # Read the CSV data
    with open(csv_file, 'r') as file:
        reader = csv.DictReader(file)
        for row in reader:
            element_type = row['Element_Type']
            name = row['Name']
            length = float(row['Length'])
            width = float(row['Width'])
            x = float(row['X_Position'])
            y = float(row['Y_Position'])
            rotation = float(row['Rotation'])
            color = row['Color']

            # Set colors using ezdxf color index
            dxf_color = {
                'Green': 3, 'LightGreen': 102, 'Beige': 50, 'Gold': 12,
                'Purple': 6, 'DarkPurple': 31, 'LightBlue': 5, 'Blue': 4,
                'Orange': 30, 'Yellow': 2, 'Brown': 33, 'DarkBrown': 141,
                'DarkRed': 1, 'LightPurple': 182, 'Gray': 8
            }.get(color, 7)  # Default to white if color not found

            # Draw rectangles for rooms and doors
            points = [(x, y), (x + length, y), (x + length, y + width), (x, y + width)]
            msp.add_lwpolyline(points, close=True, dxfattribs={'color': dxf_color})

            # Add labels for rooms and other elements
            if element_type in ['Room', 'Door']:
                label_x = x + length / 2
                label_y = y + width / 2
                msp.add_text(name, dxfattribs={'height': 10, 'color': 1, 'insert': (label_x, label_y), 'rotation': 0})

            # Draw lines for walls
            elif element_type == 'Wall':
                if rotation == 90:
                    msp.add_line((x, y), (x, y + width), dxfattribs={'color': dxf_color})
                else:
                    msp.add_line((x, y), (x + length, y), dxfattribs={'color': dxf_color})
                # Add wall label at the midpoint
                label_x = x + length / 2 if rotation == 0 else x
                label_y = y + width / 2 if rotation == 90 else y
                msp.add_text(name, dxfattribs={'height': 10, 'color': 1, 'insert': (label_x, label_y)})

    # Save the DXF file
    doc.saveas(output_dxf)
    print(f"DXF file '{output_dxf}' created successfully with labels!")

# Example usage
csv_to_dxf('asked.csv', 'output2.dxf')
