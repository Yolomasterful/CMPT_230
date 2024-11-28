//Debug
debugging = false;
//Controller
global.gamepad_number = 0;
global.gamepad_deadzone = 0.3;
//Movement
vertical_speed = 0;
horizontal_speed = 0;
diagonal_scaler = 0.75;
round_movement = true;
last_facing = direction;
last_safe_coords = [-1, -1];
//Walk Speed
default_walk_speed = 3;
walk_speed = default_walk_speed;
//Life
default_lives = 3;
current_lives = default_lives;
//Stamina
default_stamina = 100;
current_stamina = default_stamina;
default_stamina_delay = 4 * 60;
current_stamina_delay = 0;
stamina_delay_increment = 3;
exhausted = false;
//Sprint
sprint_stamina_drain = 1;
sprint_speed = default_walk_speed * 2;
//Dodge
dodge_stamina_drain = 25;
dodge_speed = default_walk_speed * 3;
default_dodge_timer = 2 * 60 / dodge_speed;
current_dodge_timer = default_dodge_timer;
dodging = false;
//Collisions
falling = false;
instance_create_layer(x, y, layer, obj_player_hitbox);
collision_objects = [obj_boundary, obj_desert_door, layer_tilemap_get_id("Walls")];
flooring_objects = [layer_tilemap_get_id("Flooring"), layer_tilemap_get_id("Quicksand")]
//Interactables
interactables = [obj_gem_blue, obj_gem_green, obj_gem_pink, obj_gem_yellow];
//Quicksand
default_quicksand_delay = 3 * 60;
quicksand_delay = default_quicksand_delay;
//Crumbling Tile
crumbling_floor = false;
//Boolean Stats
invulnerable = false;
//Gems
gems = [false, false, false, false];
socketed = [false, false, false, false];