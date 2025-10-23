if (room == rm_play) {
    
	log_event("Enter_Room_Play", global.rounds_played, global.current_score);
	
    //Genera las primeras frutas
    generate_bottom_fruits(self);
}