//En caso de que la instancia ya exista
if(instance_number(object_index)>1){
	instance_destroy();
	exit;
}

randomize(); //Asignar valores aleatorias al inicio del juego a cada fruta
global.successful_operation = 0; //Operaciones correctas


//Hereda eventos del objeto padre
event_inherited();

//Cooldown de seleccion de frutas (60 frames = 1s a 60fps)
selection_cooldown = 0;

//Guardando los sprites de las frutas a usar
global.fruit_objects = [
	obj_apple,
	obj_banana,
	obj_orange,
	obj_pear,
	obj_grape
	//Mas frutas
];

//-- Lista de fracciones disponibles --
global.fractions = [
	{display: "1/1", value: 1}, //Lo que se muestra y el valor real
	{display: "1/2", value: 0.5},
	{display: "1/4", value: 0.25},
	{display: "3/4", value: 0.75}
];

//Mapa para valores de frutas
global.fruit_value_map = ds_map_create();

global.sprite_to_object_map = ds_map_create();

for(var i = 0;i<array_length(global.fruit_objects);i++){
	var _fruit_type = global.fruit_objects[i];
	
	var _random_fraction = global.fractions[irandom(array_length(global.fractions) - 1)];
	
	ds_map_add(global.fruit_value_map,_fruit_type,_random_fraction);
}

for(var i = 0;i < array_length(global.fruit_objects);i++){
	var _fruit_obj = global.fruit_objects[i];
    var _sprite = object_get_sprite(_fruit_obj);
    ds_map_add(global.sprite_to_object_map, _sprite, _fruit_obj);
}

//------ Posiciones para frutas deck ----
y_pos_fruits = 550; //Se ajusta coordenada y segun la room
x_pos_fruit1 = room_width / 2 - 300;
x_pos_fruit2 = room_width / 2;
x_pos_fruit3 = room_width / 2 + 300;

// Se almacena las IDs de las instancias de frutas actuales.
current_fruit_instances = [];

//--- Funcion para manejar seleccion de frutas ---
//Se llamara a esta funcion cuando se le haga click al objeto fruta
function fruit_selected(_selected_fruit_instance){
	show_debug_message("Fruta seleccionada en la posicion: " + string(_selected_fruit_instance.fruit_position_id));
	
	if(instance_exists(obj_operation)){
		obj_operation.add_to_operation(
		_selected_fruit_instance.fraction_value,
		_selected_fruit_instance.sprite_index); //Para mostrar la fruta en la operacion
	}
	
	//Generacion de 3 frutas
	generate_bottom_fruits(self);
	
	//Inicio de cooldown
	selection_cooldown = 30 //60 frames = 1 s 
}

// --- Inicializacion ---
//Generacion de las 3 frutas iniciales
//generate_bottom_fruits(self);


//Mapa para modificadores
global.fruit_modifiers = ds_map_create();