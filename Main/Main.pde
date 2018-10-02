float time, deltaTime;
GameState state;
LevelManager level = new LevelManager();
void setup() 
{
	size (800, 800);
	state = new GameState();  
}

void draw () 
{
	long currentTime = millis();
	deltaTime =  (currentTime - time) * 0.001f;
	
	background(0);

	state.update();
	state.draw();
	level.update(state);
	time = currentTime;
}
