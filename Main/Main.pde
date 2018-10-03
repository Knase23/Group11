float time, deltaTime;
StateHandler state;
PImage[] assets;
void setup() 
{
	size (800, 800);
	LoadInAllImages(); 
	state = new StateHandler();
	frameRate(60);
	 
}

void draw () 
{
	long currentTime = millis();
	deltaTime =  (currentTime - time) * 0.001f;
	
	//println("FPS: "+frameRate);
	state.update();
	state.draw();
	time = currentTime;
}

public void LoadInAllImages() {
	assets = new PImage[5];
	//pla
	assets[0] = loadImage("/images/player.png");
	assets[1] = loadImage("/images/explode.png");

	// Enemy assets
	assets[2] = loadImage("/images/enemyOne.png");
	
	// Background Assets
	assets[3] = loadImage("/images/nebulaOne.png");
	assets[4] = loadImage("/images/nebulaTwo.png");
	
}