import ddf.minim.*;
float deltaTime;
int time;
StateHandler state;
PImage[] assets;
//SoundFile mainMusic;
Minim settingsForSound;
AudioPlayer[] sounds;
AudioSample[] soundEffects;
void setup() 
{
	size (800, 800);
	LoadInAllImages(); 
	settingsForSound = new Minim(this);
	LoadInAllSounds();
	
	

	
	state = new StateHandler();
	//frameRate(60);
	 
}

void draw () 
{
	int currentTime = millis();
	deltaTime =  (currentTime - time) * 0.001f;
	
	//println("FPS: "+frameRate);
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
	assets = new PImage[7];
	//pla
	assets[0] = loadImage("/images/player.png");
	assets[1] = loadImage("/images/explode.png");

	// Enemy assets
	assets[2] = loadImage("/images/enemyOne.png");
	assets[6] = loadImage("/images/nemesis.png");

	// Background Assets
	assets[3] = loadImage("/images/nebulaOne.png");
	assets[4] = loadImage("/images/nebulaTwo.png");
	assets[5] = loadImage("/images/logo.png");
 	
}
public void LoadInAllSounds()
{
	sounds = new AudioPlayer[3];

	sounds[0] =  settingsForSound.loadFile("/sound/Cygnus_squad_ost.mp3"); // Main music
	sounds[1] =  settingsForSound.loadFile("/sound/Cygnus_squad_intro.mp3"); // start menu music
	sounds[2] =  settingsForSound.loadFile("/sound/Cygnus_squad_gameover.mp3"); // Game over sound sprite
	
	soundEffects = new AudioSample[4];
	soundEffects[0] =  settingsForSound.loadSample("/sound/explosion_fx01.mp3"); // First explosion sound sprite
	soundEffects[1] =  settingsForSound.loadSample("/sound/explosion_fx02.mp3"); // Second explosion sound sprite
	soundEffects[2] =  settingsForSound.loadSample("/sound/laser_fx01.mp3"); // First laser sound sprite
	soundEffects[3] =  settingsForSound.loadSample("/sound/laser_fx04.mp3"); // Second laser sound sprite
	soundEffects[0].mute();
	soundEffects[1].mute();
	soundEffects[2].mute();
	soundEffects[3].mute();

}
