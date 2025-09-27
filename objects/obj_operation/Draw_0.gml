draw_set_font(fnf_game);
draw_set_color(c_white);
draw_set_valign(fa_middle);

var _total_width = 0;
var _spacing = 40; //Espacio entre elemenots en px
var _sprite_scale = 0.2 //Escalar tamaño de los sprites
var _base_text = string(base_number);
_total_width += string_width(_base_text);

for(var i = 0;i<array_length(operation_list);i++){
	var _part = operation_list[i];
	_total_width += _spacing + string_width(_part.operator);
	_total_width += _spacing + sprite_get_width(_part.sprite) * _sprite_scale;
}

_total_width += _spacing + string_width(next_operator);


var _draw_x = (room_width / 2) - (_total_width / 2);
var _draw_y = (room_height / 2);

draw_set_halign(fa_left);

draw_text(_draw_x, _draw_y, _base_text);
_draw_x += string_width(_base_text);

for(var i = 0;i<array_length(operation_list);i++){
	var _part = operation_list[i];
	_draw_x += _spacing;
	
	
	//Operador
	draw_text(_draw_x, _draw_y, _part.operator);
	_draw_x+= string_width(_part.operator);
	
	_draw_x += _spacing;
	
	//Fruta
	draw_sprite_ext(_part.sprite, 0, _draw_x,_draw_y - 50, _sprite_scale, _sprite_scale, 0, c_white, 1);
	_draw_x += sprite_get_width(_part.sprite) * _sprite_scale;
}

_draw_x += _spacing;
draw_text(_draw_x, _draw_y, next_operator);

// Reseteo de alineación
draw_set_halign(fa_left);
draw_set_valign(fa_top);



//Reseteo
draw_set_halign(fa_center);