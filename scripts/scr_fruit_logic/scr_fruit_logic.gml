/// @function generate_bottom_fruits()
/// @description Genera 3 frutas aleatorias en la parte inferior de la pantalla.
function generate_bottom_fruits(_caller_object) {
	
    // Primero, destruye las frutas que ya existen.
    for (var i = 0; i < array_length(_caller_object.current_fruit_instances); i++) {
        var _fruit_id =_caller_object.current_fruit_instances[i];
        if (instance_exists(_fruit_id)) {
            instance_destroy(_fruit_id);
        }
    }
    _caller_object.current_fruit_instances = []; // Resetea el array.
	
	
	/* Asignacion aleatoria de fracciones para frutas
	//Se crea un mapa para que las frutas iguales tengan el mismo valor
	var _fruit_fraction_map = ds_map_create();
	
	//Pre-asignar una fraccion aleatoria a cada tipo de fruta globalmente
	for(var i = 0;i<array_length(global.fruit_objects);i++){
		var _fruit_type  = global.fruit_objects[i];
		var _random_fraction = global.fractions[irandom(array_length(global.fractions) - 1)];
		
		//mapa clave: Objeto fruta, valor: fraccion
		ds_map_add(_fruit_fraction_map, _fruit_type, _random_fraction);
	}
	*/

    // Genera 3 nuevas frutas
    for (var i = 0; i < 3; i++) {
		
        var _random_fruit_obj = global.fruit_objects[irandom(array_length(global.fruit_objects) - 1)];
		
        var _current_x_pos = 0;
        switch (i) {
            case 0: _current_x_pos = _caller_object.x_pos_fruit1; break;
            case 1: _current_x_pos = _caller_object.x_pos_fruit2; break;
            case 2: _current_x_pos = _caller_object.x_pos_fruit3; break;
        }
        
        var _new_fruit_instance = instance_create_layer(_current_x_pos, _caller_object.y_pos_fruits, "Instances", _random_fruit_obj);
		
		//var _assigned_fraction = _fruit_fraction_map[? _random_fruit_obj];
		
		/*
	   //Se asigna a la nueva fruta
	   _new_fruit_instance.fraction_display = _assigned_fraction.display;
	   _new_fruit_instance.fraction_value = _assigned_fraction.value;
	   */
	   
	   _new_fruit_instance.fruit_position_id = i;

        array_push(_caller_object.current_fruit_instances, _new_fruit_instance);
    }
	
	//ds_map_destroy(_fruit_fraction_map);
}