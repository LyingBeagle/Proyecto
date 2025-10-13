//Dibujo del mensaje
draw_set_font(fnf_game);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(room_width / 2, room_height - 100, result_message);

//Si el jugador gano, se dibujan la frutas en la maquina
if(state == "result_win" && sprite_exists(win_fruit_sprite)){
	
	var _sprite_scale = 0.3;
	
	//Dibujado de las tres frutas (temporal)
	draw_sprite_ext(win_fruit_sprite, 0, 310, 100, _sprite_scale, _sprite_scale, 0, c_white, 1);
	draw_sprite_ext(win_fruit_sprite, 0, 580, 100, _sprite_scale, _sprite_scale, 0, c_white, 1);
	draw_sprite_ext(win_fruit_sprite, 0, 840, 100, _sprite_scale, _sprite_scale, 0, c_white, 1);
	
	//Dibujado en la parte inferior de la maquina
	draw_sprite_ext(win_fruit_sprite, 0, 580, 430, _sprite_scale, _sprite_scale, 0, c_white, 1);
}

draw_set_halign(fa_left);