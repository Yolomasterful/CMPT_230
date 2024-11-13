#macro TS 16 
var _w = ceil(room_width / TS); 
var _h = ceil(room_height / TS); 

//Create motion planning grid 
global.mp_grid = mp_grid_create(0, 0, _w, _h, TS, TS); 

// Get the tilemap layer ID for the walls
var wall_tilemap_layer_id = layer_tilemap_get_id("Walls");

// Loop over each cell in the grid to check if it contains a wall tile
for (var gx = 0; gx < _w; gx++) {
    for (var gy = 0; gy < _h; gy++) {
        // Calculate the pixel position of the cell's center
        var cell_x = gx * TS + TS / 2;
        var cell_y = gy * TS + TS / 2;

        // Check if there's a wall tile at this cell's location
        if (tilemap_get_at_pixel(wall_tilemap_layer_id, cell_x, cell_y) != 0) {
            // Mark this cell as an obstacle in the mp_grid
            mp_grid_add_cell(global.mp_grid, gx, gy);
        }
    }
}