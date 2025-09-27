event_inherited();

//Si esta activo el cooldown esta activo, se redice cada 1 frame
if(selection_cooldown > 0){
	selection_cooldown--;
}