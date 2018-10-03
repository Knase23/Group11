public class GameOverState {
  	int gameOverStartStartTime = 0;
  	int timeUntilProceed;
	boolean ableToProceed = false;

	int survivalTime = 0;
	int kills = 0;
	public GameOverState () {
		
	}
	public void update(GameState prevGame)
	{
		survivalTime = prevGame.playerSurvivalTime;
		kills = prevGame.playerEnemyKills;
		if(!ableToProceed)
		{
			timeUntilProceed = (2 - (time-gameOverStartStartTime)/1000);
		}
		ableToProceed = time-gameOverStartStartTime > 2000;
		//here we check collisions and update information that should be displayed
	}
	public void draw()
	{
		// Here we draw out everything / display what we want on screen 
		textAlign(CENTER);
		rectMode(CENTER);
		fill(0,125);
		noStroke();
		rect(width/2, height/2, width/2, height/2);
		fill(255);
		textSize(24);

		text("Game Over maaan!!", width/2, height/2 - 50);
		text("Game Over!!!", width/2, height/2 - 25);
		
		if(ableToProceed)
		{	
			textSize(14);
			text("Press \"Space\" to get to Start Menu", width/2, height/2);
		} else {
			textSize(14);
			text("Please Wait: "+ timeUntilProceed +"s" , width/2, height/2);
		}
	}

}