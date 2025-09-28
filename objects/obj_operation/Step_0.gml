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
		if(_result < base_number && _result > 0){
			//Se actualiza puntuacion global
			if(instance_exists(obj_score)){
				obj_score.current_score = _result;	
			}
		}
		
		//Reseteo de operacion
		reset_operation();
	}
}