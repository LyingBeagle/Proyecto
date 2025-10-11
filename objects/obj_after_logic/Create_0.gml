fractions_to_assign = [];
var _num_fruits = array_length(global.fruit_objects);

//Bucle para lista de fracciones
for(var i=0;i<_num_fruits;i++){
	//Se eligen fracciones al azar
	var _random_fraction = global.fractions[irandom(array_length(global.fractions) - 1)];
	
	var _new_fraction_copy = {
		display: _random_fraction.display,
		value: _random_fraction.value
	};
	
	array_push(fractions_to_assign,_new_fraction_copy);
}

current_fraction_index = 0;

//Frutas por asignar
fruits_left = _num_fruits;

//Posiciones de frutas
//X -> Separaciones de 200px
//Y -> Separaciones de 200px
var _shelf_positions = [
	{x:250,y:50}, //Posicion de primera fruta
	{x:450,y:50}, // ''
	{x:250,y:250},
	{x:450,y:250},
	{x:250,y:425},
];

//Creacion de instancia para cada fruta
for(var i=0;i<array_length(global.fruit_objects);i++){
	var _fruit_obj = global.fruit_objects[i];
	var _pos = _shelf_positions[i];
	var _new_fruit = instance_create_layer(_pos.x,_pos.y, "Instances", _fruit_obj);
	
	//La fruta estara en modo menu
	_new_fruit.menu_mode = true;
}

function fruit_clicked(_fruit_instance){
	//Obtiene nueva fraccion de la lista barajada
	var _new_fraction = fractions_to_assign[current_fraction_index];
	
	//Se obtiene el tipo de objeto
	var _fruit_object_index = _fruit_instance.object_index;
	
	//Se reemplaza el valor antiguo en el mapa global permanente
	ds_map_replace(global.fruit_value_map, _fruit_object_index, _new_fraction);
	
	//Se actualiza las variables de la instancia
	_fruit_instance.fraction_display = _new_fraction.display;
	_fruit_instance.fraction_value = _new_fraction.value;
	
	//Siguiente index
	current_fraction_index++;
	fruits_left--;
	
	//Si ya se asigno a todas las frutas
	if(fruits_left <= 0){
		show_debug_message("Todas las frutas asignadas"); //Temporal
		//Codigo a la siguiente abitacion
	}
}