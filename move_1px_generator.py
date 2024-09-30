import os
from PIL import Image

def generate_sprite_sheet(image_path, output_path):
    # Open the original 32x32 image
    base_image = Image.open(image_path)
    width, height = base_image.size
    
    # Create a new image for the sprite sheet (32 frames, each 32x32, so 32 * 32 wide)
    sprite_sheet = Image.new("RGBA", (width * height + width, height))

    # Generate 32 frames by shifting the image down by 1px each time
    for i in range(height):
        # Create a copy of the base image to manipulate
        frame = base_image.copy()

        # Shift the image down by i pixels and wrap around
        shifted_frame = Image.new("RGBA", (width, height))
        upper_part = frame.crop((0, 0, width, height))
        lower_part = frame.crop((0, 0, width, height))

        # Paste the cropped parts into the new frame
        shifted_frame.paste(upper_part, (0, i - height))
        shifted_frame.paste(lower_part, (0, i))

        # Paste the shifted frame into the sprite sheet
        sprite_sheet.paste(shifted_frame, (i * width + width, 0))  # Place each frame side by side

    # Save the sprite sheet as a single image file
    sprite_sheet.save(output_path)

# Example usage:
generate_sprite_sheet(os.path.join(os.getcwd(),"input.png"), os.path.join(os.getcwd(),"output.png"))
