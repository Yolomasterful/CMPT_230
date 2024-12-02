//Keys
global.key_right = keyboard_check(ord("D")) or keyboard_check(vk_right) or gamepad_button_check(global.gamepad_number, gp_padr) or  gamepad_axis_value(global.gamepad_number, gp_axislh) > global.gamepad_deadzone;
global.key_left = keyboard_check(ord("A")) or keyboard_check(vk_left) or gamepad_button_check(global.gamepad_number, gp_padl) or gamepad_axis_value(global.gamepad_number, gp_axislh) < -global.gamepad_deadzone;
global.key_up = keyboard_check(ord("W")) or keyboard_check(vk_up) or gamepad_button_check(global.gamepad_number, gp_padu) or gamepad_axis_value(global.gamepad_number, gp_axislv) < -global.gamepad_deadzone;
global.key_down = keyboard_check(ord("S")) or keyboard_check(vk_down) or gamepad_button_check(global.gamepad_number, gp_padd) or gamepad_axis_value(global.gamepad_number, gp_axislv) > global.gamepad_deadzone;

//Actions
global.action_interact = keyboard_check_pressed(ord("E")) or gamepad_button_check_pressed(global.gamepad_number, gp_face3);
global.action_sprint = keyboard_check(vk_shift) or gamepad_button_check(global.gamepad_number, gp_shoulderl);// or gamepad_button_check(gamepad_number, gp_shoulderlb);
global.action_dodge = keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(global.gamepad_number, gp_face1);

if keyboard_check_pressed(vk_f12) {
	debugging = !debugging;
}

depth = -1000

if (debugging) {
	current_lives = default_lives;
	current_stamina = default_stamina;
	//Debug binds
	if (keyboard_check_pressed(vk_numpad8)) {
	y--;
	}
	if (keyboard_check_pressed(vk_numpad2)) {
		y++;
	}
	if (keyboard_check_pressed(vk_numpad4)) {
		x--;
	}
	if (keyboard_check_pressed(vk_numpad6)) {
		x++;
	}
}

//Key Cancellation
if (global.key_left and global.key_right) {
	global.key_left = false;
	global.key_right = false;
}
if (global.key_up and global.key_down) {
	global.key_up = false;
	global.key_down = false;
}

//Heal
with obj_health {
	if (place_meeting(x, y, obj_player)) {
		instance_destroy()
		if other.current_lives < other.default_lives {
			other.current_lives++;
		}
	}
}

//Death
if (current_lives == 0) {
	if (sprite_index != spr_player_death) {
		sprite_index = spr_player_death
		image_speed = 1;
	} else if (image_index >= sprite_get_number(spr_player_death) - 1) {
		image_speed = 0;
		global.died = true;
	}
	
	exit;
}

//Crumbled Tiles
with (collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, obj_crumbling_floor, false, true)) {
	if (!crumbled) {
		obj_player.crumbling_floor = true;
		break;
	}
}
show_debug_message("Touching Crumbling Tile: "+string(crumbling_floor));

//Check Fallen
var overlap_percent = check_tile_inside_collision(x - sprite_width/2, y - sprite_height/2 + sprite_height*(4/5), x + sprite_width/2, y + sprite_height/2, flooring_objects);
if (overlap_percent >= 0.8) {
	last_safe_coords = [x, y];
} 
if ((overlap_percent < 0.3) and not dodging and not crumbling_floor and not falling) {
	falling = true;
	audio_stop_sound(walking_sound);
	audio_play_sound(snd_falling, 10, false, global.master_vol*global.sfx_vol);
	sprite_index = spr_player_pitfall;
	image_speed = 0.5;
} else if (image_index >= 6 and falling) {
	falling = false;
	image_speed = 0;
	current_lives--;
	audio_play_sound(snd_damage_1, 10, false, global.master_vol*global.sfx_vol);
	sprite_index = spr_player_down;
	x = last_safe_coords[0];
	y = last_safe_coords[1];
}

//Stamina Handler
if (current_stamina < default_stamina and not current_stamina_delay > 0 and not dodging) {
    // Regenerate stamina faster when neither sprinting nor dodging
    current_stamina = min(current_stamina + 2, default_stamina);
} 
if (current_stamina_delay > 0 and not exhausted) {
	current_stamina_delay -= min(stamina_delay_increment, current_stamina_delay);
} else if (current_stamina_delay > 0) {
	current_stamina_delay -= min(stamina_delay_increment/2, current_stamina_delay);
}
// Handle exhaustion recovery
if (exhausted and current_stamina >= default_stamina) {
    exhausted = false;  // Re-enable sprinting/dodging when stamina is full
}

