public  class levelManager {


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

	void update () {
		if ((millis()/1000)%5 == 5 )||(millis()/1000)%9 == 9 ){
			spawnEnemy(); 
		}
			
		}
	}