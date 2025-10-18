var _centerX = display_get_gui_width() / 2;
var _centerY = display_get_gui_height() / 2;

var _sprite_scale = 0.2;
var _text_scale = 1;

draw_sprite_ext(sprite_index, 0, _centerX, _centerY, _sprite_scale, _sprite_scale, 0, c_white, 1);

draw_set_font(fnf_game);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

// Offsets relativos al sprite escalado
var _score_offsetX_scaled = 60 * _sprite_scale;
var _score_offsetY_scaled = -20 * _sprite_scale;
var _rounds_offsetX_scaled = 60 * _sprite_scale;
var _rounds_offsetY_scaled = 50 * _sprite_scale;

// Dibujo de valor de puntuacion (Score)
draw_text_transformed(
    _centerX + _score_offsetX_scaled + 80, //X
    _centerY + _score_offsetY_scaled + 20, //Y
    string(final_score), 
    _text_scale,
    _text_scale,
    0
);

//Dibujo de valor de rondas (Rounds)
draw_text_transformed(
    _centerX + _rounds_offsetX_scaled + 80, //X
    _centerY + _rounds_offsetY_scaled + 120, //Y
    string(final_rounds), 
    _text_scale,
    _text_scale,
    0
);

// Resetea la alineación
draw_set_halign(fa_left);