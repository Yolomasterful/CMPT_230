function check_tile_inside_collision(x1, y1, x2, y2, tile_layers = []) {
    // Calculate sprite width and height based on top-left (x1, y1) and bottom-right (x2, y2)
    var spr_width = x2 - x1;
    var spr_height = y2 - y1;
    
    // Number of rows and columns divided into quadrants
    var rows = 8;  // Dividing the sprite into 8 rows
    var cols = 8;  // Dividing the sprite into 8 columns
    
    var total_points = 0;
    var colliding_points = 0;
    
    var temp_x, temp_y;

    // Loop through each quadrant
    for (var quadrant_row = 0; quadrant_row < rows; quadrant_row++) {
        for (var quadrant_col = 0; quadrant_col < cols; quadrant_col++) {
            total_points++;
            
            // Calculate the x and y positions of the point based on the quadrant
            temp_x = x1 + (spr_width / cols) * quadrant_col + (spr_width / (cols * 2));  // Adjusting x with spr_width
            temp_y = y1 + (spr_height / rows) * quadrant_row + (spr_height / (rows * 2));  // Adjusting y with spr_height
            
            // Draw a point or circle to show the checking dot for debugging
            draw_point(temp_x, temp_y); // For a simple dot
            // draw_circle(temp_x, temp_y, 1, false); // Alternatively, you can use a circle
            
            // Check for collision with each tile layer
            for (var k = 0; k < array_length(tile_layers); k++) {
                if (tilemap_get_at_pixel(tile_layers[k], temp_x, temp_y) != 0) {
                    colliding_points++;
                }
            }
        }
    }

    return colliding_points / total_points;
}
