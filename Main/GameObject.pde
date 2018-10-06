public abstract class GameObject 
{
	PImage sprite;
	PVector position, direction;
	float hitBox, speed;
	boolean despawn, outOfBounds;
	public GameObject () 
	{
		this.position = new PVector(height/2,width/2);
		this.hitBox = 10;
		this.despawn = false;
		this.outOfBounds = false;
		this.direction = new PVector();
	}
	public GameObject(float x, float y, float diameter) 
	{
		this.position = new PVector(x,y);
		this.hitBox = diameter;
		this.despawn = false;
		this.outOfBounds = false;
		this.direction = new PVector();
	}
	public void update() 
	{
		
	}
	public void draw()
	{

	}
	public void move()
	{
		position.x += direction.x * speed * deltaTime;
		position.y += direction.y * speed * deltaTime;
	}
	public void useExistingToCreateANew()
	{
		this.position = new PVector(-10,-10);
		this.hitBox = 10;
		this.despawn = false;
		this.outOfBounds = false;
		this.direction = new PVector();

	}
	public void useExistingToCreateANew(float x, float y, float diameter)
	{
		this.position = new PVector(x,y);
		this.hitBox = diameter;
		this.despawn = false;
		this.outOfBounds = false;
		this.direction = new PVector();

	}
	public void useExistingToCreateANew(float x, float y, float diameter)
	{
		this.position = new PVector(x,y);
		this.hitBox = diameter;
		this.despawn = false;
		this.outOfBounds = false;
		this.directionVelocity = new PVector();

	}

}
