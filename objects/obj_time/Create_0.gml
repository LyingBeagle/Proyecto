var _initial_time = 40; //X Segundos
time_in_microseconds = _initial_time * 1000000;

function add_time(_seconds){
	time_in_microseconds += _seconds * 1000000;
}