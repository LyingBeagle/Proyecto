//Solo si quedan frutas por dibujar
if(fruits_left > 0){
	var _current_fraction = fractions_to_assign[current_fraction_index];
	
	draw_set_font(fnf_game);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	//Se dibuja la fraccion en el lado derecho de la pantalla
	draw_text(room_width - 200, room_height / 2, _current_fraction.display);
	
	
	draw_set_halign(fa_left);
}