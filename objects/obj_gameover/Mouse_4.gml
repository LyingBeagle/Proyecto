//S reactiva todas las instancias
instance_activate_all();

if (instance_exists(obj_score)) {
    obj_score.current_score = 10; 
}
if (ds_exists(global.fruit_modifiers, ds_type_map)) {
    ds_map_clear(global.fruit_modifiers);
}
global.rounds_played = 0;

//Vuelve al menú de niveles
room_goto(rm_levels);

instance_destroy();