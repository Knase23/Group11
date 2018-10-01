

boolean checkCollision(float x1, float y1, float x2, float y2){ //x1,y1 is a ship or a bullet, x2,y2 is a bullet or a ship

    if friendlyFire(objectOne, objectTwo) == true{
    	return false;
	}
	else{
			int tooClose = hitBox + munitionHitBox;
		    if (dist(x1, y1, x2, y2) < tooClose)
        {
            return true;
        }
        else
        {
            return false;
        }
	}

boolean friendlyFire(objectOne, objectTwo){
	if
	(objectOne instanceof player) && (objectTwo instanceof enemyBullet)
	||
	(objectOne instanceof enemyBullet) && (objectTwo instanceof player)
	||
	(objectOne instanceof enemy) && (objectTwo instanceof myBullet)
	||
	(objectOne instanceof myBullet) && (objectTwo instanceof enemy)
	{
		return false;
	}
	else
	{
		return true;
	}
}