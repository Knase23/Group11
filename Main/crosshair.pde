float crosshairSize=0;

void crosshair()
{
	int xPos = mouseX;
	int yPos = mouseY;
	crosshairGrowing();

	stroke(255);
	strokeWeight(4);
	line(xPos, yPos-(10+crosshairSize), xPos, yPos-(20+crosshairSize));
	line(xPos, yPos+(10+crosshairSize), xPos, yPos+(20+crosshairSize));
	line(xPos-(10+crosshairSize), yPos, xPos-(20+crosshairSize), yPos);
	line(xPos+(10+crosshairSize), yPos, xPos+(20+crosshairSize), yPos);

	stroke(255,0,0);
	strokeWeight(2);
	line(xPos, yPos-(10+crosshairSize), xPos, yPos-(20+crosshairSize));
	line(xPos, yPos+(10+crosshairSize), xPos, yPos+(20+crosshairSize));
	line(xPos-(10+crosshairSize), yPos, xPos-(20+crosshairSize), yPos);
	line(xPos+(10+crosshairSize), yPos, xPos+(20+crosshairSize), yPos);
}

void crosshairGrowing()
{
	if (mousePressed && (mouseButton == LEFT))
	{
		if (crosshairSize < 10)
		{
			crosshairSize+=0.2;
		}
		else
		{
			crosshairSize-=0.5;
		}
	}
	else
	{
		if (crosshairSize>0)
		{
			crosshairSize-=0.5;
		}
		else if (crosshairSize<0)
		{
			crosshairSize=0;
		}
	}
}
