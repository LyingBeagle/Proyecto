if(time_in_microseconds > 0){
	time_in_microseconds -= delta_time;
}else{
	if(global.successful_operation >= 2){
		show_debug_message("DEBUG 1");
		//Si se tuvo 2 o mas operaciones correctas, se va a rm_after
		room_goto(rm_after);
	}else{
		//No se lograron 2 o mas operaciones correctas
		//Game Over
		
		//Resetear puntuacion
		if (instance_exists(obj_score)) {
            obj_score.current_score = 10;
        }
		
		if(ds_exists(global.fruit_modifiers, ds_type_map)){
			ds_map_clear(global.fruit_modifiers);
		}
		
		room_goto(rm_levels);
	}
}