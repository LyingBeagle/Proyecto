if(room = rm_play){

//Apariencia de la puntuacion
draw_set_font(fnf_game);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//Se dibuja la puntuacion en la parte superior central de la pantalla
draw_text(room_width / 2, 60,  global.current_score)

//Se resertea la alineacion
draw_set_halign(fa_left);
draw_set_valign(fa_top);

}