event_inherited();

//spawn place
spawn_x = x;
spawn_y = y;
//chasing the player?
alert = false;
//alert distance
alert_dis = 60; 
//attack distance 
attack_dis = 15;

chase_time = 0; 
chase_time_limit = 500;
max_chase_distance = 300;

//the frame enemy perform attack
attack_frame = 2;
can_attack = true;
attack_cooldown = 75;
damage = 1;

//create path resource
path = path_add();
//chase player speed
move_speed = 1.1; 
//set delay for calculating path
calc_path_delay = 30; 
//set a timer for when we calc a path 
calc_path_timer = irandom(60); 

knockback_time = 0;

sound_played_dead = false;
sound_played_alert = false;