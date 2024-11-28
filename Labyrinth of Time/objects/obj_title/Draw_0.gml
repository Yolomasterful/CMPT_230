draw_set_halign(fa_center);
draw_set_font(fnt_main);
draw_set_color(c_white);

draw_text_with_stroke(room_width/2, room_height*(1/64), "Labyrinth", 0, room_width, 4, 4, 0, c_black, 6);
draw_text_with_stroke(room_width/2, room_height*(4/32), "of", 0, room_width, 2, 2, 0, c_black, 4);
draw_text_with_stroke(room_width/2, room_height*(5/32), "TIME", 0, room_width, 6, 6, 0, c_black, 8);