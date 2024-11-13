// Create Event of obj_player

//Character facing
facing = 0;

//Debug
debugging = false;

//Controller
global.gamepad_number = 0;
global.gamepad_deadzone = 0.3;

//Movement
vertical_speed = 0;
horizontal_speed = 0;
diagonal_scaler = 0.707; // Use this to scale diagonal movement speed
last_facing = direction;
last_safe_coords = [-1, -1];

//Walk Speed
default_walk_speed = 1;
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
sprint_stamina_drain = 2;
sprint_speed = default_walk_speed * 1.5;

//Dodge
dodge_stamina_drain = 25;
dodge_speed = default_walk_speed * 1.5;
default_dodge_timer = 2 * 60 / dodge_speed;
current_dodge_timer = default_dodge_timer;
dodging = false;

//Collision Object List
collision_objects = [obj_room_boundary, layer_tilemap_get_id("Walls")]

//Boolean Stats
invulnerable = false; // Speed Variables
