global.difficulty = 1;
// Log: (Evento, Rondas, Score) - ambos son 0 al inicio
log_event("Partida_Iniciada_Medio", 0, global.current_score);
room_goto(rm_play);