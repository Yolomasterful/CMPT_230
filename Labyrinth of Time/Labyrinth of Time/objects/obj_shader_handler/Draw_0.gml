// Activate the shader
shader_set(shd_noblue);

// Get the tilemap ID for your tile layer
var tilemap_id = layer_tilemap_get_id("Flooring"); // Replace with your actual tile layer name

// Check if the tilemap exists
if (tilemap_id != -1) {
    // Draw the tilemap with the shader applied
    draw_tilemap(tilemap_id, 0, 0);
}

// Reset the shader
shader_reset();
