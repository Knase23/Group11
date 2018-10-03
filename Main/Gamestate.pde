public class GameState{
	BackgroundManager backgroundManager;
	Crosshair crosshair = new Crosshair();
	 	
	int gameStartTime;

	int numberOfStars = 50;
	int numberOfNebula = 4;

	Player playerShip;
	int playerEnemyKills = 0;
	int playerSurvivalTime = 0;

	Enemy[] enemies;
	Bullet[] enemyBullets, playerBullets;
	int maxNumberOfEnemies , numberOfEnemies = 0;
	int maxNumberOfEnemyBullets, numberOfEnemyBullets = 0;
	int maxNumberOfPlayerBullets, numberOfPlayerBullets = 0; 
	

	public GameState () {
		
		backgroundManager = new BackgroundManager(numberOfStars, numberOfNebula);

		playerShip = new Player();
		maxNumberOfEnemies = 10;
		enemies = new Enemy[maxNumberOfEnemies];			
		maxNumberOfEnemyBullets = 30;
		enemyBullets = new Bullet[maxNumberOfEnemyBullets];
		maxNumberOfPlayerBullets = 30;
		playerBullets = new Bullet[maxNumberOfPlayerBullets];
	}
	public void update() {
		backgroundManager.update();
		crosshair.update();
		playerShip.update();
		playerSurvivalTime = millis() - gameStartTime;
		if(playerShip.canShot() && playerShip.wantToShot)
		{
			shotFired(playerShip);
		}


		for (int i = 0; i < numberOfEnemies; ++i) {
			enemies[i].update();
			if(((Enemy)enemies[i]).canShot() && !enemies[i].despawn)
			{
				shotFired(enemies[i]);
			}
		}		
		for (int i = 0; i < numberOfPlayerBullets; ++i) {
			playerBullets[i].update();

			for (int j = 0; j < numberOfEnemies && !playerBullets[i].despawn; ++j) {
				if (checkCollision(playerBullets[i],enemies[j]) && !enemies[j].despawn)
				{
					enemies[j].despawn = true;
					playerBullets[i].despawn = true;
					playerEnemyKills++;
				}
				
			}
		}
		
		for (int i = 0; i < numberOfEnemyBullets; ++i) {
			enemyBullets[i].update();
			if(checkCollision(enemyBullets[i],playerShip))
			{
				playerShip.despawn = true;
				enemyBullets[i].despawn = true;
			}
		}
			
	}
	public void draw() 
	{
		background(0);
		crosshair.draw();
		backgroundManager.draw();
		playerShip.draw();
		
			

		for (int i = 0; i < numberOfEnemies; ++i) {
			enemies[i].draw();
		}
		
		for (int i = 0; i < numberOfPlayerBullets; ++i) {
			playerBullets[i].draw();
		}
		
		for (int i = 0; i < numberOfEnemyBullets; ++i) {
			enemyBullets[i].draw();
		}	
			
	}
	public boolean gameOver()
	{
		if(playerShip.despawn)
			return true;

		return false;
	}

	public void spawnEnemy() {

		if(numberOfEnemies < maxNumberOfEnemies)
		{
			enemies[numberOfEnemies] = new Enemy();
			numberOfEnemies++;
		} else 
		{
			for (int i = 0; i < numberOfEnemies; ++i) {
				if(enemies[i].despawn)
				{
					enemies[i] = new Enemy();
					break;
				}
				
			}
			
		}
	}
	public void shotFired (GameObject go) 
	{
		if (go instanceof Player) 
		{
			if(numberOfPlayerBullets < maxNumberOfPlayerBullets)
			{
				playerBullets[numberOfPlayerBullets] = new Bullet(go.position, new PVector(mouseX - go.position.x, mouseY - go.position.y),true ); // new PVector needs to change, only temporary
				numberOfPlayerBullets++;
			} else 
			{
				for (int i = 0; i < numberOfPlayerBullets; ++i) {
					if(playerBullets[i].despawn)
					{
					 	playerBullets[i] = new Bullet(go.position, new PVector(mouseX - go.position.x, mouseY - go.position.y), true);
					 	break;
					}
				}
			
			}
		}
	

		if(go instanceof Enemy)
		{
			if(numberOfEnemyBullets < maxNumberOfEnemyBullets)
				{
					enemyBullets[numberOfEnemyBullets] = new Bullet(go.position, go.directionVelocity ,false ); // new PVector needs to change, only temporary
					numberOfEnemyBullets++;
				} else 
				{
					for (int i = 0; i < numberOfEnemyBullets; ++i) {
						if(enemyBullets[i].despawn)
						{
						 	enemyBullets[i] = new Bullet(go.position, go.directionVelocity, false);
						 	break;
						}
					}
				
				}
		}
	}
	
		
}
