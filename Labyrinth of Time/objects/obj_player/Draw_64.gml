draw_set_color(c_white);
draw_set_font(fnt_dialogue);
draw_set_halign(fa_left);

//Postions

var original_x = -120;
var original_y = 2;

var x_align = original_x;
var y_align = original_y;
var bar_length = 100;
var bar_width = 10
//Bars
if (current_lives > 0) {
	draw_set_color(c_red);
	draw_rectangle(x_align, y_align, x_align + bar_length * floor(current_lives / default_lives), y_align+bar_width, false);
}
y_align += bar_width + 3;
if (current_stamina_delay > 0) {
	draw_set_color(c_grey);
	draw_rectangle(x_align, y_align+bar_width+1, x_align + bar_length * abs(current_stamina_delay / default_stamina_delay), y_align+bar_width/2+bar_width, false);
}
if (current_stamina > 0) {
	draw_set_color(c_aqua);
	draw_rectangle(x_align, y_align, x_align + bar_length * abs(current_stamina / default_stamina), y_align+bar_width, false);
}
y_align += bar_width/2+bar_width+1;
if (current_dodge_timer > 0) {
	draw_set_color(c_lime);
	draw_rectangle(x_align, y_align, x_align + bar_length * abs(current_dodge_timer / default_dodge_timer), y_align+bar_width, false);
}
y_align += bar_width+3;

//Direction

// Row 1
if (global.key_up and global.key_left) {
    draw_set_color(c_orange);
    draw_rectangle(x_align, y_align, x_align + bar_width, y_align + bar_width, false);
}
x_align += bar_width + 1;

if (global.key_up) {
    draw_set_color(c_red);
    draw_rectangle(x_align, y_align, x_align + bar_width, y_align + bar_width, false);
}
x_align += bar_width + 1;

if (global.key_right and global.key_up) {
    draw_set_color(c_orange);
    draw_rectangle(x_align, y_align, x_align + bar_width, y_align + bar_width, false);
}

// Reset to start of row 2
x_align = original_x;
y_align += bar_width + 1;

// Row 2
if (global.key_left) {
    draw_set_color(c_red);
    draw_rectangle(x_align, y_align, x_align + bar_width, y_align + bar_width, false);
}
x_align += (bar_width + 1) * 2;

if (global.key_right) {
    draw_set_color(c_red);
    draw_rectangle(x_align, y_align, x_align + bar_width, y_align + bar_width, false);
}

// Reset to start of row 3
x_align = original_x;
y_align += bar_width + 1;

// Row 3
if (global.key_left and global.key_down) {
    draw_set_color(c_orange);
    draw_rectangle(x_align, y_align, x_align + bar_width, y_align + bar_width, false);
}
x_align += bar_width + 1;

if (global.key_down) {
    draw_set_color(c_red);
    draw_rectangle(x_align, y_align, x_align + bar_width, y_align + bar_width, false);
}
x_align += bar_width + 1;

if (global.key_down and global.key_right) {
    draw_set_color(c_orange);
    draw_rectangle(x_align, y_align, x_align + bar_width, y_align + bar_width, false);
}

x_align = original_x;
y_align += 100;

if debugging {
	draw_set_color(c_white);
	draw_text(x_align, y_align,"Dist: "+string(distance_to_object(obj_note)));
}