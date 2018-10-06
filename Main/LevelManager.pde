public  class LevelManager {
	int secondsPast = 0;
	int pastSecond = 0;
	int startTime = 0;
	int noMoveTimer = 0;
	int difficultyChanger = 1;
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
		secondsPast = (time-startTime)/1000;
		if(secondsPast != pastSecond)
		{
			secondsPastChanged = true;
			pastSecond = secondsPast;
		} else {
			secondsPastChanged = false;
		}
		for (int i = 0; i < difficultyChanger; ++i) {
			spawnAfter(5,state,1);
			spawnAfter(9,state,1);			
		}

		spawnAfter(10,state,2);

		if (secondsPast%10 == 9  && secondsPastChanged) 
		{
			difficultyChanger++;	
		}
		
		if (abs(state.playerShip.directionVelocity.x) < 0.5  && abs(state.playerShip.directionVelocity.y) <  0.5)
		{
			//println("startTime-noMoveTimer: "+ ((time -startTime)-noMoveTimer));
			if( (time-startTime)-noMoveTimer > 5000)
			{
				state.spawnNemesis();
				noMoveTimer = (time-startTime) ;
				state.shield.repairShield(5);
			}

		}		
		else  
		{
			noMoveTimer = (time-startTime);
		}
		
			
	}

	void spawnAfter(int seconds, GameState state, int type)
	{
		if (secondsPast % seconds == seconds-1 && secondsPastChanged ){
			
			if(type == 1)
				state.spawnEnemy();
			if(type == 2)
				state.spawnNemesis(); 
		}
	}
}
