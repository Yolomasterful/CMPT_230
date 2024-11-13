function damage_entity(_tid, _sid, _damage, _time) {
	///damage the target, and return the dea status
	
	with(_tid) {
		current_lives -= _damage; 
		var _dead = is_dead();
		if _dead var _dis = 5 else var _dis = 3;
		var _dir = point_direction(_sid.x, _sid.y, x, y);
		hsp += lengthdir_x(_dis, _dir);
		vsp += lengthdir_y(_dis, _dir);
		calc_path_timer = _time;
		alert = true;
		knockback_time = _time;
		image_index = 0;
		if !_dead state = states.KNOCKBACK;
		
		
		
		
		
		return _dead; 
		
		
		
	}
}

function is_dead() {
	///checks if the instance running is dead
	
	if state != states.DEAD {
		if current_lives <= 0 {
			state = states.DEAD;
			current_lives = 0;
			image_index = 0;
			switch(object_index) {
				default: 
				
				break;
				case obj_player:
				
				break;
			}
			
			return true;
		}
	} else return true; 
	
}

function check_if_stopped() {
	if abs(hsp) < 0.1 hsp = 0; 
	if abs(vsp) < 0.1 vsp = 0; 
}

function show_healthbar() {
	// show healthbar above entites head 
	
	if current_lives != default_lives and current_lives  > 0 {
		draw_healthbar(x-7, y-16, x+7, y-14, current_lives/default_lives*100, $00300, $3232FF, $00B200, 0, 1, 1);
	}
}
