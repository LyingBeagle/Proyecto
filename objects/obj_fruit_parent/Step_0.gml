//El cursor esta encima de la fruta
if(collision_point(mouse_x,mouse_y,self,false,false)){
	//Cambia moused a true
	moused = true;
	//Efecto visial: Agrandar la fruta ligeramente
	image_xscale = original_scale * 1.1;
	image_yscale = original_scale * 1.1;
}
else{
	//Cambia a falso
	moused = false;
	//La fruta vuelve al tamaño normal
	image_xscale = original_scale;
	image_yscale = original_scale;
}