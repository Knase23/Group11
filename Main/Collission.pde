

 boolean checkCollision(GameObject go1, GameObject go2){ //x1,y1 is a ship or a bullet, x2,y2 is a bullet or a ship

  if(go1.despawn || go2.despawn)
    return false;

 float maxDistance = (go1.hitBox + go2.hitBox)/2;




if(abs(go1.position.x - go2.position.x) > maxDistance || abs(go1.position.y - go2.position.y) > maxDistance)
  {
    return false;
  }
  else if(dist(go1.position.x, go1.position.y, go2.position.x, go2.position.y) > maxDistance)
  {
    return false;
  }

   else
  {
   return true;
  }
}


//     if friendlyFire(objectOne, objectTwo) == true{
//     	return false;
// 	}
// 	else{
// 			int tooClose = hitBox + munitionHitBox;
// 		    if (dist(x1, y1, x2, y2) < tooClose)
//         {
//             return true;
//         }
//         else
//         {
//             return false;
//         }
// 	}

// boolean friendlyFire(objectOne, objectTwo){
// 	if
// 	(objectOne instanceof player) && (objectTwo instanceof enemyBullet)
// 	||	
// 	(objectOne instanceof enemyBullet) && (objectTwo instanceof player)
// 	||
// 	(objectOne instanceof enemy) && (objectTwo instanceof myBullet)
// 	||
// 	(objectOne instanceof myBullet) && (objectTwo instanceof enemy)
// 	{
// 		return false;
// 	}
// 	else
// 	{
// 		return true;
// 	}
// }

