var scale = min(room_width/1024, room_height/1024);

//Title Card
draw_set_halign(fa_center);

draw_set_font(fnt_title_screen_medium);
draw_text_with_stroke("Labyrinth", room_width/2, room_height*(2/16), c_black, c_white, 4);
draw_set_font(fnt_title_screen_small);
draw_text_with_stroke("of", room_width/2, room_height*(13/64), c_black, c_white, 4);
draw_set_font(fnt_title_screen_large);
draw_text_with_stroke("TIME", room_width/2, room_height*(7/32), c_black, c_white, 4);

//Buttons
var text_y_start = round(room_height*(8/16));  // Starting Y position for the text
var button_height = round(room_height*(1/16));  // Height between each button
draw_set_font(fnt_title_screen_options);
for (var i = 0; i < button_count; i++) {
    var text_y_pos = text_y_start + (i * button_height);
    var maincolor = c_black
	var strokecolor = c_white
	if (selected_button == i) {
		//Highlight
        maincolor = c_white
		strokecolor = c_black
    }
    switch (i) {
        case 0:
			draw_text_with_stroke("Play", room_width/2, text_y_pos, maincolor, strokecolor, 2);
            break;
        case 1:
            draw_text_with_stroke("Options", room_width/2, text_y_pos, maincolor, strokecolor, 2);
            break;
		case 2:
            draw_text_with_stroke("Exit", room_width/2, text_y_pos, maincolor, strokecolor, 2);
            break;
	}
}