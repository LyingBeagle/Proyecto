//Tecla ENTER fue presionada?
if(keyboard_check_pressed(vk_enter)){
	
	//Solo se calcula si hay al menos 1 fruta en la operacion
	if(array_length(operation_list) > 0){
		
		var _result = base_number;
		
		for(var i = 0;i<array_length(operation_list);i++){
			
			var _part = operation_list[i];
			var _operator = _part.operator;
			var _value = _part.value;
			
			if(_operator == "+"){
				_result += _value;
			}else{
				_result -= _value;
			}
		}
		
		show_debug_message("Resultado calculado: " + string(_result));
		
		//Validar resultados
		if(_result < obj_score.current_score && _result > 0){
			
			global.successful_operation++; //Se aumenta la cantidad de operaciones correctas
			
			//Se actualiza puntuacion global
			if(instance_exists(obj_score)){
				obj_score.current_score = _result;	
			}
			
			if(instance_exists(obj_time)){
				obj_time.add_time(5);
			}
		}
		
		//Reseteo de operacion
		reset_operation();
	}
}