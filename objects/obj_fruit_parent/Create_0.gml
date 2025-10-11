//Check para saber si el mouse esta en la hitbox del objeto
moused = false;

//Check para saber si la fruta se puede clickear
can_click = true;

//Bandera para saber si la fruta esta en el menu
menu = false;

//Escalar imagen a los bordes dibujados
original_scale = 0.2;

//ID de posicion que asignara el obj_fruit_deck
fruit_position_id = -1;

//Si el mapa ya existe
if(variable_global_exists("fruit_value_map") && ds_exists(global.fruit_value_map, ds_type_map)){
	var _my_fraction = global.fruit_value_map[? object_index];
	
	fraction_display = _my_fraction.display; //Texto mostrado, ej: "1/2
	fraction_value = _my_fraction.value; //Valor numerico, ej: 0.5
}else{
	//En caso de error
	fraction_display = "N/A";
	fraction_value = 1;
}

//Para rm_after
menu_mode = false;