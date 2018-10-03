public  class LevelManager {
	int secondsPast = 0;
	int pastSecond = 0;
	int startTime = 0;
	boolean secondsPastChanged = false;
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
		if(secondsPast != pastSecond)
		{
			secondsPastChanged = true;
			pastSecond = secondsPast;
		} else {
			secondsPastChanged = false;
		}
		spawnAfter(5,state);
		spawnAfter(9,state);
			
	}

	void spawnAfter(int seconds, GameState state)
	{
		if (secondsPast % seconds == seconds-1 && secondsPastChanged ){
			println("Spawn Enemy");
			
			state.spawnEnemy(); 
		}
	}
}
