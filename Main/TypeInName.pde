public class TypeInName {

	String name = "Commander Swan";
	boolean addedOne = false;
	boolean removedOne = false;
	boolean done = false;
	public TypeInName () {
		
	}

	public void update() {

		if(!done)
		{
			if(isEnterPressed)
			{
				done = true;
			}

			if(keyIsPressed && !addedOne && !isBackspacePressed && !isEnterPressed)
			{
				name = name + key;
				addedOne = true;
				name.toUpperCase();
			} else if (!keyIsPressed) {
				addedOne = false;
			}
			if(isBackspacePressed && !removedOne && name.length() > 0 )
			{
					name = name.substring(0, name.length()-1);
					removedOne = true;
					println(name);
			} else if(!isBackspacePressed){
				removedOne = false;
			}
		}

		
	}
	public void draw()
	{
		text("Type in name, press \"Enter\" when done",width/2 , height/2 +45);
		textSize(24);
		text(name,width/2 , height/2 +75);
	}

}