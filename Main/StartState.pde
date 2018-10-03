public class StartState {
	int startMenuStartTime;
	int timeUntilProceed;
	boolean ableToProceed;
	BackgroundManager back;
	public StartState () {
		back = new BackgroundManager(50,10);
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
		textSize(24);
		text("LOGO", width/2, height/2 - 75); 
		text("+", width/2, height/2 - 50); 
		text("Cygnus Squad", width/2, height/2 - 25); 
		if(ableToProceed)
		{	
			textSize(14);
			text("Press \"Space\" to start", width/2, height/2);
		} else {				
			textSize(14);
			text("Please Wait: "+ timeUntilProceed +"s" , width/2, height/2);		
		}
	}

}