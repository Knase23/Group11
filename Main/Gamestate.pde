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
	int numberOfEnemies = 0;
	int numberOfEnemyBullets = 0;
	int numberOfPlayerBullets = 0;
	int biggestNumberOf;
	Shield shield;
	
	public GameState () {
		
		backgroundManager = new BackgroundManager(numberOfStars, numberOfNebula);
		playerShip = new Player();
		// Change this or make a function that makes us able to change during start menu or a settings menu.
		enemies = new Enemy[15];
		biggestNumberOf = enemies.length;
			
		for (int i = 0; i < enemies.length; ++i) {
			enemies[i] = new Enemy();
			enemies[i].despawn = true;
		}		
		enemyBullets = new Bullet[enemies.length * 3];

		if(biggestNumberOf < enemyBullets.length)
			biggestNumberOf = enemyBullets.length;
		for (int i = 0; i < enemyBullets.length; ++i) {
			enemyBullets[i] = new Bullet();
			enemyBullets[i].despawn = true;
		}
		playerBullets = new Bullet[10];
		if(biggestNumberOf < playerBullets.length)
			biggestNumberOf = playerBullets.length;
		
		for (int i = 0; i < playerBullets.length; ++i) {
			playerBullets[i] = new Bullet();
			playerBullets[i].despawn = true;
		}
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

		for (int i = 0; i < biggestNumberOf; ++i) {
			if(i < enemies.length && enemies[i] != null)
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

			if(i < playerBullets.length && playerBullets[i] != null)
			{
				playerBullets[i].update();
			}

			if( i < enemyBullets.length && enemyBullets[i] != null)
		 	{
				enemyBullets[i].update();
				if(checkCollision(enemyBullets[i],playerShip))
				{
					
					enemyBullets[i].despawn = true;
					if (shield.shieldValue<10)
					{
						playerShip.despawn = true;
						shield.shieldValue=0;
					}
					else
					{
						shield.takeDamage();
					}
				}
		 	}
			//CheckColliison
			for (int j = 0; j < biggestNumberOf; ++j) {

					if ((j < enemies.length && i < playerBullets.length ) && checkCollision(playerBullets[i],enemies[j]))
					{
						enemies[j].despawn = true;
						playerBullets[i].despawn = true;
						score.killTheEnemy();
					}
				
				}
		}		
		playerShip.updateShield(shield);
			
	}
	public void draw() 
	{
		background(0);
		crosshair.draw();
		backgroundManager.draw();
		playerShip.draw();
		for (int i = 0; i < biggestNumberOf; ++i) {
			if(i < enemies.length && enemies[i] != null){

				enemies[i].draw();
			}		
			if(i < playerBullets.length && playerBullets[i] != null)
			{
				playerBullets[i].draw();
			}
			if(i < enemyBullets.length && enemyBullets[i] != null){
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

	public void spawnEnemy(int type) {

		for (int i = 0; i < enemies.length; ++i) {
			if (type == 0 &&(enemies[i] != null && enemies[i].despawn)) {
				enemies[i].newEnemy();
				break;
			}

			if( type == 1 && (enemies[i] == null || enemies[i].despawn || (i == enemies.length-1 && !(enemies[i] instanceof Nemesis))) )
			{
				enemies[i] = new Nemesis();
				break;
			}
		}
	}
	public void shotFired (GameObject go) 
	{
		for(int i = 0; i < biggestNumberOf; ++i)
		{
			if (go instanceof Player && i < playerBullets.length) 
			{
				if(playerBullets[i] != null && playerBullets[i].despawn){
				 	playerBullets[i].useExistingToCreateANew(go.position, new PVector(mouseX - go.position.x, mouseY - go.position.y), true);
					break;
				}
							
			}else if(go instanceof Enemy && i < enemyBullets.length)
			{

				if(enemyBullets[i] != null && enemyBullets[i].despawn)
				{
				 	enemyBullets[i].useExistingToCreateANew(go.position, go.direction, false);
				 	break;
				}				
			}
			else {
				break;
			}

		}
	}		
}

