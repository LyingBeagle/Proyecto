global.difficulty = 2;

//Reconstruye la lista de fracciones
global.fractions = [];
for (var i = 0; i < array_length(global.fractions_base); i++) {
    var _f = global.fractions_base[i];
    array_push(global.fractions, { display: _f.display, value: _f.value });
}

//Nuevas fracciones
array_push(global.fractions, {display: "0.1", value: 0.1});
array_push(global.fractions, {display: "0.33", value: 0.33});
array_push(global.fractions, {display: "2/3", value: 0.66});
array_push(global.fractions, {display: "1/3", value: 0.33});

//Borra y vuelve a llenar el mapa de valores
ds_map_clear(global.fruit_value_map);
for (var i = 0; i < array_length(global.fruit_objects); i++) {
    var _fruit_type = global.fruit_objects[i];
    var _random_fraction = global.fractions[irandom(array_length(global.fractions) - 1)];
    ds_map_add(global.fruit_value_map, _fruit_type, _random_fraction);
}


// Log: (Evento, Rondas, Score) - ambos son 0 al inicio
log_event("Partida_Iniciada_Dificil", 0, global.current_score);
room_goto(rm_play);