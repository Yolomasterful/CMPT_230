draw_set_color(c_white);
draw_set_font(fnt_main);
draw_set_halign(fa_left);

//HP Bar
var hp_x_offset = 20;
var hp_y_offset = 20;
var hp_scale = 4;

if current_lives > 0 {
	draw_sprite_ext(spr_hp_bar_head, 0, hp_x_offset, hp_y_offset, hp_scale, hp_scale, 0, c_white, 1);
} else {
	draw_sprite_ext(spr_hp_bar_head, 1, hp_x_offset, hp_y_offset, hp_scale, hp_scale, 0, c_white, 1);
}

hp_x_offset += sprite_get_width(spr_hp_bar_head) * hp_scale;

if (default_lives > 2) {
	for (var i = 0; i + 1 < default_lives - 1; i++) {
		if current_lives > i + 1 {
			draw_sprite_ext(spr_hp_bar_segment, 0, hp_x_offset + sprite_get_width(spr_hp_bar_segment) * hp_scale * i, hp_y_offset, hp_scale, hp_scale, 0, c_white, 1);
		} else {
			draw_sprite_ext(spr_hp_bar_segment, 1, hp_x_offset + sprite_get_width(spr_hp_bar_segment) * hp_scale * i, hp_y_offset, hp_scale, hp_scale, 0, c_white, 1);
		}
	}

	hp_x_offset += sprite_get_width(spr_hp_bar_segment) * hp_scale * (default_lives - 2)
}

if current_lives == default_lives {
	draw_sprite_ext(spr_hp_bar_tail, 0, hp_x_offset, hp_y_offset, hp_scale, hp_scale, 0, c_white, 1);
} else {
	draw_sprite_ext(spr_hp_bar_tail, 1, hp_x_offset, hp_y_offset, hp_scale, hp_scale, 0, c_white, 1);
}

//Stamina Bar

var sta_x_offset = 20;
var sta_y_offset = round(hp_y_offset * 1.5) + sprite_get_height(spr_hp_bar_head) * hp_scale;
var sta_scale = 4;

if current_stamina > 0 {
	draw_sprite_ext(spr_sta_bar_head, 0, sta_x_offset, sta_y_offset, sta_scale, sta_scale, 0, c_white, 1);
} else {
	draw_sprite_ext(spr_sta_bar_head, 1, sta_x_offset, sta_y_offset, sta_scale, sta_scale, 0, c_white, 1);
}

sta_x_offset += sprite_get_width(spr_sta_bar_head) * sta_scale;

if (default_stamina/25 > 2) {
	for (var i = 0; i + 1 < default_stamina/25 - 1; i++) {
		if current_stamina/25 > i + 1 {
			draw_sprite_ext(spr_sta_bar_segment, 0, sta_x_offset + sprite_get_width(spr_sta_bar_segment) * sta_scale * i, sta_y_offset, sta_scale, sta_scale, 0, c_white, 1);
		} else {
			draw_sprite_ext(spr_sta_bar_segment, 1, sta_x_offset + sprite_get_width(spr_sta_bar_segment) * sta_scale * i, sta_y_offset, sta_scale, sta_scale, 0, c_white, 1);
		}
	}

	sta_x_offset += sprite_get_width(spr_sta_bar_segment) * sta_scale * (default_stamina/25 - 2)
}

if current_stamina == default_stamina {
	draw_sprite_ext(spr_sta_bar_tail, 0, sta_x_offset, sta_y_offset, sta_scale, sta_scale, 0, c_white, 1);
} else {
	draw_sprite_ext(spr_sta_bar_tail, 1, sta_x_offset, sta_y_offset, sta_scale, sta_scale, 0, c_white, 1);
}

//Inventory

var inv_x_offset = 1024 - 20
var inv_y_offset = 20

var spacing = 10

for (var i = 0; i < 4; i++) {
	draw_sprite_ext(spr_ui_inventory, 0, inv_x_offset - sprite_get_width(spr_ui_inventory) * (i+1) - spacing * i, inv_y_offset, 1, 1, 0, c_white, 0.5);
}

var gem_sprs = [spr_gem_blue, spr_gem_green, spr_gem_pink, spr_gem_yellow]

for (var i = 0; i < 4; i++)
if (gems[i] == true) {
	draw_sprite_ext(gem_sprs[i], 0, inv_x_offset - sprite_get_width(spr_ui_inventory) * (3-i+1) - spacing * (3-i), inv_y_offset, 2, 2, 0, c_white, 1)
}
/*
//Postions

var original_x = 0;
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
	y_align += 20
	draw_text(x_align, y_align, "Coords: X: "+string(x)+" Y: "+string(y));
}