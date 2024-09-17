function check_collision(x_pos, y_pos, collision_objects = [obj_room_boundary, obj_wall]) {
    for (var i = 0; i < array_length(collision_objects); i++) {
        if (place_meeting(x_pos, y_pos, collision_objects[i])) {
            return true;
        }
    }
    return false;
}