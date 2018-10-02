public class StateHandler{

	int gameStartTime;
	int startMenuStartTime;
	int gameOverStartStartTime;

	boolean startState = true, gameState = false, gameOverState = false;


	// StartState startMenu;
	GameState game;
	// GamveOverState gameOverMenu;

	LevelManager levelConfig;

	public StateHandler () {
		levelConfig = new LevelManager();
	}
	public void update()
	{

		if(startState)
		{

			//Code that updates Start Menu information
			// if we have boxes to press on, check if arrow is inside the box and has clicked the box
			// otherwise just do nothing until a key is pressed, as of current you need to press Space to go to the game

			
			background(0, 0, 0);
			if(millis()-startMenuStartTime > 2000)
			{	
				textAlign(CENTER);
				rectMode(CENTER);
				text("Press Space to start", width/2, height/2);
			} else {

				rectMode(CENTER);
				textAlign(CENTER);
				text("Please Wait: "+ (2 - (millis()-startMenuStartTime)/1000) +"s" , width/2, height/2);
				
			}	

			if(isSpacePressed && millis()-startMenuStartTime > 2000)
			{
				gameState = true;
				startState = false;
				gameStartTime = millis();
				println("In GameState");
			}

		} else if(gameState)
		{
			if(game == null || game.gameOver() )
			{
				game = new GameState();
				levelConfig = new LevelManager(gameStartTime);
			} else 
			{
				levelConfig.update(game);
				game.update(gameStartTime);
				if(game.gameOver())
				{
					gameState = false;
					gameOverState = true;
					gameOverStartStartTime = millis();
					println("In GamveOverState");
					background(0, 0, 0);
				}
			}
		} else if (gameOverState) {
			
			//Code that updates game over screen information. 
			// Like make sure it displays current score and alive time based on how you performed in gameState.

			background(0, 0, 0);
			tint(255, 255, 255, 100);
			game.draw();
			if(millis()-gameOverStartStartTime > 2000)
			{	
				textAlign(CENTER);
				rectMode(CENTER);
				text("Press Space to get to Start Menu", width/2, height/2);
			} else {
				
				rectMode(CENTER);
				textAlign(CENTER);
				text("Please Wait: "+ (2 - (millis()-gameOverStartStartTime)/1000) +"s" , width/2, height/2);
				
			}
			//Press space to create new Game
			if(isSpacePressed && millis()-gameOverStartStartTime > 2000)
			{
				startState = true;
				gameOverState = false;
				startMenuStartTime = millis();
				println("In StartState");
				background(0, 0, 0);
			}
		}


	}
	

	public void draw()
	{
		if(startState)
		{
			//Display Start Menu screen
		}
		if(gameState && game != null)
		{
			noCursor();
			game.draw();
			
		}
		if(gameOverState)
		{
			cursor(ARROW);
			//Display Game Over screen
		}
	}


}