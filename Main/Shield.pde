public class Shield
{

	int shieldValue, shieldValueMax, previousShieldValue;
	float redValue, greenValue;
	int shieldBarStartPos, shieldBarFinalPos, shieldBarLoss;

	public Shield()
	{
		frameRate(1);
	    size(800,600);
	    shieldValue=100;
	    shieldValueMax=100;
	    previousShieldValue=100;
	    shieldBarStartPos = 30;
	    shieldBarFinalPos = 230;
	    noStroke();
	    fill(25);
	}

	void draw()
	{
		displayShieldValue();
	}


	void displayShieldValue()
	{
		rect(shieldBarStartPos, height-40, 200, 20);
		noStroke();
		drawShieldBar();
		drawShieldBarloss();
		textSize(16);
		textAlign(LEFT);
		fill(255);
		String shieldValueString = str(shieldValue);
		text(shieldValueString+"%", 240, height-40, 40, 30);
	}

	void drawShieldBar()
	{
		for (int i = 0; i < shieldValue*2; ++i)
	    {
	    	redValue=255-(i*2);//mindre snygg matte än (i*1.275), men snyggare resultat
	    	greenValue=0+(i*2);
	    	fill(redValue, greenValue, 0);
	    	rect(shieldBarStartPos+i, height-40, 1, 20);
	    }
	    previousShieldValue=shieldValue;
	}

	void drawShieldBarloss()
	{
		fill(25);
		shieldBarLoss=230-(200-shieldValue*2);
		rect(shieldBarLoss, height-40, 230-shieldBarLoss, 20);
		previousShieldValue=shieldValue;
	}
}