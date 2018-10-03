public class ScoreSystem {
	
	int currentScore = 0;
	int killScore =0 ;
	int scoreTime =0 ;
	Int survivalTime =0;
	public ScoreSystem () {
		
	}

	public void score () {

	textsize(32);
	fill(255, 255, 255);
	text('SCORE'currentScore, 10, 20);
	
		currentscore = scoreTime + killScore ; 

}
public void killTheEnemy () {
	killScore += 10
}
public void survivalTimeToScore(){
 scoreTime = survivalTime / (10 *1000);  // 1 point per 10 sec.  survivalTime/x    x = point per sec * 1000
}
}