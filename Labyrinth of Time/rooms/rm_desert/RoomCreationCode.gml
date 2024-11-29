create_boundaries(32, 32);

instance_create_layer(0, 0, "Logic", obj_pause);
instance_create_layer(0, 0, "Logic", obj_menu);
instance_create_layer(2048, 2112, "Entities", obj_player)
/*
for (var i = 0; i < 8; i++) {
	instance_create_layer(2048, 2048, "Entities", obj_sunbeam);
}