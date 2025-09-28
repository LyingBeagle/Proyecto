if(time_in_microseconds > 0){
	time_in_microseconds -= delta_time;
}else{
	//Si se llega a 0 se cierra el juego
	game_end();
}