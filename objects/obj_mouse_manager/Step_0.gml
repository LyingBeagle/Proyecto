//Se mueve la fruta seleccionada
if(global.pause == false)
{
	//En caso de mover el cursor rapidamente y dejar la fruta muy rapido
	if(grabbed_fruit != noone){
		//Mientras estemos seleccionando una fruta
		//Define x e y al cursor
		grabbed_fruit.x = lerp(grabbed_fruit.x, mouse_x, lerp_amount);
		grabbed_fruit.y = lerp(grabbed_fruit.y, mouse_y, lerp_amount);
		looking_at = grabbed_fruit.id;
	}
	
	if !(mouse_check_button(mb_left)){
		//Se resetea carta seleccionada cuando no se selecciona nada
		grabbed_fruit = noone;
	}
}