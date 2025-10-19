//Guarda puntuaciones finales
final_score = variable_global_exists("current_score") ? global.current_score : 10;

final_rounds = variable_global_exists("rounds_played") ? global.rounds_played : 1;

log_event("Game_Over", final_rounds, final_score);

//Pausa todo lo de la pantalla
instance_deactivate_all(true);
