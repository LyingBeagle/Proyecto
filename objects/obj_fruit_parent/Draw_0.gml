draw_self();

//Mostrar fraccion que tiene fruta
if(moused){
	draw_set_font(fnf_game); //fuente: Pixpils
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	
	draw_text(x + 50, y, fraction_display);
	
	draw_set_halign(fa_left);
}