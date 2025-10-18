//S reactiva todas las instancias
instance_activate_all();

//Comprobacion de si se vencio la dificultad
if(final_rounds >= 3){
	//Se paso
	switch(global.difficulty){
		case 0: global.easy_passed = 1; break;
		case 1: global.medium_passed = 1; break;
		case 2: global.hard_passed = 1; break;
	}
	
	//Se guarda el progreso
	ini_open("save.ini");
	ini_write_real("Progress", "Easy", global.easy_passed);
	ini_write_real("Progress", "Medium", global.medium_passed);
	ini_write_real("Progress", "Hard", global.hard_passed);
	ini_close();
}



if (instance_exists(obj_score)) {
    obj_score.current_score = 10; 
}
if (ds_exists(global.fruit_modifiers, ds_type_map)) {
    ds_map_clear(global.fruit_modifiers);
}
global.rounds_played = 0;

//Vuelve al menú de niveles
room_goto(rm_levels);

instance_destroy();