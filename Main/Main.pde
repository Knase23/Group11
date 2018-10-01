Gamestate state;
void setup() 
{
	size (800, 800);
	state = new Gamestate();  
}

void draw () 
{
	state.update();
	state.draw();
}
