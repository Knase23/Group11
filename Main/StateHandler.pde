public class StateHandler{

	int gameStartTime;
	
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
			gameState = true;
			startState = false;

		} else if(gameState)
		{
			if(game == null || game.gameOver() )
			{
				gameStartTime = millis();
				game = new GameState();
				levelConfig = new LevelManager(gameStartTime);
			} else 
			{
				levelConfig.update(game);
				game.update();
				if(game.gameOver())
				{
					gameState = false;
					gameOverState = true;
				}
			}
		} else if (gameOverState) {
			
			if(isSpacePressed)
			{
				startState = true;
				gameOverState = false;
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