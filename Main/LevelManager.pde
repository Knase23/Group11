public  class LevelManager {
	int secondsPast;
	int startTime = 0;
	boolean spawn5sec = false;
	boolean spawn9sec = false;
	/* 
	 Level Manager is used to determine when enemys will spawn
	 As of right now it spawns a enemy every 5th second and every 9th.
	
	*/
	public LevelManager()
	{

	}
	public LevelManager(int startT)
	{
		startTime = startT;
	}
	void update (GameState state) 
	{
		secondsPast = (millis()-startTime)/1000;
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
