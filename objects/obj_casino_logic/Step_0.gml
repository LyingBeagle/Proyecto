//Si estamos en el estado de ganar y hay tiempo
if((state = "result_win" || state = "result_lose") && win_timer > 0){
	win_timer -= delta_time; //contador con delta time
	
	if(win_timer <= 0){
		show_debug_message("Se acabo el tiempo");
		
		state = "finished"; //Termino de operaciones
		
		global.successful_operation = 0;
		
		room_goto(rm_play);
	}
}