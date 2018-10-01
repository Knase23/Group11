

boolean isWpressed, isApressed, isSpressed, isDpressed; // isDpressed= true always
boolean isLeftmouseclicked;
void keyPressed() 
{
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

}


void keyReleased() 
{
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

}

void mousePressed()
 {
	if (mouseButton == LEFT) {
		isLeftmouseclicked = true;
	}
}


void mouseRelesed () 
{
if (mouseButton == LEFT) {
	isLeftmouseclicked = false;
}
}