class BackgroundManager
{
    Star[] stars;
    Nebula[] nebulas;

    BackgroundManager(int numberOfStars, int numberOfNebula)
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

    void update()
    {
        for(int i = 0; i < stars.length; i++)
        {
            stars[i].update();
        }
        for(int j = 0; j < nebulas.length; j++)
        {
            nebulas[j].update();
        }
    }



    void draw()
    {
        for(int i = 0; i < stars.length; i++)
        {
            stars[i].draw();
        }
        for(int j = 0; j < nebulas.length; j++)
        {
            nebulas[j].draw();
        }
        noTint();
        noStroke();
    }
}

class Star
{
    PVector position;
    PVector velocity;

    Star(float x, float y)
    {
        position = new PVector(x, y);
        velocity = new PVector(0,random(0.5, 3));

    }

        void update()
    {
        if (position.y>=height+20)
        {
            position.y=-(random(100, 20));
            position.x= random(0, width);
            velocity.y= random(0.5, 3);

        }
        
        position.add(velocity);
    }

    void draw()
    {
    	stroke(255,255,255,100);
    	strokeWeight(velocity.y+3);
        point(position.x, position.y);

        stroke(255,255,255,255);
        strokeWeight(velocity.y);
        point(position.x, position.y);
    }
}

class Nebula
{
    PVector position;
    PVector velocity;
    PImage nebulaSprite;
    float rotation;
    float nebulaRed, nebulaGreen, nebulaBlue, nebulaAlpha;
    float nebulaAngleOne, nebulaAngleTwo;

    Nebula(float x, float y)
    {
        position = new PVector(x, y);
        velocity = new PVector(0,random(0.2, 0.5));
        rotation = random(0, 359);
        nebulaAngleOne = random(0, 179);
        nebulaAngleTwo = random(180, 359);
    	nebulaRed = random(0, 255);
    	nebulaGreen = random(0, 255);
    	nebulaBlue = random(0, 255);
    	nebulaAlpha = random(25, 255);

    }

        void update()
    {
        if (position.y>=height+100)
        {
            position.y=-(random(400, 200));
            position.x= random(0, width);
            velocity.y= random(0.2, 0.5);
            rotation = random(0, 359);
	        nebulaAngleOne = random(0, 179);
	        nebulaAngleTwo = random(180, 359);
	    	nebulaRed = random(0, 255);
	    	nebulaGreen = random(0, 255);
	    	nebulaBlue = random(0, 255);
	    	nebulaAlpha = random(55, 255);
        }
        
        position.add(velocity);
    }

    void draw()
    {
    	pushMatrix();
    	imageMode(CENTER);
    	translate(position.x, position.y);
    	nebulaSprite = loadImage("/images/nebulaTwo.png");
		rotate(radians(rotation));
		rotate(radians(nebulaAngleTwo));
		tint(nebulaRed, nebulaGreen, nebulaBlue, nebulaAlpha/2);
		image(nebulaSprite, 0, 0);
		nebulaSprite = loadImage("/images/nebulaOne.png");
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