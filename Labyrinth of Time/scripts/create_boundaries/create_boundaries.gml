function create_boundaries(spr_width, spr_height, rm_width = room_width, rm_height = room_height, x_pos = 0, y_pos = 0) {
	// Top boundary
    var top_boundary = instance_create_layer(x_pos, y_pos, "Instances", obj_room_boundary);
    top_boundary.image_xscale = (rm_width / spr_width) + 2;
    top_boundary.x = x_pos - spr_width;     // Align horizontally with the room
	top_boundary.y = y_pos - spr_height; // Align to the top
	
    // Bottom boundary
    var bottom_boundary = instance_create_layer(x_pos, rm_height, "Instances", obj_room_boundary);
    bottom_boundary.image_xscale = (rm_width / spr_width) + 2;
    bottom_boundary.x = x_pos - spr_width;     // Align horizontally with the room
	bottom_boundary.y = y_pos + rm_height; // Align to the bottom
	
    // Right boundary
    var right_boundary = instance_create_layer(rm_width, y_pos, "Instances", obj_room_boundary);
    right_boundary.image_yscale = (rm_height / spr_height) + 2;
    right_boundary.x = x_pos + rm_width;  // Align to the right side of the room
    right_boundary.y = y_pos - spr_height;     // Align vertically with the room

    // Left boundary
    var left_boundary = instance_create_layer(x_pos, y_pos, "Instances", obj_room_boundary);
    left_boundary.image_yscale = (rm_height / spr_height) + 2;
    left_boundary.x = x_pos - spr_width;      // Align to the left side of the room
    left_boundary.y = y_pos - spr_height;      // Align vertically with the room*/
}