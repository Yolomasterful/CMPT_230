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

//Apply Player Movement
horizontal_speed = (key_right - key_left) * walk_speed;
vertical_speed = (key_down - key_up) * walk_speed;

if ((key_right or key_left) and (key_up or key_down)) {
	var diagonal_speed = sqrt((horizontal_speed * horizontal_speed) + (vertical_speed * vertical_speed))
	horizontal_speed = diagonal_speed;
	vertical_speed = diagonal_speed;
}


// Function to check collision with any object in the array
function check_collision_with_array(x_pos, y_pos) {
	var collision_objects = [obj_room_boundary, obj_wall];
    for (var i = 0; i < array_length(collision_objects); i++) {
        if (place_meeting(x_pos, y_pos, collision_objects[i])) {
            return true;
        }
    }
    return false;
}

// Horizontal Movement and Boundary Check
if (check_collision_with_array(x + horizontal_speed, y)) {
    while (!check_collision_with_array(x + sign(horizontal_speed), y)) {
        x += sign(horizontal_speed);
    }
    horizontal_speed = 0;
}
x += horizontal_speed;

// Vertical Movement and Boundary Check
if (check_collision_with_array(x, y + vertical_speed)) {
    while (!check_collision_with_array(x, y + sign(vertical_speed))) {
        y += sign(vertical_speed);
    }
    vertical_speed = 0;
}
y += vertical_speed;

//Jump
/*
if ((current_jump_count) and (action_jump)) {
	vertical_speed = jump_strength
	current_jump_count -= 1;
}
else if ((current_jump_count != jump_count) and (check_collision_with_array(x, y + 1)) and (vertical_speed == 0)) {
	current_jump_count = jump_count;
}
*/