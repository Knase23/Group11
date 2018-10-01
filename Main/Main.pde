float time, deltatime;
Gamestate state;
void setup() 
{
	size (800, 800);
	state = new Gamestate();  
}

void draw () 
{
	long currentTime = millis();
	deltatime =  (currentTime - time) * 0.001f;
	
	background(0);
	
	state.update();
	state.draw();

	time = currentTime;
}
