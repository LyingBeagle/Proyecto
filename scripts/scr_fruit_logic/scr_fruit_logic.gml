/// @function generate_bottom_fruits()
/// @description Genera 3 frutas aleatorias en la parte inferior de la pantalla.
function generate_bottom_fruits(_caller_object) {
	
	var _instance_array = _caller_object.current_fruit_instances;
	
    // Primero, destruye las frutas que ya existen.
    for (var i = 0; i < array_length(_instance_array); i++) {
        var _fruit_id =_instance_array[i];
        if (instance_exists(_fruit_id)) {
            instance_destroy(_fruit_id);
        }
    }
    _caller_object.current_fruit_instances = []; // Resetea el array.

    // Genera 3 nuevas frutas
    for (var i = 0; i < 3; i++) {
        var _random_fruit_obj = global.fruit_objects[irandom(array_length(global.fruit_objects) - 1)];

        var _current_x_pos = 0;
        switch (i) {
            case 0: _current_x_pos = x_pos_fruit1; break;
            case 1: _current_x_pos = x_pos_fruit2; break;
            case 2: _current_x_pos = x_pos_fruit3; break;
        }

        var _new_fruit_instance = instance_create_layer(_current_x_pos, y_pos_fruits, "Instances", _random_fruit_obj);
        _new_fruit_instance.fruit_position_id = i;

        array_push(_caller_object.current_fruit_instances, _new_fruit_instance);
    }
}