draw_set_halign(fa_center);

var scale = min(room_width/1024, room_height/1024);

//Title Card
draw_set_color(c_grey);
draw_set_font(fnt_title_screen_medium);
draw_text_ext_transformed(room_width/2, room_height*(1/4)/2, "Labyrinth", 1, room_width, scale, scale, 0);
draw_set_font(fnt_title_screen_small);
draw_text_ext_transformed(room_width/2, room_height*(2/4)/2, "of", 1, room_width, scale, scale, 0);
draw_set_font(fnt_title_screen_large);
draw_text_ext_transformed(room_width/2, room_height*(5/8)/2, "TIME", 1, room_width, scale, scale, 0);

//Buttons
var text_y_start = round(room_height*(9/16));  // Starting Y position for the text
var button_height = round(room_height*(1/8));  // Height between each button
draw_set_font(fnt_title_screen_options);
for (var i = 0; i < button_count; i++) {
    var text_y_pos = text_y_start + (i * button_height);
    if (selected_button == i) {
        draw_set_color(c_white); // Highlight color
    } else {
        draw_set_color(c_grey);  // Default color
    }
    switch (i) {
        case 0:
            draw_text_ext_transformed(room_width/2, text_y_pos, "Play", 1, room_width, scale, scale, 0);
            break;
        case 1:
            draw_text_ext_transformed(room_width/2, text_y_pos, "Options", 1, room_width, scale, scale, 0);
            break;
		case 2:
            draw_text_ext_transformed(room_width/2, text_y_pos, "Exit", 1, room_width, scale, scale, 0);
            break;
	}
}