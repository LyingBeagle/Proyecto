//Guarda puntuaciones finales
final_score = instance_exists(obj_score) ? obj_score.current_score : 10;

final_rounds = variable_global_exists("rounds_played") ? global.rounds_played : 1;

//Pausa todo lo de la pantalla
instance_deactivate_all(true);
