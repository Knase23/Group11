public class HighScoreSystem {
	
	String[] highScoresNames;
	int [] highScoresScore;
	int numberOfSavedScores;
	int maxNumberOfSavedScores = 5; 
	public HighScoreSystem () {
		highScoresNames = new String[maxNumberOfSavedScores];
		highScoresScore = new int[maxNumberOfSavedScores];
		for (int i = 0; i < maxNumberOfSavedScores; ++i) {
			highScoresScore[i] = -1;
		}
		loadInHighScores();
	}
	
	public void loadInHighScores()
	{
		BufferedReader input = createReader("HighScores.txt");
		if(input != null){
			String line = null;
			try {
				while((line = input.readLine()) != null && numberOfSavedScores < maxNumberOfSavedScores)
				{
					String[] pieces = split(line, " : ");
					if(pieces.length == 2)
					{
						highScoresNames[numberOfSavedScores] = pieces[0];
						highScoresScore[numberOfSavedScores] = int(pieces[1]);
						numberOfSavedScores++;
					}
				}
						// highScoresNames[]
				
			} catch (IOException e) {
			    e.printStackTrace();
			   }
		}
		sortHighScores();

	}
	public void update(int currentScore, String name)
	{
		
		if(highScoresScore[4] < currentScore)
		{
			highScoresNames[4] = name;
			highScoresScore[4] = currentScore;
		}
		sortHighScores();

	}
	public void draw()
	{	textAlign(CENTER);
		textSize(24);
		text("Leaderboard", width/2, height/2 + 30);
		textSize(14);
		for (int i = 0; i < numberOfSavedScores; ++i) {
			text(highScoresNames[i] + " : " + highScoresScore[i], width/2, height/2 + 50 + (15 *i+1));
			}	
	}
	public void saveHighScores()
	{
		sortHighScores();
		PrintWriter outPut = createWriter("HighScores.txt");
		for (int i = 0; i < numberOfSavedScores; ++i) {
			outPut.println(highScoresNames[i] + " : " + highScoresScore[i]);			
		}
		outPut.flush();
		outPut.close();
	}
	public void sortHighScores() {
		int highestScoreIndex;
		for (int i = 0; i < maxNumberOfSavedScores; ++i) {
			highestScoreIndex = i;
			for (int j = i; j < maxNumberOfSavedScores; ++j) {
				
				if(highScoresScore[highestScoreIndex] < highScoresScore[j])
				{
					highestScoreIndex = j;
				}
			}
			String name = highScoresNames[highestScoreIndex];
			int score = highScoresScore[highestScoreIndex];

			highScoresNames[highestScoreIndex] = highScoresNames[i];
			highScoresScore[highestScoreIndex] = highScoresScore[i];

			highScoresNames[i] = name;
			highScoresScore[i] = score;
		}
		
	}


}