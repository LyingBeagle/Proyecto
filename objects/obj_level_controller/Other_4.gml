
randomize(); //Asignar valores aleatorias al inicio del juego a cada fruta

//Iniciar variables
global.difficulty = 0; //0 = Easy, 1 = Medium, 2 = Hard
global.rounds_played = 0;
global.successful_operations = 0;
global.current_score = 10; // El puntaje empieza en 10

//Limpia los mapas de la sesión anterior
ds_map_clear(global.fruit_value_map);
ds_map_clear(global.fruit_modifiers);

//Prepara la lista de fracciones (para la dificultad "Fácil" por defecto)
global.fractions = [];
for (var i = 0; i < array_length(global.fractions_base); i++) {
    var _f = global.fractions_base[i];
    array_push(global.fractions, { display: _f.display, value: _f.value });
}

//Llena el mapa de valores con la asignación aleatoria INICIAL (para Fácil)
for (var i = 0; i < array_length(global.fruit_objects); i++) {
    var _fruit_type = global.fruit_objects[i];
    var _random_fraction = global.fractions[irandom(array_length(global.fractions) - 1)];
    ds_map_add(global.fruit_value_map, _fruit_type, _random_fraction);
}