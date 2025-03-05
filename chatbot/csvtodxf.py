import csv
import ezdxf

# Create a new DXF document
doc = ezdxf.new("R2010")
msp = doc.modelspace()

# Define layers for better organization
doc.layers.new(name="Rooms", dxfattribs={"color": 1})  # Red
doc.layers.new(name="Doors", dxfattribs={"color": 3})  # Green
doc.layers.new(name="Windows", dxfattribs={"color": 4})  # Cyan
doc.layers.new(name="Walls", dxfattribs={"color": 5})  # Blue
doc.layers.new(name="Labels", dxfattribs={"color": 6})  # Magenta

# Read the CSV file
csv_file_path = "layout.csv"
with open(csv_file_path, 'r') as csvfile:
    reader = csv.reader(csvfile)
    
    # Skip header row
    next(reader)
    
    for row in reader:
        element_type, name, length, width, x_pos, y_pos, rotation, color = row
        
        length = float(length)
        width = float(width)
        x_pos = float(x_pos)
        y_pos = float(y_pos)
        rotation = float(rotation)
        
        # Handle "Room" element_type
        if element_type.lower() == "room":
            # Add the room rectangle
            msp.add_lwpolyline(
                [
                    (x_pos, y_pos),
                    (x_pos + length, y_pos),
                    (x_pos + length, y_pos + width),
                    (x_pos, y_pos + width),
                    (x_pos, y_pos),  # Closing the rectangle
                ],
                close=True,
                dxfattribs={"layer": "Rooms"}
            )
            # Add a label in the center of the room
            text = msp.add_text(
                name,
                dxfattribs={
                    "layer": "Labels",
                    "height": 10  # Text height
                }
            )
            # Position the text at the center of the room
            text.dxf.insert = (x_pos + length / 2, y_pos + width / 2)

        # Handle "Door" element_type
        elif element_type.lower() == "door":
            msp.add_lwpolyline(
                [
                    (x_pos, y_pos),
                    (x_pos + length, y_pos),
                    (x_pos + length, y_pos + width),
                    (x_pos, y_pos + width),
                    (x_pos, y_pos),  # Closing the rectangle
                ],
                close=True,
                dxfattribs={"layer": "Doors"}
            )
        
        # Handle "Wall" element_type
        elif element_type.lower() == "wall":
            msp.add_line(
                (x_pos, y_pos),
                (x_pos + length, y_pos + width),
                dxfattribs={"layer": "Walls"}
            )
        
        # Handle "Window" element_type
        elif element_type.lower() == "window":
            msp.add_lwpolyline(
                [
                    (x_pos, y_pos),
                    (x_pos + length, y_pos),
                    (x_pos + length, y_pos + width),
                    (x_pos, y_pos + width),
                    (x_pos, y_pos),  # Closing the rectangle
                ],
                close=True,
                dxfattribs={"layer": "Windows"}
            )

# Save the DXF file
output_path = "output_with_labels.dxf"
doc.saveas(output_path)

print(f"DXF file with labels saved as {output_path}")
