// Track the player's current room in the 3x3 grid
current_room_x = 1;  // Start in the center (middle room)
current_room_y = 1;

// Enable the view system
view_enabled = true;

// Create 5 cameras: 1 for the current room, and 4 for adjacent rooms
for (var i = 0; i < 5; i++) {
    var cam = camera_create();
    view_set_camera(i, cam);
    view_set_visible(i, true);
    view_set_wport(i, room_width);
    view_set_hport(i, room_height);
    camera_set_view_size(cam, room_width, room_height);
}

// Initialize view positions based on the player's starting room
update_views();