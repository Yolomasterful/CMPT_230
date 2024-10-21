// Step 1: Get the tilemap ID
var _tilemap = layer_tilemap_get_id("Walls"); // Use the name of your tilemap layer

// Step 2: Ensure that the tilemap exists
if (_tilemap != -1) {
    // Step 3: Get the width and height of the tilemap in tiles
    var _map_w = tilemap_get_width(_tilemap);
    var _map_h = tilemap_get_height(_tilemap);
    
    // Step 4: Loop through each tile in the tilemap
    for (var yy = 0; yy < _map_h; yy++) {
        for (var xx = 0; xx < _map_w; xx++) {
            // Step 5: Get the tile at this position
            var _tile = tilemap_get(_tilemap, xx, yy);
            
            // Step 6: Check if this tile is a wall (collidable tile)
            // Adjust the tile index to match the collidable tiles in your tileset
            if (_tile > 0) { // Assuming non-zero tiles are walls/collidables
                // Step 7: Create a collision object at this position
                instance_create_layer(xx * tilemap_get_tile_width(_tilemap), yy * tilemap_get_tile_height(_tilemap), "Collision", obj_collision_object);
            }
        }
    }
}


			
	
