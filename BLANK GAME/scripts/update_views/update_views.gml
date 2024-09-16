// Function to update view positions based on the player's current room
function update_views() {
    // Center view (current room)
    var cam0 = view_get_camera(0);
    camera_set_view_pos(cam0, current_room_x * room_width, current_room_y * room_height);
    view_set_xport(0, room_width);  // Center the current room
    view_set_yport(0, room_height);

    // Left room
    if (current_room_x > 0) {
        var cam1 = view_get_camera(1);
        camera_set_view_pos(cam1, (current_room_x - 1) * room_width, current_room_y * room_height);
        view_set_xport(1, 0);  // Align left of the current room
        view_set_yport(1, room_height);  // Align vertically
    } else {
        view_set_visible(1, false);  // Hide view if no adjacent room
    }

    // Right room
    if (current_room_x < 2) {
        var cam2 = view_get_camera(2);
        camera_set_view_pos(cam2, (current_room_x + 1) * room_width, current_room_y * room_height);
        view_set_xport(2, room_width * 2);  // Align right of the current room
        view_set_yport(2, room_height);
    } else {
        view_set_visible(2, false);
    }

    // Upper room
    if (current_room_y > 0) {
        var cam3 = view_get_camera(3);
        camera_set_view_pos(cam3, current_room_x * room_width, (current_room_y - 1) * room_height);
        view_set_xport(3, room_width);  // Align horizontally
        view_set_yport(3, 0);  // Align above the current room
    } else {
        view_set_visible(3, false);
    }

    // Bottom room
    if (current_room_y < 2) {
        var cam4 = view_get_camera(4);
        camera_set_view_pos(cam4, current_room_x * room_width, (current_room_y + 1) * room_height);
        view_set_xport(4, room_width);
        view_set_yport(4, room_height * 2);  // Align below the current room
    } else {
        view_set_visible(4, false);
    }
}