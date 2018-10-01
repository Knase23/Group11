public abstract class GameObject 
{
	PImage sprite;
	PVector position, directionVelocity;
	float hitBox;
	boolean dead, outOfBounds;
	public GameObject () 
	{
		this.position = new PVector(height/2,width/2);
		this.hitBox = 10;
		this.dead = false;
		this.outOfBounds = false;
	}
	public GameObject(float x, float y, float diameter) 
	{
		this.position = new PVector(x,y);
		this.hitBox = raidus;
		this.dead = false;
		this.outOfBounds = false;
	}
	public void update() 
	{
		
	}
	public void draw()
	{

	}
	public void move()
	{

	}

}
