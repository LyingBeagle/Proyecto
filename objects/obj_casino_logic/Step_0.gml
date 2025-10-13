//Si estamos en el estado de ganar y hay tiempo
if(state = "result_win" && win_timer > 0){
	win_timer -= delta_time; //contador con delta time
	
	if(win_timer <= 0){
		show_debug_message("Se acabo el tiempo");
		//Por ahora no pasa nada, se pasara a la siguiente ronda con todos los cambios hechos
		
		state = "finished"; //Termino de operaciones
	}
}