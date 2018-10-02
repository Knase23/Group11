public  class LevelManager {
	int secondsPast;
	boolean spawn5sec = false;
	boolean spawn9sec = false;
	public LevelManager()
	{

	}
	void update (GameState state) 
	{
		secondsPast = millis()/1000;
		if (secondsPast % 5 == 4 && !spawn5sec){
			println("Spawn Enemy");
			spawn5sec = true;
			state.spawnEnemy(); 
		} else if (secondsPast % 5 == 0) {
			spawn5sec = false;
			
		}

		if (secondsPast % 9 == 8 && !spawn9sec){
			println("Spawn Enemy");
			spawn9sec = true;
			state.spawnEnemy(); 
		} else if (secondsPast % 9 == 0) {
			spawn9sec = false;
			
		}
			
	}
}
