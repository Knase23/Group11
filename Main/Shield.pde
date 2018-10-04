public class Shield
{

	int shieldValue;
	int shieldValueMax;
	float redValue, greenValue;
	int shieldBarStartPos, shieldBarFinalPos, shieldBarLoss;

	public Shield()
	{
	    shieldValue=100;
	    shieldValueMax=100;
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
		noStroke();
		rect(shieldBarStartPos, height-40, 200, 20);
		drawShieldBar();
		drawShieldBarloss();
		textSize(16);
		textAlign(LEFT);
		fill(255);
		String shieldValueString = str(shieldValue);
		text(shieldValueString+"%", 240, height-40, 40, 30);
		if (shieldValue<20)
		{
			shielLowWarning();
		}
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
	}

	void drawShieldBarloss()
	{
		fill(25);
		shieldBarLoss=230-(200-shieldValue*2);
		rect(shieldBarLoss, height-40, 230-shieldBarLoss, 20);
	}

	void takeDamage()
	{
		shieldValue-=10;
	}

	void shielLowWarning()
	{
		if (shieldValue<20)
		{
			noFill();
			strokeWeight(2);
			if (time/1000 % 2 <1)
			{
				stroke(255,0,0);
			}
			else
			{
				stroke(255,255,0);
			}
			rect(shieldBarStartPos, height-40, 200, 20);
		}
		else
		{
			stroke(25);
			rect(shieldBarStartPos, height-40, 200, 20);
		}
	}
}

