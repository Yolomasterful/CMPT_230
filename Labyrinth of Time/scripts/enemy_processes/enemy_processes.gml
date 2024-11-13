function calc_entity_movement() {
	//moves enemy and apply drag 
	
	//apply movement
	x += hsp; 
	y += vsp;
	
	// slowdown 
	hsp *= global.drag; 
	vsp *= global.drag; 
	
	check_if_stopped();
}



function calc_knockback_movement() {
	
	///moves enemy and applies drag during knockback
	
	x+= hsp;
	y+= vsp;
	
	//slowdowdn
	
	hsp *= 0.91;
	vsp *= 0.91;
	
	check_if_stopped(); 
	
	//exit state
	
	if knockback_time <= 0 state = states.IDLE;
}
	


function check_facing() {
	///check which way we are moving and set facing 
	
	var _facing = sign(x - xp);
	if _facing != 1 facing = _facing;
}

	


function check_for_player() {
    /// Check if the player is close enough
    var _dis = distance_to_object(obj_player);

    // If player is within alert distance or already in alert mode, but outside of attack distance
    if ((_dis <= alert_dis || alert) && _dis > attack_dis) { 
        alert = true;

        // Check if it's time to recalculate the path
        if (calc_path_timer-- <= 0) { 
            // Reset timer
            calc_path_timer = calc_path_delay;

            // Attempt to create a path to the player
			if x == xp and y == yp var _type = 0 else var _type = 1; 
            var _found_player = mp_grid_path(global.mp_grid, path, x, y, obj_player.x, obj_player.y, _type);

            // Start the path if we successfully found one
            if (_found_player) {
                path_start(path, move_speed, path_action_stop, false); 
            }
        }
    } 
    // If player is within attack distance
    else { 
        if (_dis <= attack_dis) { 
            path_end();
			state = states.ATTACK;
        }
    }
}



function enemy_anim(){
	switch(state) {
	case states.IDLE:
		sprite_index = s_idle;
	break;
	case states.MOVE:
		sprite_index = s_walk;
		
	break;
	case states.ATTACK:
		sprite_index = s_attack;

	
	break;
	case states.DEAD:
		sprite_index = s_dead;
	
	break;
}
	// update previous position
	xp = x;
	yp = y; 
	

}

function perform_attack() {
	if image_index >= attack_frame and can_attack {
		//reset for next attack
		can_attack = false;
		alarm[0] = attack_cooldown; 
		
		//get attack direction
		var _dir = point_direction(x, y, obj_player.x, obj_player.y);
		
		//get attack position
		
		var _xx = x + lengthdir_x(attack_dis, _dir);
		var _yy = y + lengthdir_y(attack_dis, _dir);
		
		var _inst = instance_create_layer(_xx, _yy, "Instances", obj_enemy_hitbox); 
		_inst.owner_id = id;
		_inst.damage = damage; 
		_inst.knockback_time = knockback_time;
		
	}
}

