function damage_entity(_tid, _sid, _damage, _time) {
    /// Damage the target and return the dead status

    with (_tid) {
        current_lives -= _damage; 
		audio_play_sound(snd_damage_1, 10, false, global.master_vol*global.sfx_vol);
        var _dead = is_dead(); // Check if the entity is dead

        // If not dead, apply knockback state and set timers
        if (!_dead) {
            calc_path_timer = _time;
            alert = true;
            knockback_time = _time;
            image_index = 0;
            state = states.KNOCKBACK;
        }

        return _dead; 
    }
}

function is_dead() {
	///checks if the instance running is dead
	
	if state != states.DEAD {
		if current_lives <= 0 {
			state = states.DEAD;
			current_lives = 0;
			global.died = true;
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