function create_boundaries(spr_width, spr_height, rm_width, rm_height, x_pos = 0, y_pos = 0) {
	var top_boundary = instance_create_layer(x_pos - spr_width, y_pos - spr_height, "Instances", obj_room_boundary);
	top_boundary.image_xscale = (rm_width / spr_width) + 2;

	var bottom_boundary = instance_create_layer(x_pos - spr_width, rm_height, "Instances", obj_room_boundary);
	bottom_boundary.image_xscale = (rm_width / spr_width) + 2;

	var right_boundary = instance_create_layer(rm_width, y_pos - spr_height, "Instances", obj_room_boundary);
	right_boundary.image_yscale = (rm_height / spr_height) + 2;

	var left_boundary = instance_create_layer(x_pos - spr_width, y_pos - spr_height, "Instances", obj_room_boundary);
	left_boundary.image_yscale = (rm_height / spr_height) + 2;
}