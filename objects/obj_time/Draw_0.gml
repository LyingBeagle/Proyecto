//Convertir frames a segundos
var _total_seconds = floor(time_in_microseconds / 1000000);

//Calcular minutos y segundos
var _minutes = floor(_total_seconds / 60);
var _seconds = _total_seconds mod 60;

//Formateo para dos digitos
var _minutes_str = string(_minutes);
if(_minutes < 10){
	_minutes_str = "0" + _minutes_str;
}

var _seconds_str = string(_seconds);
if(_seconds < 10){
	_seconds_str = "0" + _seconds_str;
}

//Dibujo del texto 
var _time_display = _minutes_str + ":" + _seconds_str;

draw_set_font(fnf_game);
draw_set_color(c_white);
draw_set_halign(fa_right);
draw_set_valign(fa_top);

draw_text(room_width - 20, 20, _time_display);

//Reseteo
draw_set_halign(fa_left);