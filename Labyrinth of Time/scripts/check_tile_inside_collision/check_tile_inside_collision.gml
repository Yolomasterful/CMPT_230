function check_tile_inside_collision(x_pos, y_pos, tile_layers = [], spr_width = sprite_width, spr_height = sprite_height){
	
	var polling = 2;
	
	var rows = spr_height / polling + 2;
	var cols = spr_width / polling + 2;
	
	var total_points = 0;
	var colliding_points = 0;
	
	var temp_x = 0;
	var temp_y = 0;
	
	for (var i = 0; i < rows; i++) {
		for (var j = 0; j < cols; j++) {
			total_points++;
			if (i >= rows/2) {
				temp_y = sprite_height - ((i - (rows / 2)) * polling) - 1;
			} else {
				temp_y = i * polling;
			}
			if (j >= cols/2) {
				temp_x = sprite_width - ((j - (cols / 2)) * polling) - 1;
			} else {
				temp_x = j * polling;
			}
			for (var k = 0; k < array_length(tile_layers); k++) {
				if (tilemap_get_at_pixel(tile_layers[k], x_pos + temp_x, y_pos + temp_y) != 0) {
					colliding_points++;
				}
			}
		}
	}
	return colliding_points / total_points;
}