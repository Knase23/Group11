public class StartState {
	int startMenuStartTime;
	int timeUntilProceed;
	boolean ableToProceed;
	public StartState () {
		
	}
	public void update()
	{
		//here we check collisions and update information that should be displayed
		timeUntilProceed = (2 - (millis()-startMenuStartTime)/1000);
		ableToProceed = millis()-startMenuStartTime > 2000;
	}
	public void draw()
	{
		// Here we draw out everything / display what we want on screen 
		textAlign(CENTER);
		rectMode(CENTER);
		textSize(24);
		text("LOGO", width/2, height/2 - 75); 
		text("+", width/2, height/2 - 50); 
		text("Name", width/2, height/2 - 25); 
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