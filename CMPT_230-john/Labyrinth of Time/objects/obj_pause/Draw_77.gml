gpu_set_blendenable(false);

if (paused) {
	surface_set_target(application_surface);
	if (surface_exists(pause_surface)) {
		draw_surface(pause_surface, 0, 0);
	} else {
		pause_surface = surface_create(window_get_width(), window_get_height());
		buffer_set_surface(pause_surface_buffer, pause_surface, 0)
	}
	surface_reset_target();
}

if (global.menu_pause) {
	if (!paused) {
		paused = true;
		instance_deactivate_all(true);
		
		pause_surface = surface_create(window_get_width(), window_get_height());
		surface_set_target(pause_surface);
		draw_surface(application_surface, 0, 0);
		surface_reset_target();
		
		if (buffer_exists(pause_surface_buffer)) {
			buffer_delete(pause_surface_buffer);
		}
		pause_surface_buffer = buffer_create(window_get_width() * window_get_height() * 4, buffer_fixed, 1);
		buffer_get_surface(pause_surface_buffer, pause_surface, 0);
	} else {
		paused = false;
		instance_activate_all();
		if (surface_exists(pause_surface)) {
			surface_free(pause_surface);
		}
		if (buffer_exists(pause_surface_buffer)) {
			buffer_delete(pause_surface_buffer);
		}
	}
}

gpu_set_blendenable(true);