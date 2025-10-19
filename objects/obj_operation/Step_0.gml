//Tecla ENTER fue presionada?
if(keyboard_check_pressed(vk_enter)){
	
	//Solo se calcula si hay al menos 1 fruta en la operacion
	if(array_length(operation_list) > 0){
		
		var _result = base_number;
		var _invert_ops = false;
		
		//Se checkea si invertir operacion esta activa
		if(array_contains(active_modifiers, "invert_operation")){
			_invert_ops = true;
		}
		
		for(var i = 0;i<array_length(operation_list);i++){
			
			var _part = operation_list[i];
			var _operator = _part.operator;
			var _value = _part.value;
			
			var _fruit_obj = global.sprite_to_object_map[? _part.sprite];
			var _modifier = ds_map_find_value(global.fruit_modifiers, _fruit_obj);
			
			if(is_undefined(_modifier)){
				//Modificador Dividir fraccion (1/2) / 2
				if(_modifier == "divide_fraction"){
					_value /= 2;
				}
				//Modificador de invertir fraccion 1/3 -> 3/1
				if(_modifier == "invert_fractrion" && _value!=0){
					_value = 1/ _value;
				}
			}
			
			//Modificador de invertir operacion
			if (_invert_ops) {
		        switch (_operator) {
		            case "+": _operator = "-"; break;
		            case "-": _operator = "+"; break;
		            case "*": _operator = "/"; break;
		            case "/": _operator = "*"; break;
		        }
		    }
			
			
			// --- Realizar el cálculo ---
		    switch (_operator) {
		        case "+": _result += _value; break;
		        case "-": _result -= _value; break;
		        case "*": _result *= _value; break;
		        case "/": if (_value != 0) { _result /= _value; } break; // Evitar división por cero
		    }
		}
		
		//Modificador de dividir resultado a la mitad
		//Se checkea si "halve_result" esta activa
		if(array_contains(active_modifiers, "halve_result")){
			_result /= 2;
		}
		
		show_debug_message("Resultado calculado: " + string(_result));
		
		//Validar resultados
		if(_result < global.current_score && _result > 0){
			
			global.successful_operations++; //Se aumenta la cantidad de operaciones correctas
			
			//Se actualiza puntuacion global
			if(instance_exists(obj_score)){
				global.current_score = _result;	
			}
			
			
			if(instance_exists(obj_time)){
				obj_time.add_time(5);
			}
		}
		
		//Reseteo de operacion
		reset_operation();
	}
}