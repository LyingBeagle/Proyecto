//SDe reactiva todas las instancias
instance_activate_all();

//S guarda el mejor puntaje y la ronda máxima
var _new_record = false;

if (final_rounds >= 3) {
    switch (global.difficulty) {
        case 0: if (!global.easy_passed) { global.easy_passed = 1; _new_record = true; } break;
        case 1: if (!global.medium_passed) { global.medium_passed = 1; _new_record = true; } break;
        case 2: if (!global.hard_passed) { global.hard_passed = 1; _new_record = true; } break;
    }
}

//Comprobación de mejor puntaje
if (final_score < global.best_score) {
    global.best_score = final_score;
    _new_record = true;
}

//Comprobación de ronda máxima
if (final_rounds > global.max_round) {
    global.max_round = final_rounds;
    _new_record = true;
}

// Si hay un nuevo récord, se guarda en .ini y se registra
if (_new_record) {
    ini_open("save.ini");
    ini_write_real("Progress", "Easy", global.easy_passed);
    ini_write_real("Progress", "Medium", global.medium_passed);
    ini_write_real("Progress", "Hard", global.hard_passed);
    ini_write_real("Stats", "BestScore", global.best_score);
    ini_write_real("Stats", "MaxRound", global.max_round);
    ini_close();
    
    log_event("Nuevo_Record", final_rounds, final_score);
}

/*
if (instance_exists(obj_score)) {
    global.current_score = 10; 
}
*/

if (ds_exists(global.fruit_modifiers, ds_type_map)) {
    ds_map_clear(global.fruit_modifiers);
}

//global.rounds_played = 0;

room_goto(rm_levels);

instance_destroy();