public abstract class GameObject 
{
	PImage sprite;
	PVector position, directionVelocity;
	float hitBox, speed;
	boolean despawn, outOfBounds;
	public GameObject () 
	{
		this.position = new PVector(height/2,width/2);
		this.hitBox = 10;
		this.despawn = false;
		this.outOfBounds = false;
		this.directionVelocity = new PVector();
	}
	public GameObject(float x, float y, float diameter) 
	{
		this.position = new PVector(x,y);
		this.hitBox = diameter;
		this.despawn = false;
		this.outOfBounds = false;
		this.directionVelocity = new PVector();
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
