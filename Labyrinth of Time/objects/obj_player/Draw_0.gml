draw_self();

//Prompts
if (min_distance([obj_note, obj_room_boundary]) < sprite_width/2) {
	draw_set_halign(fa_center);
	
	draw_set_font(fnt_dialogue);
	draw_set_color(c_white);
	draw_text(x + sprite_width/2, y + sprite_height, "Interact [E]");
	
	draw_set_halign(fa_left);
}

