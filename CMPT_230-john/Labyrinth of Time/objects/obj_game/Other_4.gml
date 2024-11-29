#macro TS 16 
var _w = ceil(room_width / TS); 
var _h = ceil(room_height / TS); 

// Create a unified motion planning grid
global.combined_mp_grid = mp_grid_create(0, 0, _w, _h, TS, TS); 

// Get the tilemap layer IDs for walls and flooring
var wall_tilemap_layer_id = layer_tilemap_get_id("Walls");
var floor_tilemap_layer_id = layer_tilemap_get_id("Flooring");

// Loop over each cell in the grid
for (var gx = 0; gx < _w; gx++) {
    for (var gy = 0; gy < _h; gy++) {
        var cell_x = gx * TS + TS / 2;
        var cell_y = gy * TS + TS / 2;

        // Check if this cell contains a wall or is missing a floor
        var is_wall = tilemap_get_at_pixel(wall_tilemap_layer_id, cell_x, cell_y) != 0;
        var no_floor = tilemap_get_at_pixel(floor_tilemap_layer_id, cell_x, cell_y) == 0;

        if (is_wall || no_floor) {
            // Mark the cell as an obstacle
            mp_grid_add_cell(global.combined_mp_grid, gx, gy);
        }
    }
}
