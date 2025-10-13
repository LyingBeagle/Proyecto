//Prevencion de presionar mas de una vez
if(!instance_exists(obj_casino_logic) || obj_casino_logic.state != "waiting"){
	exit;
}

// Probabilidad de ganar (10% porciento)
var _is_winner = (irandom(99) < 99);

if(_is_winner){
	//Se gano
	//Se escoje una fruta random
	var _win_fruit_obj = global.fruit_objects[irandom(array_length(global.fruit_objects) - 1)];
	var _win_fruit_sprite = object_get_sprite(_win_fruit_obj);
	var _win_fruit_name = object_get_name(_win_fruit_obj);
	
	//Se escoje un modificador random
	var _modifiers = ["invert_operation", "halve_result"];
	var _win_modifier = _modifiers[irandom(array_length(_modifiers) - 1)];
	
	//Se guarda el modificador en mapa global
	ds_map_add(global.fruit_modifiers, _win_fruit_obj, _win_modifier);
	
	//Se actualiza el controlador del casino
	obj_casino_logic.state = "result_win";
	obj_casino_logic.win_fruit_sprite = _win_fruit_sprite;
	var _modifiers_text = (_win_modifier == "invert_operation") ? "Invertir Operacion" : "Reducir a la mitad";
	obj_casino_logic.result_message = "Felicidades, ahora " + _win_fruit_name + " tiene el poder de " + _modifiers_text;
	obj_casino_logic.win_timer = 10 * 1000000;
}else{
	//Se perdio
	obj_casino_logic.state = "result_lose";
	obj_casino_logic.result_message = "Mala Suerte....";
}

