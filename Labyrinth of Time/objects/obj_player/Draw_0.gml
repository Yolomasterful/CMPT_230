draw_self();
if (debugging) {
	check_tile_inside_collision(x - sprite_width/2, y - sprite_height/2 + sprite_height*(4/5), x + sprite_width/2, y + sprite_height/2, flooring_objects);
}
//Prompts
if (min_distance(interactables) < sprite_width/2) {
	draw_set_halign(fa_center);
	
	draw_set_font(fnt_main);
	draw_set_color(c_white);
	draw_text_with_stroke(x, y + sprite_height/2, "Interact [E]", 0, sprite_width*10, 0.4, 0.4, 0, c_black, 1);
}