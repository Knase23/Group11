public class Gamestate{
	Player playerShip;
	Enemy[] enemies;
	Bullet[] enemyBullets, playerBullets;
	int maxNumberOfEnemies , numberOfEnemies = 0;
	int maxNumberOfEnemyBullets, numberOfEnemyBullets = 0;
	int maxNumberOfPlayerBullets, numberOfPlayerBullets = 0; 
	public Gamestate () {
		playerShip = new Player();
		maxNumberOfEnemies = 10;
		enemies = new Enemy[maxNumberOfEnemies];
		for (int i = 0; i < maxNumberOfEnemies; ++i) {
			spawnEnemy();
		}
		
		maxNumberOfEnemyBullets = 30;
		enemyBullets = new Bullet[maxNumberOfEnemyBullets];
		maxNumberOfPlayerBullets = 30;
		playerBullets = new Bullet[maxNumberOfPlayerBullets];
	}
	public void update() {
		
		playerShip.update();
		shotFired(playerShip);

		for (int i = 0; i < numberOfEnemies; ++i) {
			enemies[i].update();
			spawnEnemy();
			if(((Enemy)enemies[i]).canShot())
			{
				shotFired(enemies[i]);
			}
		}		
		for (int i = 0; i < numberOfPlayerBullets; ++i) {
			playerBullets[i].update();

			for (int j = 0; j < numberOfEnemies && !playerBullets[i].despawn; ++j) {
				if (checkCollision(playerBullets[i],enemies[j]))
				{
					enemies[j].despawn = true;
					playerBullets[i].despawn = true;
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
	public void draw() {
		
		noCursor();
		crosshair();
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

		if(gameOver())
		{
			println("Game Over man, Game Over");
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
		} else {
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
			if(((Player)go).wantToShot && !((Player)go).shotIsFired) 
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
				((Player)go).shotIsFired = true;	
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
