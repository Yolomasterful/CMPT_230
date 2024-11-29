event_inherited();

draw_self();

//Prompts
if (min_distance(interactables) < sprite_width/2) {
	draw_set_halign(fa_center);
	
	draw_set_font(fnt_dialogue);
	draw_set_color(c_white);
	draw_text_with_stroke("Interact [E]", x, y + sprite_height/2, c_black, c_white, 1);
	
	draw_set_halign(fa_left);
}