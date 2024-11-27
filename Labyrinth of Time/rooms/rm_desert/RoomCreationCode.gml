create_boundaries(32, 32);

window_set_size(1024+256, 1024);

instance_create_layer(0, 0, "Instances", obj_pause);
instance_create_layer(0, 0, "Instances", obj_shader_handler);