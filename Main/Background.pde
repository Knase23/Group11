class BackgroundManager
{
    Star[] stars;
    Nebula[] nebulas;

    public BackgroundManager(int numberOfStars, int numberOfNebula)
    {
        stars = new Star[numberOfStars];

        for(int i = 0; i < stars.length; i++)
        {
            stars[i] = new Star(random(width), random(-100,height+10));
        }

        nebulas = new Nebula[numberOfNebula];

        for(int j = 0; j < nebulas.length; j++)
        {
            nebulas[j] = new Nebula(random(width), random(-100,height+50));
        }

    }

     public void update()
    {
        int biggestNumber = nebulas.length;
        if(stars.length > nebulas.length)
        {
            biggestNumber = stars.length;
        }
        for (int i = 0; i < biggestNumber; ++i) {
            if(i < stars.length)
                stars[i].update();
       
            if(i < nebulas.length)
                nebulas[i].update();
        }  
    }



    public void draw()
    {
        int biggestNumber = nebulas.length;
        if(stars.length > nebulas.length)
        {
            biggestNumber = stars.length;
        }
        for (int i = 0; i < biggestNumber; ++i) {
            if(i < stars.length)
                stars[i].draw();
       
            if(i < nebulas.length)
                nebulas[i].draw();
        }  
        noTint();
        noStroke();
    }
}

class Star
{
    PVector position;
    float velocity;

    public Star(float x, float y)
    {
        position = new PVector(x, y);
        velocity = random(30,70);

    }

    public void update()
    {
        if (position.y >= height+20)
        {
            position.y += -height;
            //position.x = random(0, width);
            // velocity.y = random(0.5, 3);

        }
        
        position.y += velocity * deltaTime;
    }

    public void draw()
    {
    	stroke(255,255,255,100);
    	strokeWeight(velocity * 0.04f + 3);
        point(position.x, position.y);

        stroke(255,255,255,255);
        strokeWeight(velocity* 0.04f);
        point(position.x, position.y);
    }
}

class Nebula
{
    PVector position;
    float velocity;
    PImage nebulaSprite, nebulaSprite2;
    float rotation;
    float nebulaRed, nebulaGreen, nebulaBlue, nebulaAlpha;
    float nebulaAngleOne, nebulaAngleTwo;

    public Nebula(float x, float y)
    {
		nebulaSprite = assets[3];

    	nebulaSprite2 = assets[4];

        position = new PVector(x, y);
        velocity = random(5, 20);

        rotation = random(0, 359);
        nebulaAngleOne = random(0, 179);
        nebulaAngleTwo = random(180, 359);
    	nebulaRed = random(0, 255);
    	nebulaGreen = random(0, 255);
    	nebulaBlue = random(0, 255);
    	nebulaAlpha = random(25, 255);

    }

    public void update()
    {
        if (position.y >= height+100)
        {
            position.y -= height + 200;
            position.x = random(10, width-10);
            velocity = random(5, 20);
            rotation = random(0, 359);
	        nebulaAngleOne = random(0, 179);
	        nebulaAngleTwo = random(180, 359);
	    	nebulaRed = random(0, 255);
	    	nebulaGreen = random(0, 255);
	    	nebulaBlue = random(0, 255);
	    	nebulaAlpha = random(55, 255);
        }
        
        position.y += velocity * deltaTime;
    }

    public void draw()
    {
    	pushMatrix();
    	imageMode(CENTER);
    	translate(position.x, position.y);
		rotate(radians(rotation));
		
		rotate(radians(nebulaAngleTwo));
		tint(nebulaRed, nebulaGreen, nebulaBlue, nebulaAlpha/2);
		image(nebulaSprite2, 0, 0);
		

		rotate(radians(nebulaAngleTwo));
		tint(nebulaRed, nebulaGreen, nebulaBlue, nebulaAlpha);
		image(nebulaSprite, 0, 0);
		popMatrix();
		rotation+=0.03;

    	// stroke(255,255,255,100);
    	// strokeWeight(velocity.y+300);
     //    point(position.x, position.y);

     //    stroke(255,255,255,255);
     //    strokeWeight(velocity.y+200);
     //    point(position.x, position.y);
    }
}
