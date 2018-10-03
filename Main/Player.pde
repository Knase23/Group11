public class Player extends GameObject{
	boolean wantToShot = false;
	float millisekundsPast = 0;
	float timeAfterShot = 0; 
	float cooldownGuns = 200;
	float mouseAngle = 0;
	public Player () {
		super(height/2,width/2,50);
		sprite = assets[0];
		speed = 10;
		
	}

	public void update() {
		
		mouseAngle = atan2(this.position.y - mouseY,this.position.x - mouseX);
		move();
		if(position.x > width)
			position.x -= width;
		if(position.x < 0)
			position.x += width;
		if(position.y > height)
			position.y -= height;
		if(position.y < 0)
			position.y += height;
	}
	
	public void draw() {
		

						
		
		pushMatrix();
		translate(this.position.x, this.position.y);
		rotate(mouseAngle - HALF_PI);
		
		imageMode(CENTER);
		image(sprite, 0, 0);
		
		strokeWeight(2);
		stroke(0, 255, 0);
		noFill();
		ellipse(0, 0, this.hitBox, this.hitBox);

		popMatrix();
	}

	public void move() {
		
		if(isWpressed)
			up();
		if(isSpressed)
			down();
		if(isApressed)
			left();
		if(isDpressed)
			right();
		
		wantToShot = isLeftmouseclicked;

		directionVelocity.mult(0.95f);
		position.add(directionVelocity);

	}
	public boolean canShot()
	{
		millisekundsPast = millis() - timeAfterShot;
		if(millisekundsPast > cooldownGuns || timeAfterShot < 1)
		{
			timeAfterShot = millis();
			return true;
		} else{
			return false;
		}
	}
	public void up(){
		directionVelocity.y += -speed * deltaTime;
	}
	public void down(){
		directionVelocity.y += speed * deltaTime;
	}
	public void left(){
		directionVelocity.x += -speed * deltaTime;
	}
	public void right(){
		directionVelocity.x += speed * deltaTime;
	}
	
}