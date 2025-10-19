//Mini seccion para para guardar logs
ini_open("save.ini");
global.easy_passed = ini_read_real("Progress", "Easy", 0);
global.medium_passed = ini_read_real("Progress", "Medium", 0);
global.hard_passed = ini_read_real("Progress", "Hard", 0);

//Stats jugador
global.playerID = ini_read_string("Player", "ID", "player_" + string(random_get_seed()));
global.best_score = ini_read_real("Stats", "BestScore", 10);
global.max_round = ini_read_real("Stats", "MaxRound", 0);
ini_close();

//Guardar ID por si se acaba de crear
ini_open("save.ini");
ini_write_string("Player","ID", global.playerID);
ini_close();

//Iniciar variables
global.difficulty = 0; //0 = Easy, 1 = Medium, 2 = Hard
global.rounds_played = 0;
global.successful_operations = 0;
global.current_score = 10; // El puntaje empieza en 10