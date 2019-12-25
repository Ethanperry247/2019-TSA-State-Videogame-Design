//In this method: this method affects camera movement and positioning

void cameraS()
{

  //Responsible for camera movement
  if (!open && !battle && !movieOpen)
  {
    if (isDown && isRight && isLeft && isUp)
    {
    } else if (isDown && isRight && isLeft)
    {
    } else if (isDown && isRight && isUp)
    {
    } else if (isDown && isUp && isLeft)
    {
    } else if (isUp && isRight && isLeft)
    {
    } else if (isDown && isRight)
    {
      camX = camX + 0.5;
    } else if (isUp && isLeft)
    {
      camX = camX - 0.5;
    } else if (isDown && isLeft)
    {
      camY = camY + 0.5;
    } else if (isUp && isRight)
    {
      camY = camY - 0.5;
    } else if (isUp)
    {
      camX = camX - 0.35;
      camY = camY - 0.35;
    } else if (isDown)
    {
      camX = camX + 0.35;
      camY = camY + 0.35;
    } else if (isRight)
    {
      camY = camY - 0.35;
      camX = camX + 0.35;
    } else if (isLeft)
    {
      camY = camY + 0.35;
      camX = camX - 0.35;
    }
  }


  if (battle && !open)
  {
    if (battlePosition < 100)
    {
      x-=1.9;
      //z+=7;
      y+=0.1;
      z1+=0.14;
    } else if (ready2)
    {
      ready3 = true;
    }
    eCount = 9.0;
  } else if (!open && !movieOpen)
  {
    x = 150+camX;
    y = -150;
    z = 150+camY;
    x1 = camX;
    y1 = -20;
    z1 = camY;
    eCount = eCountSave;
  }
  
  //print(open);
  //print(x + " " + y + "\n");

  if (open && !movieOpen && !charSelect)
  {
    x = 640;
    y = 360;
    x1 = x;
    y1 = y;
    z = 150;
    eCount = -18;
  } else eCount = eCountSave;

  if (movieOpen || charSelect || !title0 || level == 8)
  {
    x = 1340;
    y = 360;
    x1 = x;
    y1 = y;
    eCount = -18;
  } else eCount = eCountSave;
  
  
  if (movieOpen2)
  {
    x = 2040;
    y = 360;
    x1 = x;
    y1 = y;
    eCount = -18;
  } else eCount = eCountSave;

  //x, y, z are the location of the camera; x1, y1, and z1 are where the camera is looking
  //print(x + " " + y + "\n");
  camera(x, y, z, x1, y1, z1, 0, 1, 0);
  
  //Finding Camera Angles
  /*
  float xDistance = x-x1;
  float yDistance = y-y1;
  float zDistance = z-z1;
  float hDistance = sqrt(zDistance*zDistance+yDistance*yDistance);
  */

  //cameraAngleR = atan(xDistance/hDistance);
  //cameraAngleTheta = atan(zDistance/yDistance);

  //print(cameraAngleR + " " + cameraAngleTheta + "\n");
}
