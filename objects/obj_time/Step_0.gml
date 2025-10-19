if(game_over_active){
	exit;
}


if(time_in_microseconds > 0){
	time_in_microseconds -= delta_time;
}else{
	if(global.successful_operations >= 2){
		show_debug_message("DEBUG 1");
		//Si se tuvo 2 o mas operaciones correctas, se va a rm_after
		global.rounds_played++; //Se aumenta la cantidad de rondas jugadas
		global.successful_operations = 0; //Reseteo
		room_goto(rm_after);
	}else{
		//No se lograron 2 o mas operaciones correctas
		//Game Over
		
		game_over_active = true;
		instance_create_layer(0, 0, "Instances", obj_gameover);
	}
}