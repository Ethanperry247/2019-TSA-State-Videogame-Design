//In this method: this is called from render; this displays the battle zones and creates an animation for the battle zones; it also does the camera movement found at the beginning of battles

void battle()
{

  for (int i = 0; i < map.size(); i++)
  {
    if (battlePosition < 100)
    {
      //map.get(i).translate(0, 0.75, 0);
      for (int j = 0; j < battleZoneBlue.length; j++)
      {
        battleZoneBlue[j].translate(0, -0.0049, 0);
        battleZoneRingBlue[j].translate(0, -0.0049, 0);
      }
      battleZoneRed.translate(0, -0.0049, 0);
      battleZoneRingRed.translate(0, -0.0049, 0);
    }
    battlePosition+=0.01;
  }
  shape(tony);
  shape(battleZoneRed);
  shape(battleZoneRingRed);
  //battleZoneRingRed.rotateY(rotateValue);
  //rotateValue++;

  if (level == 1)
  {
    shape(battleZoneBlue[0]);
    shape(battleZoneRingBlue[0]);
    battleCondition(0);
  } else if (level == 2)
  {
    if (round == 1)
    {
      shape(battleZoneBlue[1]);
      shape(battleZoneRingBlue[1]);
      battleCondition(1);
    } else if (round == 2)
    {
      shape(battleZoneBlue[2]);
      shape(battleZoneRingBlue[2]);
      battleCondition(2);
    }
  } else if (level == 3)
  {
    shape(battleZoneBlue[3]);
    shape(battleZoneRingBlue[3]);
    battleCondition(3);
  }

  if (!battleThemeMain.isPlaying())
  {
    battleThemeMain.play(0);
  }

  if (increase < 60 && up == true)
  {
    increase++;
    battlePiece(battleZoneRingRed, 0.05, 0);
    for (int i = 0; i < battleZoneBlue.length; i++)
    {
      battlePiece(battleZoneRingBlue[i], -0.05, 0);
    }
  } else if (increase == 60 && up)
  {
    up = false;
  } else if (increase <= 60 && increase > 1 && up == false)
  {
    increase--; 
    battlePiece(battleZoneRingRed, -0.05, 0);
    for (int i = 0; i < battleZoneBlue.length; i++)
    {
      battlePiece(battleZoneRingBlue[i], 0.05, 0);
    }
  } else if (increase == 1 && up == false)
  {
    up = true;
  }
  win = true;
}

void battleCondition(int location)
{
  if (zBoxPos > enemyLocZ[location])
  {
    z-=1;
    z1-=1;
    //print (z + " " + z1 + " " + zBoxPos + "\n");
    moveModel(tony, 0, 0, -1);
    for (int i = 0; i < tonyWalk.length; i++)
    {
      moveModel(tonyWalk[i], 0, 0, -1);
    }
    battleZoneRed.translate(0, 0, -1);
    battleZoneRingRed.translate(0, 0, -1);
    camY-=1;
    zBoxPos-=1;
    //z-=0.5;
  } else if (zBoxPos < enemyLocZ[location] - 1)
  {
    z+=1;
    z1+=1;
    //print (z + " " + z1 + " " + zBoxPos + "\n");
    moveModel(tony, 0, 0, 1);
    for (int i = 0; i < tonyWalk.length; i++)
    {
      moveModel(tonyWalk[i], 0, 0, 1);
    }
    battleZoneRed.translate(0, 0, 1);
    battleZoneRingRed.translate(0, 0, 1);
    camY+=1;
    zBoxPos+=1;
    //z-=0.5;
  } else ready = true;

  if (xBoxPos > enemyLocX[location] - 44)
  {
    x-=1;
    x1-=1;
    //print (z + " " + z1 + " " + zBoxPos + "\n");
    moveModel(tony, -1, 0, 0);
    for (int i = 0; i < tonyWalk.length; i++)
    {
      moveModel(tonyWalk[i], -1, 0, 0);
    }
    battleZoneRed.translate(-1, 0, 0);
    battleZoneRingRed.translate(-1, 0, 0);
    camX-=1;
    xBoxPos-=1;
    //z-=0.5;
  } else if (xBoxPos < enemyLocX[location] - 45)
  {
    x+=1;
    x1+=1;
    //print (z + " " + z1 + " " + zBoxPos + "\n");
    moveModel(tony, 1, 0, 0);
    for (int i = 0; i < tonyWalk.length; i++)
    {
      moveModel(tonyWalk[i], 1, 0, 0);
    }
    battleZoneRed.translate(1, 0, 0);
    battleZoneRingRed.translate(1, 0, 0);
    camX+=1;
    xBoxPos+=1;
    //z-=0.5;
  } else if (ready == true)
  {
    ready2 = true;
  }
}
