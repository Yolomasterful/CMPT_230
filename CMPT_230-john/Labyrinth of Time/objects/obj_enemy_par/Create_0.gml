event_inherited();

//spawn place
spawn_x = x;
spawn_y = y;
//chasing the player?
alert = false;
//alert distance
alert_dis = 20; 
//attack distance 
attack_dis = 12;

chase_time = 0; 
chase_time_limit = 100 * room_speed;
max_chase_distance = 300;

//the frame enemy perform attack
attack_frame = 6;
can_attack = true;
attack_cooldown = 75;
damage = 1;

//create path resource
path = path_add();
//chase player speed
move_speed = 1; 
//set delay for calculating path
calc_path_delay = 30; 
//set a timer for when we calc a path 
calc_path_timer = irandom(60); 

knockback_time = 0;
