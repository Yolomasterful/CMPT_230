//Keys
global.key_right = keyboard_check(ord("D")) or keyboard_check(vk_right) or gamepad_button_check(gamepad_number, gp_padr) or  gamepad_axis_value(gamepad_number, gp_axislh) > gamepad_deadzone;
global.key_left = keyboard_check(ord("A")) or keyboard_check(vk_left) or gamepad_button_check(gamepad_number, gp_padl) or gamepad_axis_value(gamepad_number, gp_axislh) < -gamepad_deadzone;
global.key_up = keyboard_check(ord("W")) or keyboard_check(vk_up) or gamepad_button_check(gamepad_number, gp_padu) or gamepad_axis_value(gamepad_number, gp_axislv) < -gamepad_deadzone;
global.key_down = keyboard_check(ord("S")) or keyboard_check(vk_down) or gamepad_button_check(gamepad_number, gp_padd) or gamepad_axis_value(gamepad_number, gp_axislv) > gamepad_deadzone;
//Actions
global.action_sprint = keyboard_check(vk_shift) or gamepad_button_check(gamepad_number, gp_shoulderl) or gamepad_button_check(gamepad_number, gp_shoulderlb);
global.action_dodge = keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(gamepad_number, gp_face1);

if keyboard_check_pressed(vk_f11) {
	window_set_fullscreen(!window_get_fullscreen());
}

if (keyboard_check(vk_escape) or gamepad_button_check(gamepad_number, gp_select)) {
	game_end();
}

if (stamina < default_stamina and not stamina_delay > 0 and not dodging) {
    // Regenerate stamina faster when neither sprinting nor dodging
    stamina = min(stamina + 2, default_stamina);
} 
if (stamina_delay > 0 and not exhausted) {
	stamina_delay -= min(stamina_delay_increment, stamina_delay);
} else if (stamina_delay > 0) {
	stamina_delay -= min(stamina_delay_increment/2, stamina_delay);
}
// Handle exhaustion recovery
if (exhausted and stamina >= default_stamina) {
    exhausted = false;  // Re-enable sprinting/dodging when stamina is full
}

//Apply Player Movement
horizontal_speed = (global.key_right - global.key_left) * walk_speed;
vertical_speed = (global.key_down - global.key_up) * walk_speed;

//Fix Diagonal Movement
if ((global.key_right + global.key_left + global.key_up + global.key_down == 2) and (global.key_right + global.key_left != 2) and (global.key_up + global.key_down != 2)) {
	horizontal_speed = horizontal_speed * diagonal_scaler;
	vertical_speed = vertical_speed * diagonal_scaler;
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

//Sprint
if (stamina > 0 and not exhausted) {
    if (global.action_sprint and ((horizontal_speed != 0) or (vertical_speed != 0))) {
        walk_speed = sprint_speed;  // Sprinting speed
        stamina = max(stamina - 4, 0);  // Decrease stamina, but don't go below 0
		stamina_delay = default_stamina_delay;
        if (stamina == 0) {
            exhausted = true;  // Prevent sprinting when stamina reaches 0
        }
    } else {
        walk_speed = default_walk_speed;  // Regular speed when not sprinting
    }
} else {
    walk_speed = default_walk_speed;  // Normal walking speed
}

//Dodge
if (global.action_dodge and not dodging and not exhausted and stamina >= 50) {
    dodging = true;
    stamina = max(stamina - 50, 0);  // Use 50 stamina, but don't go below 0
	stamina_delay = default_stamina_delay;
    if (stamina == 0) {
        exhausted = true;  // Prevent further dodging when stamina reaches 0
    }
	last_facing = direction
} 

//While dodging
if (dodging) {
	invulnerable = true;
    dodge_timer -= 1;
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
    if (dodge_timer <= 0) {
        dodging = false;
        invulnerable = false;
		dodge_timer = default_dodge_timer;
        horizontal_speed = 0;  // Stop movement after dodge
        vertical_speed = 0;
    }
}

// Horizontal Movement and Boundary Check
if (check_collision(x + horizontal_speed, y, collision_objects)) {
	while (!check_collision(x + sign(horizontal_speed), y, collision_objects)) {
	    x += sign(horizontal_speed);
	}
	horizontal_speed = 0;
}
x += horizontal_speed;

// Vertical Movement and Boundary Check
if (check_collision(x, y + vertical_speed, collision_objects)) {
	while (!check_collision(x, y + sign(vertical_speed), collision_objects)) {
	    y += sign(vertical_speed);
	}
	vertical_speed = 0;
}
y += vertical_speed;

x = round(x);
y = round(y);