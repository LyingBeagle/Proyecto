//Hereda eventos del objeto padre
event_inherited();

//Guardando los sprites de las frutas a usar
global.fruit_objects = [
	obj_apple,
	obj_banana,
	obj_orange,
	obj_pear,
	obj_grape
	//Mas frutas
];

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
	//Por añadir
	
	//Generacion de 3 frutas
	generate_bottom_fruits(self);
}

// --- Inicializacion ---
//Generacion de las 3 frutas iniciales
generate_bottom_fruits(self);