//Mini seccion para para guardar logros
ini_open("save.ini");
global.easy_passed = ini_read_real("Progress", "Easy", 0);
global.medium_passed = ini_read_real("Progress", "Medium", 0);
global.hard_passed = ini_read_real("Progress", "Hard", 0);
ini_close();


//0 = Easy, 1 = Medium, 2 = Hard
global.difficulty = 0; //Por defecto

