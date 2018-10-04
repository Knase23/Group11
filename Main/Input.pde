boolean keyIsPressed = false;

boolean isWpressed, isApressed, isSpressed, isDpressed, isSpacePressed; // isDpressed= true always

boolean isBackspacePressed, isEnterPressed;

boolean isLeftmouseclicked;
void keyPressed() 
{
	keyIsPressed = true;
	if (keyCode == UP || keyCode == 87) {	 //keyCode 87 = w/W
		isWpressed= true; 
	}
	if (keyCode == LEFT || keyCode == 65) { 	//keyCode 65 = a/A
		isApressed= true;
	}
	if (keyCode ==DOWN || keyCode ==83) {	//keyCode 83 = s/S
		isSpressed = true;
	}
	if (keyCode ==RIGHT || keyCode ==68) {	//keyCode 68 = d/D 
		isDpressed = true;
	}

	if(keyCode == 32)
		isSpacePressed = true;
	if(keyCode == 8)
		isBackspacePressed = true;
	
	if(keyCode == ENTER)
	{
		println("ENTER is Pressed");
		isEnterPressed = true;
	}

}


void keyReleased() 
{
	keyIsPressed = false;

	if (keyCode == UP || keyCode == 87) {	 //keyCode 87 = w/W
		isWpressed= false; 
	}
	if (keyCode == LEFT || keyCode == 65) { 	//keyCode 65 = a/A
		isApressed= false;
	}
	if (keyCode ==DOWN || keyCode ==83) {	//keyCode 83 = s/S
		isSpressed = false;
	}
	if (keyCode ==RIGHT || keyCode ==68) {	//keyCode 68 = d/D 
		isDpressed = false;
	}
	if(keyCode == 32)
		isSpacePressed = false;
	if(keyCode == 8)
		isBackspacePressed = false;
	
	if(keyCode == ENTER)
	{
		println("ENTER is Released");
		isEnterPressed = false;
	}

}

void mousePressed()
 {
	if (mouseButton == LEFT) {
		isLeftmouseclicked = true;
	}
}


void mouseReleased () 
{
if (mouseButton == LEFT) {
	isLeftmouseclicked = false;
}
}