public class Gamestate{
	Player playerShip;
	Enemy[] enemies;
	Bullet[] enemyBullets, playerBullets;

	public Gamestate () {
		playerShip = new Player();
	}
	public void update() {
		
		playerShip.draw();

		// for (Enemy enemy : enemies) {
		// 	enemy.draw();
			
		// }
		// for (Bullet bullet : enemyBullets) {
		// 	enemy.draw();
		// }
		// for (Bullet bullet : playerBullets) {
		// 	enemy.draw();
		// }	
	}
	public void draw() {
		
		playerShip.draw();

		// for (Enemy enemy : enemies) {
		// 	enemy.draw();
			
		// }
		// for (Bullet bullet : enemyBullets) {
		// 	enemy.draw();
		// }
		// for (Bullet bullet : playerBullets) {
		// 	enemy.draw();
		// }		
	}

}
