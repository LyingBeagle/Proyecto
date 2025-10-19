if (room == rm_play) {
    
    // Limpia los mapas de la ronda anterior
    ds_map_clear(global.fruit_value_map);
    ds_map_clear(global.fruit_modifiers);
    
    global.fractions = []; // Resetea a una lista vacía
    for (var i = 0; i < array_length(global.fractions_base); i++) { //Copia manual
        var _f = global.fractions_base[i];
        array_push(global.fractions, { display: _f.display, value: _f.value });
    }
    
    //Añade fracciones según la dificultad
    if (global.difficulty >= 1) {
        array_push(global.fractions, {display: "0.1", value: 0.1});
        array_push(global.fractions, {display: "0.33", value: 0.33});
    }
    if (global.difficulty >= 2) {
        array_push(global.fractions, {display: "2/3", value: 0.66})
        array_push(global.fractions, {display: "1/3", value: 0.33});
    }

    //Llena el mapa de valores para esta ronda
    for (var i = 0; i < array_length(global.fruit_objects); i++) {
        var _fruit_type = global.fruit_objects[i];
        var _random_fraction = global.fractions[irandom(array_length(global.fractions) - 1)];
        ds_map_add(global.fruit_value_map, _fruit_type, _random_fraction);
    }
    
    //Genera las primeras frutas
    generate_bottom_fruits(self);
}