public class StateHandler{

	int gameStartTime;
	
	boolean startState = true, gameState = false, gameOverState = false;
	StartState startMenu;
	GameState game;
	GameOverState gameOverMenu;

	LevelManager levelConfig;

	public StateHandler () {
		levelConfig = new LevelManager();
		gameOverMenu = new GameOverState();
		startMenu = new StartState();
	}
	public void update()
	{

		if(startState)
		{
			background(0, 0, 0);

			//Code that updates Start Menu information
			// if we have boxes to press on, check if arrow is inside the box and has clicked the box
			// otherwise just do nothing until a key is pressed, as of current you need to press Space to go to the game
			startMenu.update();
			//Make everything until next commet into a seperate class or function in a other file
				

			//End comment
			if(isSpacePressed && millis()-startMenu.startMenuStartTime > 2000)
			{
				gameState = true;
				startState = false;
				
				game = new GameState();
				game.gameStartTime = millis();
				levelConfig = new LevelManager(game.gameStartTime);

				
				println("In GameState");
			}

		} else if(gameState)
		{
			
			levelConfig.update(game);
			game.update();
			if(game.gameOver())
			{
				gameState = false;
				gameOverState = true;
				gameOverMenu.gameOverStartStartTime =  millis();
				println("In GameOverState");
				background(0, 0, 0);
			}
		
		} else if (gameOverState) {
			//Code that updates game over screen information. 
			// Like make sure it displays current score and alive time based on how you performed in gameState.
			
			gameOverMenu.update(game);
			
			//Press space to create new Game
			if(isSpacePressed && millis()-gameOverMenu.gameOverStartStartTime > 2000)
			{
				startState = true;
				gameOverState = false;
				startMenu.startMenuStartTime = millis();
				println("In StartState");
				background(0, 0, 0);
			}
		}


	}
	

	public void draw()
	{
		if(startState)
		{
			background(0, 0, 0);
			//Display Start Menu screen
			startMenu.draw();
		}
		if(gameState && game != null)
		{
			noCursor();
			game.draw();
			
		}
		if(gameOverState)
		{
			background(0, 0, 0);
			game.draw();
			cursor(ARROW);
			gameOverMenu.draw();
			//Display Game Over screen
		}
	}


}