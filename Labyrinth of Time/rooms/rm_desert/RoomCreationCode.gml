create_boundaries(32, 32);

window_set_size(room_width+room_width*(1/4), room_height);
window_center();

instance_create_layer(0, 0, "Instances", obj_pause);