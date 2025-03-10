import pandas as pd
import matplotlib.pyplot as plt
import matplotlib.patches as patches

# Load CSV data
df = pd.read_csv('asked.csv')

# Define color mapping (custom color names to valid hex codes)
color_mapping = {
    'DarkBrown': '#8B4513',
    'LightPurple': '#D8BFD8',
    'DarkPurple': '#800080',
    'LightBlue': '#ADD8E6',
    'DarkRed': '#8B0000',
    'LightGray': '#D3D3D3',
    'Gray': '#808080',
    'Beige': '#F5F5DC',
    'Gold': '#FFD700',
    # Add more custom colors if needed
}

# Create a plot
fig, ax = plt.subplots(figsize=(10, 10))

# Draw each element in the CSV
for _, row in df.iterrows():
    element_type = row['Element_Type']
    name = row['Name']
    width = row['Width']
    length = row['Length']
    x_pos = row['X_Position']
    y_pos = row['Y_Position']
    color = color_mapping.get(row['Color'], row['Color'])  # Use mapped color if available
    rotation = row['Rotation']

    # Create rectangle with appropriate rotation
    rect = patches.Rectangle((x_pos, y_pos), width, length, angle=rotation,
                             linewidth=1, edgecolor='black', facecolor=color)
    ax.add_patch(rect)
    
    # Add labels for clarity
    plt.text(x_pos + width / 2, y_pos + length / 2, name, fontsize=8, ha='center')

# Set plot limits
ax.set_xlim(0, 1000)
ax.set_ylim(0, 1000)
ax.set_aspect('equal')
plt.gca().invert_yaxis()  # Invert Y-axis to match plotting origin at top-left
plt.axis('off')  # Hide axis labels

# Show the plot
plt.show()
