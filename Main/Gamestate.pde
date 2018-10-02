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
		
		maxNumberOfEnemyBullets = 30;
		enemyBullets = new Bullet[maxNumberOfEnemyBullets];
		maxNumberOfPlayerBullets = 30;
		playerBullets = new Bullet[maxNumberOfPlayerBullets];
	}
	public void update() {
		
		playerShip.update();

		for (int i = 0; i < numberOfEnemies; ++i) {
			enemies[i].update();
		}		
		for (int i = 0; i < numberOfPlayerBullets; ++i) {
			playerBullets[i].update();
		}
		
		for (int i = 0; i < numberOfEnemyBullets; ++i) {
			enemyBullets[i].update();
		}
		println("isWpressed: "+isWpressed);
		if(isWpressed)
			spawnEnemy();
			
	}
	public void draw() {
		
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
	public void spawnEnemy() {

		if(numberOfEnemies < maxNumberOfEnemies)
		{
			enemies[numberOfEnemies] = new Enemy();
			numberOfEnemies++;
		} else {
			for (int i = 0; i < numberOfEnemies; ++i) {
				if(enemies[i].dead)
				{
					enemies[i] = new Enemy();
				}
				
			}
			
		}
	}

}
