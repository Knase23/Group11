public class StartState {
	int startMenuStartTime;
	int timeUntilProceed;
	boolean ableToProceed;
	BackgroundManager back;
	PImage logo;
	public StartState () {
		back = new BackgroundManager(50,10);
		logo = assets[5];
	}
	public void update()
	{
		back.update();
		//here we check collisions and update information that should be displayed
		timeUntilProceed = (2 - (millis()-startMenuStartTime)/1000);
		ableToProceed = millis()-startMenuStartTime > 2000;
	}
	public void draw()
	{
		// Here we draw out everything / display what we want on screen 
		back.draw();
		textAlign(CENTER);
		rectMode(CENTER);
		imageMode(CENTER);
		image(logo, width/2,height/2 -75);
		textSize(14);
		if(ableToProceed)
		{	
			text("Press \"Space\" to start", width/2, height/2);
		} else {				
			text("Please Wait: "+ timeUntilProceed +"s" , width/2, height/2);		
		}
	}

}