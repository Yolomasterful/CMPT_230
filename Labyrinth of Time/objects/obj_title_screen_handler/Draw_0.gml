draw_set_font(fnt_title_screen);
draw_sprite(spr_title_card, 0, room_width/2, 200);

var text_y_start = 512;  // Starting Y position for the text
var button_height = 100;  // Height between each button
draw_set_font(fnt_title_screen);
draw_set_halign(fa_center);
for (var i = 0; i < button_count; i++) {
    var text_y_pos = text_y_start + (i * button_height);
    if (selected_button == i) {
        draw_set_color(c_white); // Highlight color
    } else {
        draw_set_color(c_grey);  // Default color
    }
    switch (i) {
        case 0:
            draw_text(512, text_y_pos, "Play");
            break;
        case 1:
            draw_text(512, text_y_pos, "Options");
            break;
		case 2:
            draw_text(512, text_y_pos, "Exit");
            break;
	}
}
