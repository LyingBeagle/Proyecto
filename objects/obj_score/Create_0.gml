//Si otro objeto score existe, se destruye el nuevo
if(instance_number(object_index) >1 ){
	instance_destroy();
	exit;
}

//Valor base = 10
current_score = 10;

