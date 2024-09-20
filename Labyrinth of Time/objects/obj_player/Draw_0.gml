draw_self();
draw_set_font(fnt_dialogue);
draw_set_color(c_aqua);
draw_line(-1, 0, room_width * (stamina / max_stamina), 0);

//draw_text(0,0, "Stamina: " + string(stamina));
//draw_text(10, 10, "Player X: " + string(x) + " Y: " + string(y));