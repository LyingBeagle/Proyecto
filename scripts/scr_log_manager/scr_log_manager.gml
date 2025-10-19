#macro LOG_FILE_NAME "game_log.csv"

/// @function get_timestamp()
/// @description Devuelve la fecha y hora actual como un string.
function get_timestamp() {
    var _date = date_current_datetime();
    // Formato: "AAAA-MM-DD HH:MM:SS"
    return date_datetime_string(_date);
}

/// @function log_event(_event_name, _session_rounds, _session_score)
/// @description Escribe una nueva línea de datos en el archivo de log.
/// @param {string} _event_name El nombre del evento (ej: "Game_Over").
/// @param {real} _session_rounds Las rondas de esta sesión.
/// @param {real} _session_score El puntaje de esta sesión.
function log_event(_event_name, _session_rounds, _session_score) {
    
    //Revisa si el archivo existe para escribir los encabezado
    if (!file_exists(LOG_FILE_NAME)) {
        var _file = file_text_open_write(LOG_FILE_NAME);
        if (_file == -1) { exit; } // No se pudo crear el archivo
        
        // Escribe la primera línea (encabezados del CSV)
        var _headers = "Timestamp,PlayerID,Event,RondasSesion,ScoreSesion,RondaMaximaGeneral,MejorScoreGeneral,DificultadesPasadas(F-M-D)";
		file_text_write_string(_file, _headers);
		file_text_writeln(_file);               
		file_text_close(_file);
    }
    
    var _file = file_text_open_append(LOG_FILE_NAME);
    if (_file == -1) { exit; } // No se pudo abrir el archivo

    var _stamp = get_timestamp();
    var _player = global.playerID;
    var _rounds_max = global.max_round;
    var _score_best = global.best_score;
    // Formato "1-0-0" (Fácil=1, Medio=0, Difícil=0)
    var _diff_passed = string(global.easy_passed) + "-" + string(global.medium_passed) + "-" + string(global.hard_passed);

    // Construye la línea del CSV
    var _log_line = "";
    _log_line += string(_stamp) + ",";
    _log_line += string(_player) + ",";
    _log_line += string(_event_name) + ",";
    _log_line += string(_session_rounds) + ","; // Dato de la sesión
    _log_line += string(_session_score) + ",";  // Dato de la sesión
    _log_line += string(_rounds_max) + ",";     // Récord general
    _log_line += string(_score_best) + ",";     // Récord general
    _log_line += string(_diff_passed);

    // Escribe la línea en el archivo y se cierra
    file_text_write_string(_file, _log_line); // Escribe el texto
	file_text_writeln(_file);               // Escribe el salto de línea
	file_text_close(_file);
}