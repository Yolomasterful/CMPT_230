draw_self();
draw_set_color(c_white);
draw_set_font(fnt_dialogue);
draw_set_halign(fa_left);

//Stats

//Bars
var x_align = 1;
var bar_length = (room_width / 6);
if (stamina_delay > 0) {
	draw_set_color(c_grey);
	draw_rectangle(x_align, 4, x_align + bar_length * abs(stamina_delay / default_stamina_delay), 4, false);
}
if (stamina > 0) {
	draw_set_color(c_aqua);
	draw_rectangle(x_align, 2, x_align + bar_length * abs(stamina / default_stamina), 3, false);
}
if (dodge_timer > 0) {
	draw_set_color(c_lime);
	draw_rectangle(x_align, 5, x_align + bar_length * abs(dodge_timer / default_dodge_timer), 6, false);
}
//Direction
draw_set_color(c_red);
if (global.key_up) {
	draw_rectangle(x_align+2, 8, x_align+3, 9, false);
}
if (global.key_left) {
	draw_rectangle(x_align, 10, x_align+1, 11, false);
}
if (global.key_down) {
	draw_rectangle(x_align+2, 12, x_align+3, 13, false);
}
if (global.key_right) {
	draw_rectangle(x_align+4, 10, x_align+5, 11, false);
}
draw_set_color(c_orange);
if (global.key_up and global.key_left) {
	draw_rectangle(x_align, 8, x_align+1, 9, false);
}
if (global.key_left and global.key_down) {
	draw_rectangle(x_align, 12, x_align+1, 13, false);
}
if (global.key_down and global.key_right) {
	draw_rectangle(x_align+4, 12, x_align+5, 13, false);
}
if (global.key_right and global.key_up) {
	draw_rectangle(x_align+4, 8, x_align+5, 9, false);
}