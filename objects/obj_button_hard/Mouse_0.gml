global.difficulty = 2;
// Log: (Evento, Rondas, Score) - ambos son 0 al inicio
log_event("Partida_Iniciada_Dificil", 0, global.current_score);
room_goto(rm_play);