var touch_quicksand = place_meeting(x, y, layer_tilemap_get_id("Quicksand")) and 0.3 > check_tile_inside_collision(x - sprite_width/2, y - sprite_height/2 + sprite_height*(4/5), x + sprite_width/2, y + sprite_height/2, [layer_tilemap_get_id("Flooring")]);

//Quicksand Tiles
if (touch_quicksand) {
	walk_speed = default_walk_speed / 2;
	sprint_speed = default_walk_speed;
	quicksand_delay--;
	if (quicksand_delay <= 0) {
		audio_play_sound(snd_damage_1, 10, false)
		current_lives--;
		quicksand_delay = default_quicksand_delay;
	} 
} else {
	quicksand_delay = default_quicksand_delay;
}

//Sprint
if (current_stamina > 0 and !exhausted) {
    if (global.action_sprint and ((horizontal_speed != 0) or (vertical_speed != 0))) {
        walk_speed = sprint_speed;  // Sprinting speed
        current_stamina = max(current_stamina - sprint_stamina_drain, 0);  // Decrease stamina, but don't go below 0
		current_stamina_delay = default_stamina_delay;
        if (current_stamina == 0) {
            exhausted = true;  // Prevent sprinting when stamina reaches 0
        }
    } else if (!touch_quicksand) {
        walk_speed = default_walk_speed;  // Regular speed when not sprinting
    }
} else if (!touch_quicksand) {
    walk_speed = default_walk_speed;  // Normal walking speed
} 

//Apply Player Movement
horizontal_speed = (global.key_right - global.key_left) * walk_speed;
vertical_speed = (global.key_down - global.key_up) * walk_speed;

//Fix Diagonal Movement
if ((global.key_right + global.key_left + global.key_up + global.key_down == 2) and (global.key_right + global.key_left != 2) and (global.key_up + global.key_down != 2)) {
	horizontal_speed = horizontal_speed * diagonal_scaler;
	vertical_speed = vertical_speed * diagonal_scaler;
}

//Quicksand Tiles Nudging
if (touch_quicksand) {
	var freq = 1;
	var v_rand = random_range(-freq, freq);
	var h_rand = random_range(-freq, freq);
	if v_rand == -freq or v_rand == freq {
		vertical_speed += sign(v_rand);
	}
	if h_rand == -freq or h_rand == freq {
		horizontal_speed += sign(h_rand);
	}
	round_movement = false;
}

//Set direction based on input for sprite rotation
if (global.key_up and global.key_right) {
    direction = 45;   // Up-right
} else if (global.key_up and global.key_left) {
    direction = 135;  // Up-left
} else if (global.key_down and global.key_right) {
    direction = 315;  // Down-right
} else if (global.key_down and global.key_left) {
    direction = 225;  // Down-left
} else if (global.key_right) {
    direction = 0;    // Facing right
} else if (global.key_left) {
    direction = 180;  // Facing left
} else if (global.key_up) {
    direction = 90;   // Facing up
} else if (global.key_down) {
    direction = 270;  // Facing down
}

//Dodge
if (global.action_dodge and not dodging and not exhausted and current_stamina >= dodge_stamina_drain) {
    dodging = true;
	if irandom(1) {
		audio_play_sound(snd_dash_1, 1, false, global.master_vol*global.sfx_vol);
	} else {
		audio_play_sound(snd_dash_2, 1, false, global.master_vol*global.sfx_vol);
	}
    current_stamina = max(current_stamina - dodge_stamina_drain, 0);  // Use 50 stamina, but don't go below 0
	current_stamina_delay = default_stamina_delay;
    if (current_stamina == 0) {
        exhausted = true;  // Prevent further dodging when stamina reaches 0
    }
	last_facing = direction
}

