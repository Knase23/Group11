public class GameState{
	BackgroundManager backgroundManager;
	Crosshair crosshair = new Crosshair();
	ScoreSystem score = new ScoreSystem();
	 	
	int gameStartTime;

	int numberOfStars = 50;
	int numberOfNebula = 10;

	Player playerShip;
	int playerEnemyKills = 0;
	int playerSurvivalTime = 0;

	Enemy[] enemies;
	Bullet[] enemyBullets, playerBullets;
	int maxNumberOfEnemies , numberOfEnemies = 0;
	int maxNumberOfEnemyBullets, numberOfEnemyBullets = 0;
	int maxNumberOfPlayerBullets, numberOfPlayerBullets = 0;

	Shield shield;
	

	public GameState () {
		
		backgroundManager = new BackgroundManager(numberOfStars, numberOfNebula);

		playerShip = new Player();
		

		// Change this or make a function that makes us able to change during start menu or a settings menu.
		maxNumberOfEnemies = 15;

		enemies = new Enemy[maxNumberOfEnemies];	

		maxNumberOfEnemyBullets = 100;
		enemyBullets = new Bullet[maxNumberOfEnemyBullets];
		maxNumberOfPlayerBullets = 30;
		playerBullets = new Bullet[maxNumberOfPlayerBullets];
		shield = new Shield();
	}
	public void update() {
		backgroundManager.update();
		crosshair.update();
		playerShip.update();
		playerSurvivalTime = time - gameStartTime;
		score.survivalTimeToScore(playerSurvivalTime);
		if(playerShip.canShot() && playerShip.wantToShot)
		{
			shotFired(playerShip);
		}


		for (int i = 0; i < maxNumberOfEnemies; ++i) {
			if(enemies[i] != null)
			{
				enemies[i].update();
				if(((Enemy)enemies[i]).canShot())
				{
					shotFired(enemies[i]);
				}
				if(enemies[i] instanceof Nemesis)
				{
					((Nemesis)enemies[i]).nemesisPlayerLocationUpdate(playerShip);
				}
			}
		}		
		for (int i = 0; i < maxNumberOfPlayerBullets; ++i) {
			if(playerBullets[i] != null)
			{
				playerBullets[i].update();

				for (int j = 0; j < maxNumberOfEnemies; ++j) {

					if (enemies[j] != null && checkCollision(playerBullets[i],enemies[j]))
					{
						enemies[j].despawn = true;
						playerBullets[i].despawn = true;
						score.killTheEnemy();
					}
				
				}
			}
		}
		
		for (int i = 0; i < maxNumberOfEnemyBullets; ++i)
		 {
		 	if(enemyBullets[i] != null)
		 	{
				enemyBullets[i].update();
				if(checkCollision(enemyBullets[i],playerShip))
				{
					
					enemyBullets[i].despawn = true;
					if (shield.shieldValue<10)
					{
						playerShip.despawn = true;
					}
					else
					{
						shield.takeDamage();
					}
				}
		 	}
		}
			
	}
	public void draw() 
	{
		background(0);
		crosshair.draw();
		backgroundManager.draw();
		playerShip.draw();
		

		for (int i = 0; i < maxNumberOfEnemies; ++i) {
			if(enemies[i] != null){

				enemies[i].draw();
			}
		}
		
		for (int i = 0; i < maxNumberOfPlayerBullets; ++i) {
			if(playerBullets[i] != null)
			{
				playerBullets[i].draw();
			}
		}
		
		for (int i = 0; i < maxNumberOfEnemyBullets; ++i) {
			if(enemyBullets[i] != null){
				enemyBullets[i].draw();
			}	
		}	
		score.score();
		shield.draw();
	}
	public boolean gameOver()
	{
		if(playerShip.despawn)
			return true;

		return false;
	}

	public void spawnEnemy() {

		for (int i = 0; i < maxNumberOfEnemies; ++i) {
			if( enemies[i] == null || enemies[i].despawn)
			{
				enemies[i] = new Enemy();
				break;
			}
		}
	}
	public void spawnNemesis() {

		for (int i = 0; i < maxNumberOfEnemies; ++i) {
			if( enemies[i] == null || enemies[i].despawn || i == maxNumberOfEnemies-1)
			{
				enemies[i] = new Nemesis();
				break;
			}
		}

	}
	public void shotFired (GameObject go) 
	{
		if (go instanceof Player) 
		{
			for (int i = 0; i < maxNumberOfPlayerBullets; ++i) {
				if(playerBullets[i] == null || playerBullets[i].despawn)
				{
				 	playerBullets[i] = new Bullet(go.position, new PVector(mouseX - go.position.x, mouseY - go.position.y), true);
				 	break;
				}
			}
			
			
		}
	

		if(go instanceof Enemy)
		{
			for (int i = 0; i < maxNumberOfEnemyBullets; ++i) {
				if( enemyBullets[i] == null || enemyBullets[i].despawn)
				{
				 	enemyBullets[i] = new Bullet(go.position, go.directionVelocity, false);
				 	break;
				}
			}
				
			
		}
	}
	
		
}
