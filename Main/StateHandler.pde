public class StateHandler{

	int gameStartTime;
	
	boolean startState = true, gameState = false, gameOverState = false;
	StartState startMenu;
	GameState game;
	GameOverState gameOverMenu;

	LevelManager levelConfig;
	HighScoreSystem highScores;
	boolean updatedHighScoreOnce;

	public StateHandler () {
		levelConfig = new LevelManager();
		gameOverMenu = new GameOverState();
		startMenu = new StartState();
		highScores = new HighScoreSystem();
	}
	public void update()
	{

		if(startState)
		{
			background(0, 0, 0);

			//Code that updates Start Menu information
			// if we have boxes to press on, check if arrow is inside the box and has clicked the box
			// otherwise just do nothing until a key is pressed, as of current you need to press Space to go to the game
			sounds[1].play();
			startMenu.update();
			//Make everything until next commet into a seperate class or function in a other file
				

			//End comment
			if(isSpacePressed && time-startMenu.startMenuStartTime > 2000)
			{
				gameState = true;
				startState = false;
				
				game = new GameState();
				game.gameStartTime = time;
				levelConfig = new LevelManager(game.gameStartTime);
				sounds[1].pause();
				sounds[0].rewind();
				
				println("In GameState");
			}

		} else if(gameState)
		{
			sounds[0].play();
			
			levelConfig.update(game);
			game.update();
			if(game.gameOver())
			{
				gameState = false;
				gameOverState = true;
				gameOverMenu.gameOverStartStartTime =  time;
				println("In GameOverState");
				background(0, 0, 0);
				sounds[0].pause();
				sounds[2].rewind();
			}
		
		} else if (gameOverState) {
			//Code that updates game over screen information. 
			// Like make sure it displays current score and alive time based on how you performed in gameState.
			sounds[2].play();
			gameOverMenu.update(game);
			if(gameOverMenu.naming.done && !updatedHighScoreOnce)
			{
				highScores.update(game.score.currentScore, gameOverMenu.naming.name);
				updatedHighScoreOnce = true;
			}
			
			//Press space to create new Game
			if(isSpacePressed && millis()-gameOverMenu.gameOverStartStartTime > 2000 && gameOverMenu.naming.done)
			{
				startState = true;
				gameOverState = false;
				startMenu.startMenuStartTime = time;
				println("In StartState");
				background(0, 0, 0);
				highScores.saveHighScores();
				updatedHighScoreOnce = false;
				gameOverMenu.naming.done = false;
				sounds[2].pause();
				sounds[1].rewind();
			}
		}


	}
	

	public void draw()
	{
		if(startState)
		{
			background(0, 0, 0);
			//Display Start Menu screen
			highScores.draw();
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
			if(gameOverMenu.naming.done)
			{
				highScores.draw();
			}
			//Display Game Over screen
		}
	}


}