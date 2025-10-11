//Si la fruta puede ser clickeada y el mouse esta sobre ella y no tiene un cooldown
if (instance_exists(obj_fruit_deck) && obj_fruit_deck.selection_cooldown <= 0) {
    // Si la fruta puede ser clickeada y el mouse está sobre ella
    if (can_click && moused) {
		
		if(menu_mode){
			//Pantalla de asignacion (rm_after)
			if(instance_exists(obj_after_logic)){
				obj_after_logic.fruit_clicked(self);
				
				//Se desactiva el click para esta fruta
				can_click = false;
			}
		}else{
			//Pantalla de juego (rm_play)
			if(instance_exists(obj_fruit_deck) && obj_fruit_deck.selection_cooldown <= 0){
				obj_fruit_deck.fruit_selected(self);
			}
		}
    }
}