//Prevencion de presionar mas de una vez
if(!instance_exists(obj_casino_logic) || obj_casino_logic.state != "waiting"){
	exit;
}

// Probabilidad de ganar (10% porciento)
var _is_winner = (irandom(99) < 10); //en 90 para probar si funciona bien el ganar

if (_is_winner) {
    // Se ganó
    // Se escoge una fruta random
    var _win_fruit_obj = global.fruit_objects[irandom(array_length(global.fruit_objects) - 1)];
    var _win_fruit_sprite = object_get_sprite(_win_fruit_obj);
    var _win_fruit_name = object_get_name(_win_fruit_obj);

    // Se construye la lista de modificadores
    var _modifiers = ["invert_operation", "halve_result"];
    if (global.difficulty >= 1) {
        array_push(_modifiers, "divide_fraction");
    }
    if (global.difficulty >= 2) {
        array_push(_modifiers, "invert_fraction");
    }
    
    // Se escoge un modificador random
    var _win_modifier = _modifiers[irandom(array_length(_modifiers) - 1)];

	var _log_msg = "Modifier_Win: " + _win_modifier + " on " + _win_fruit_name;
    log_event(_log_msg, global.rounds_played, global.current_score);

    // Se guarda el modificador en mapa global
    ds_map_add(global.fruit_modifiers, _win_fruit_obj, _win_modifier);

    // Se actualiza el controlador del casino
	obj_casino_logic.state = "result_win";
    obj_casino_logic.win_fruit_sprite = _win_fruit_sprite;
    
    var _modifiers_text = "";
    switch (_win_modifier) {
        case "invert_operation":
            _modifiers_text = "Invertir Operacion";
            break;
        case "halve_result":
            _modifiers_text = "Reducir el Resultado a la Mitad";
            break;
        case "divide_fraction":
            _modifiers_text = "Dividirse a la Mitad";
            break;
        case "invert_fraction":
            _modifiers_text = "Invertir su Fraccion";
            break;
        default:
            _modifiers_text = "un poder misterioso";
            break;
    }
	
    obj_casino_logic.result_message = "Felicidades, ahora " + _win_fruit_name + " tiene el poder de " + _modifiers_text;
}else{
	//Se perdio
	obj_casino_logic.state = "result_lose";
	
	obj_casino_logic.result_message = "Mala Suerte....";
}

    obj_continue._slot_used = true;