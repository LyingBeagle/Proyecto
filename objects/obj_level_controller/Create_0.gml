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


//-- Lista de frutas disponible
global.fruit_objects = [
	obj_apple,
	obj_banana,
	obj_orange,
	obj_pear,
	obj_grape
	//Mas frutas
];

//-- Lista de fracciones disponibles --
global.fractions_base = [
	{display: "1/1", value: 1}, //Lo que se muestra y el valor real
	{display: "1/2", value: 0.5},
	{display: "1/4", value: 0.25},
	{display: "3/4", value: 0.75}
];

//Crea los mapas globales (vacíos) UNA SOLA VEZ
global.fruit_value_map = ds_map_create();
global.sprite_to_object_map = ds_map_create();
global.fruit_modifiers = ds_map_create();

for (var i = 0; i < array_length(global.fruit_objects); i++) {
    var _fruit_obj = global.fruit_objects[i];
    var _sprite = object_get_sprite(_fruit_obj);
    ds_map_add(global.sprite_to_object_map, _sprite, _fruit_obj);
}