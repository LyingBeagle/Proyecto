 var _initial_time = 60; //X Segundos
 
 switch(global.difficulty){
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