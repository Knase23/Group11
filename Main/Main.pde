import ddf.minim.*;
float time, deltaTime;
StateHandler state;
PImage[] assets;
//SoundFile mainMusic;
Minim settingsForSound;
AudioPlayer mainMusic;
void setup() 
{
	size (800, 800);
	LoadInAllImages(); 
	settingsForSound = new Minim(this);
	mainMusic = settingsForSound.loadFile("/sound/Cygnus_squad_ost.mp3");
	mainMusic.play();
	
	state = new StateHandler();
	//frameRate(60);
	 
}

void draw () 
{
	long currentTime = millis();
	deltaTime =  (currentTime - time) * 0.001f;
	
	println("FPS: "+frameRate);
	state.update();
	state.draw();
	time = currentTime;
}
void exit()
{
	println("Exiting sketch");
	state.highScores.saveHighScores();
	super.exit();
}

public void LoadInAllImages() {
	assets = new PImage[6];
	//pla
	assets[0] = loadImage("/images/player.png");
	assets[1] = loadImage("/images/explode.png");

	// Enemy assets
	assets[2] = loadImage("/images/enemyOne.png");
	
	// Background Assets
	assets[3] = loadImage("/images/nebulaOne.png");
	assets[4] = loadImage("/images/nebulaTwo.png");
	assets[5] = loadImage("/images/logo.png");
 	
}
