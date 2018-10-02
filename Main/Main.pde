float time, deltaTime;
StateHandler state;
void setup() 
{
	size (800, 800);
	state = new StateHandler();
	frameRate(60);  
}

void draw () 
{
	long currentTime = millis();
	deltaTime =  (currentTime - time) * 0.001f;
	
	
	state.update();
	state.draw();
	time = currentTime;
}
