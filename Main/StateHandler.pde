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
			background(0, 0, 0);

			//Code that updates Start Menu information
			// if we have boxes to press on, check if arrow is inside the box and has clicked the box
			// otherwise just do nothing until a key is pressed, as of current you need to press Space to go to the game

			//Make everything until next commet into a seperate class or function in a other file
			textAlign(CENTER);
			rectMode(CENTER);
			textSize(24);
			text("LOGO", width/2, height/2 - 75); 
			text("+", width/2, height/2 - 50); 
			text("Name", width/2, height/2 - 25); 
			if(millis()-startMenuStartTime > 2000)
			{	
				textSize(14);
				text("Press \"Space\" to start", width/2, height/2);
			} else {

				
				textSize(14);
				text("Please Wait: "+ (2 - (millis()-startMenuStartTime)/1000) +"s" , width/2, height/2);
				
			}	

			if(isSpacePressed && millis()-startMenuStartTime > 2000)
			{
				gameState = true;
				startState = false;
				gameStartTime = millis();
				println("In GameState");
			}
			//End comment

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
			background(0, 0, 0);
			//Code that updates game over screen information. 
			// Like make sure it displays current score and alive time based on how you performed in gameState.
			game.draw();

			//Make everything until next commet into a seperate class or function in a other file
			textAlign(CENTER);
			rectMode(CENTER);
			textSize(24);
			text("Game Over maaan!!", width/2, height/2 - 50);
			text("Game Over!!!", width/2, height/2 - 25);
			textSize(14);
			text("Time: "+(game.playerSurvivalTime / 1000) +"."+ game.playerSurvivalTime % 1000 + "s", width/2 + 50, height/2 + 40);
			text("Kills: "+ game.playerEnemyKills, width/2-50, height/2 + 40);
			
			if(millis()-gameOverStartStartTime > 2000)
			{	
				textSize(14);
				text("Press \"Space\" to get to Start Menu", width/2, height/2);
			} else {
				textSize(14);
				text("Please Wait: "+ (2 - (millis()-gameOverStartStartTime)/1000) +"s" , width/2, height/2);
			}

			//End comment


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