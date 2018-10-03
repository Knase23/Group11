public class ScoreSystem {
	
	int currentScore = 0;
	int killScore = 0 ;
	int scoreTime = 0 ;
	int survivalTime = 0;
	public ScoreSystem () {
		
	}

	public void score () {
		currentScore = scoreTime + killScore; 
		textSize(32);
		textAlign(LEFT);
		rectMode(CORNER);
		fill(255, 255, 255);
		text("SCORE: "+currentScore, 10, 40);
	}
	public void killTheEnemy () {
		killScore += 10;
	}
	public void survivalTimeToScore(int survivalTime){
		scoreTime = survivalTime / (10 *1000);  // 1 point per 10 sec.  survivalTime/x    x = point per sec * 1000
	}
	 	
}