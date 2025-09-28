var _initial_time = 60;
time_in_microseconds = _initial_time * 1000000;

function add_time(_seconds){
	time_in_microseconds += _seconds * 1000000;
}