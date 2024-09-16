var top_boundary = instance_create_layer(0, 0 - sprite_height, "Instances", obj_room_boundary);
top_boundary.image_xscale = room_width / sprite_width;

var bottom_boundary = instance_create_layer(0, room_height, "Instances", obj_room_boundary);
bottom_boundary.image_xscale = room_width / sprite_width;

var right_boundary = instance_create_layer(room_width, 0, "Instances", obj_room_boundary);
right_boundary.image_yscale = room_height / sprite_height;

var left_boundary = instance_create_layer(0 - sprite_width, 0, "Instances", obj_room_boundary);
left_boundary.image_yscale = room_height / sprite_height;