//Si la fruta puede ser clickeada y el mouse esta sobre ella y no tiene un cooldown
if (instance_exists(obj_fruit_deck) && obj_fruit_deck.selection_cooldown <= 0) {
    // Si la fruta puede ser clickeada y el mouse está sobre ella
    if (can_click && moused) {
        obj_fruit_deck.fruit_selected(self);
    }
}