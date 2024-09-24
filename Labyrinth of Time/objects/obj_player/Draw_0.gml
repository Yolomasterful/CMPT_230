draw_self();
/*
//Visualize Collision Space for Flooring
var rows = floor(sprite_height / 4) + 2;
var cols = floor(sprite_width / 4) + 2;

var temp_x = 0;
var temp_y = 0;

for (var i = 0; i < rows; i++) {
	for (var j = 0; j < cols; j++) {
		if (i >= rows/2) {
			temp_y = sprite_height - ((i - (rows / 2)) * 4) - 1;
		} else {
			temp_y = i * 4;
		}
		if (j >= cols/2) {
			temp_x = sprite_width - ((j - (cols / 2)) * 4) - 1;
		} else {
			temp_x = j * 4;
		}
		draw_set_color(c_purple);
		draw_point(x+temp_x, y+temp_y);
	}
}*/