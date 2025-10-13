//Variables para la operacion
operation_list = [] //Lista que guardara los operadores y valores ej: [+,0.5,-]
base_number = 10; //Numero inicial de la operacion, conectado a obj_score
display_string = ""; //Texto mostrado en pantalla ej 10-1/2
next_operator = ""; //Para ver el siguiente operador antes de elegir fruta ej: 10 + 
active_modifiers = [];

//Añadi valor a operacion
add_to_operation = function(_fruit_value, _fruit_sprite){
	
	var _operation_part = {
		operator: next_operator,
		value: _fruit_value,
		sprite: _fruit_sprite
	};
	
	array_push(operation_list, _operation_part);
	
	//Checkeo de modificadores
	var _fruit_obj = global.sprite_to_object_map[? _fruit_sprite];
	var _modifier = ds_map_find_value(global.fruit_modifiers, _fruit_obj);
	
	if(!is_undefined(_modifier)){
		array_push(active_modifiers, _modifier);
	}
	
	//Se actualiza string que se muestra en pantalla
	next_operator = choose("+","-");
}

//Limpiar para siguiente operacion
reset_operation = function(){
	operation_list = [];
	active_modifiers = [];
	
	//Eleccion del primer operador ed la ronda
	next_operator = choose("+","-");
}

//Al inicio de todo
reset_operation();