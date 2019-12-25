// Optional Movement Controls
void keyPressed() {
  
  setMove(keyCode, true);
  setKey(key, true);
  
  if (!battle)
  {
    if (key == 'I' || key == 'i')
    {
      open = !open;
    }
  }  

  if (key == 'B' || key == 'b')
  {
    battle = !battle;
  }
  
  if (key == 'M' || key == 'm')
  {
    skipVideo = !skipVideo;
  }

  if (key == '=')
  {
    if (level == 1) round++;
    if (level == 2) round+=2;
    level++;
  }
  if (key == '-')
  {
    level--;
  }
  if (key == 'h')
  {
   level = 8; 
  }

  inventoryKeyPress();
}

void keyReleased() {
  setMove(keyCode, false);
  setKey(key, false);
}

void mouseClicked()
{
  inventorySlotInput();
  characterSInputs(); //added in 6.0
  combatInputs(); //added in 6.0
  startScreenInputs(); // 7.0

  if (level == 0)
  {
    if ((mouseX > 1070 + scrollFactorX && mouseX < 1220 + scrollFactorX) && (mouseY > 582 + scrollFactorY && mouseY < 635 + scrollFactorY))
    {
      level = 4;
    }
  }
}

void mouseReleased()
{
  inventoryItemInputEnd();
}

void mousePressed()
{
  inventoryItemInput();
}

boolean setMove(int k, boolean b) {
  switch (k) {
  case UP:
    return isUp = b;

  case DOWN:
    return isDown = b;

  case LEFT:
    return isLeft = b;

  case RIGHT:
    return isRight = b;

  default:
    return b;
  }
}
boolean setKey(int key, boolean b) {
  switch (key) {
  case 'w':
    return isUp = b;

  case 's':
    return isDown = b;

  case 'a':
    return isLeft = b;

  case 'd':
    return isRight = b;

  case 'e':
    return isE = b;

  default:
    return b;
  }
}
boolean setCapKey(int key, boolean b) {
  switch (key) {
  case 'W':
    return isUp = b;

  case 'S':
    return isDown = b;

  case 'A':
    return isLeft = b;

  case 'D':
    return isRight = b;

  case 'E':
    return isE = b;

  default:
    return b;
  }
}
