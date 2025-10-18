var _current_diff = 0;
if (variable_global_exists("difficulty")) {
    _current_diff = global.difficulty;
}

var _initial_time = 60; //X Segundos

game_over_active = false; //Para el obj_gameover
 
 switch(_current_diff){
	 case 1: //Medium
		_initial_time = 45;
		break;
	case 2: //Hard
		_initial_time = 30;
		break;
 }
 
time_in_microseconds = _initial_time * 1000000;

function add_time(_seconds){
	time_in_microseconds += _seconds * 1000000;
}