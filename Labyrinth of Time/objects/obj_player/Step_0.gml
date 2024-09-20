var key_right = keyboard_check(ord("D")) or keyboard_check(vk_right) or gamepad_axis_value(gamepad_number, gp_axislh) < -gamepad_deadzone;
var key_left = keyboard_check(ord("A")) or keyboard_check(vk_left) or gamepad_axis_value(gamepad_number, gp_axislh) > gamepad_deadzone;
var key_up = keyboard_check(ord("W")) or keyboard_check(vk_up) or keyboard_check(vk_space);
var key_down = keyboard_check(ord("S")) or keyboard_check(vk_down);

//var action_jump = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up) or keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(gamepad_number, gp_face1); 

if keyboard_check_pressed(vk_f11) {
	window_set_fullscreen(!window_get_fullscreen());
}

if (keyboard_check(vk_escape)) {
	game_end();
}

//Sprint
if (stamina > 0 && !exhausted) {
    if (keyboard_check(vk_shift)) {
        walk_speed = default_walk_speed * 2;  // Sprinting speed
        stamina = max(stamina - 1, 0);  // Decrease stamina, but don't go below 0

        if (stamina == 0) {
            exhausted = true;  // Prevent sprinting when stamina reaches 0
        }
    } else {
        walk_speed = default_walk_speed;  // Regular speed when not sprinting
        stamina = min(stamina + 0.5, max_stamina);  // Regenerate stamina
    }
} else {
    walk_speed = default_walk_speed;  // Normal walking speed
    stamina = min(stamina + 0.25, max_stamina);  // Regenerate stamina when not sprinting

    if (stamina >= max_stamina) {
        exhausted = false;  // Allow sprinting again once fully recharged
    }
}


//Apply Player Movement
horizontal_speed = (key_right - key_left) * walk_speed;
vertical_speed = (key_down - key_up) * walk_speed;

//Fix Diagonal Movement
if ((key_right + key_left + key_up + key_down == 2) and (key_right + key_left != 2) and (key_up + key_down != 2)) {
	horizontal_speed = horizontal_speed * 0.75;
	vertical_speed = vertical_speed * 0.75;
}

// Set direction based on input for sprite rotation
if (key_right) {
    direction = 0;  // Facing right
} else if (key_left) {
    direction = 180; // Facing left
} else if (key_up) {
    direction = 90;  // Facing up
} else if (key_down) {
    direction = 270; // Facing down
} else if (key_up && key_right) {
    direction = 45;  // Up-right
} else if (key_up && key_left) {
    direction = 135; // Up-left
} else if (key_down && key_right) {
    direction = 315; // Down-right
} else if (key_down && key_left) {
    direction = 225; // Down-left
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