//While dodging
if (dodging) {
	invulnerable = true;
    current_dodge_timer -= 1;
	if (last_facing == 0) {
        horizontal_speed = dodge_speed;
		vertical_speed = 0;
    } else if (last_facing == 45) {
		vertical_speed = -(dodge_speed * diagonal_scaler)
		horizontal_speed = (dodge_speed * diagonal_scaler)
	} else if (last_facing == 90) {
        vertical_speed = -dodge_speed;
		horizontal_speed = 0;
	} else if (last_facing == 135) {
		vertical_speed = -(dodge_speed * diagonal_scaler)
		horizontal_speed = -(dodge_speed * diagonal_scaler)
	} else if (last_facing == 180) {
        horizontal_speed = -dodge_speed;
		vertical_speed = 0;
    } else if (last_facing == 225) {
		vertical_speed = (dodge_speed * diagonal_scaler)
		horizontal_speed = -(dodge_speed * diagonal_scaler)
	} else if (last_facing == 270) {
        vertical_speed = dodge_speed;
		horizontal_speed = 0;
    } else if (last_facing == 315) {
		vertical_speed = (dodge_speed * diagonal_scaler)
		horizontal_speed = (dodge_speed * diagonal_scaler)
	}
    if (current_dodge_timer <= 0) {
        dodging = false;
        invulnerable = false;
		current_dodge_timer = default_dodge_timer;
        horizontal_speed = 0;  // Stop movement after dodge
        vertical_speed = 0;
    }
}
//Crumbling Tile
with (obj_crumbling_floor) {
	if (place_meeting(x, y, other)) {
		if (!crumbled) {
			touched = true;
			other.crumbling_floor = true;
			break
		}
	}
}

if falling {
	vertical_speed = 0;
	horizontal_speed = 0;
	exit
}

// Horizontal Movement and Boundary Check
if (place_meeting(x + horizontal_speed, y, collision_objects)) {
	while (!place_meeting(x + sign(horizontal_speed), y, collision_objects)) {
	    x += sign(horizontal_speed);
	}
	horizontal_speed = 0;
}
x += horizontal_speed;

// Vertical Movement and Boundary Check
if (place_meeting(x, y + vertical_speed, collision_objects)) {
	while (!place_meeting(x, y + sign(vertical_speed), collision_objects)) {
	    y += sign(vertical_speed);
	}
	vertical_speed = 0;
}
y += vertical_speed;

if round_movement {
	x = round(x);
	y = round(y);
}

obj_player_hitbox.x = x;
obj_player_hitbox.y = y;

if audio_is_playing(walking_sound) and not (global.key_up || global.key_down || global.key_left || global.key_right){
	audio_stop_sound(walking_sound)
} else if ((global.key_up || global.key_down || global.key_left || global.key_right) and not falling and not audio_is_playing(walking_sound)) {
	switch (random(2)) {
		case 0:
			walking_sound = audio_play_sound(snd_walking_issolated_1, 10, true, global.master_vol*global.sfx_vol);
			break;
		case 1:
			walking_sound = audio_play_sound(snd_walking_issolated_2, 10, true, global.master_vol*global.sfx_vol);
			break;
		case 2:
			walking_sound = audio_play_sound(snd_walking_issolated_3, 10, true, global.master_vol*global.sfx_vol);
			break;
	}
}

//Sprite Selection
if (global.key_up || global.key_down || global.key_left || global.key_right) {
	image_speed = 1;
	if (direction == 0) {
		sprite_index = spr_player_right;
	} else if (direction == 90) {
		sprite_index = spr_player_up;
	} else if (direction == 180) {
		sprite_index = spr_player_left;
	} else if (direction == 270) {
		sprite_index = spr_player_down;
	}
} else {
	image_speed = 0;
	image_index = 0;
}

//Interactables
var gems_objs = [obj_gem_blue, obj_gem_green, obj_gem_pink, obj_gem_yellow]
var sockets_objs = [obj_gem_socket_blue, obj_gem_socket_green, obj_gem_socket_pink, obj_gem_socket_yellow]

for (var i = 0; i < 4; i++) {
	if (gems[i] == true and !array_contains(interactables, sockets_objs[i])) {
		array_push(interactables, sockets_objs[i]);
	}
	if (socketed[i] == true and array_contains(interactables, sockets_objs[i])) {
		array_delete(interactables, array_get_index(interactables, sockets_objs[i]), 1)
	}
}

//Resets
walk_speed = default_walk_speed;
round_movement = true;
sprint_speed = default_walk_speed * 2;
crumbling_floor = false;