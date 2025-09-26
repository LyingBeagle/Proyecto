//Si la fruta puede ser clickeada y el mouse esta sobre ella
if(can_click && moused) {
	//Nos aseguramos que el deck exista antes de llamarlo
	if(instance_exists(obj_fruit_deck)){
		//Llama a la funcion 'fruit_selected' del deck y se pasa a si mismo como argumento
		obj_fruit_deck.fruit_selected(self);
	}
}