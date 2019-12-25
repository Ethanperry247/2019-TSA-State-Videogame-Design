//In render: levels are displayed on the screen and have collision based on the player's proximity; battles are detected and called from this method; transitioning from level to level is done here.

void render()
{
  exitLevel();
  checkBattle();
  if (battle)
  {
    battle();
    //print(battlePosition + "\n");
  } else if (win)
  {
    battlePosition = 0;
    battleThemeMain.pause();
    battleThemeMain.rewind();
    battleZoneRed.translate(0, 49, 0);
    battleZoneRingRed.translate(0, 49, 0);
    if (level != 3)
    {
      x+=4;
      x1+=4;
      //print (z + " " + z1 + " " + zBoxPos + "\n");
      moveModel(tony, 4, 0, 0);
      for (int i = 0; i < tonyWalk.length; i++)
      {
        moveModel(tonyWalk[i], 4, 0, 0);
      }
      battleZoneRed.translate(4, 0, 0);
      battleZoneRingRed.translate(4, 0, 0);
      camX+=4;
      xBoxPos+=4;
    } else if (level == 3)
    {
      x+=40;
      x1+=40;
      //print (z + " " + z1 + " " + zBoxPos + "\n");
      moveModel(tony, 40, 0, 0);
      for (int i = 0; i < tonyWalk.length; i++)
      {
        moveModel(tonyWalk[i], 40, 0, 0);
      }
      battleZoneRed.translate(40, 0, 0);
      battleZoneRingRed.translate(40, 0, 0);
      camX+=40;
      xBoxPos+=40;
    }
    for (int j = 0; j < battleZoneBlue.length; j++)
    {
      battleZoneBlue[j].translate(0, 49, 0);
      battleZoneRingBlue[j].translate(0, 49, 0);
    }
    enemyDied = false;
    mainBad = new Enemy("Muffin", 50, 10, 2, 1, "slap", "big slap");
    round++;
    win = false;
  }
  if (level == 0)
  {
    shape(map.get(0));
    collision(map.get(0));
    bedroom();
  }

  if ((battle || (level == 0) || (level == 5) || (level == 4) || (level == 6) || (level == 7) || (level == 8)))
  {
    if (mainMusic.isPlaying())
    {
      mainMusic.pause();
    }
  } else 
  {
    if (!mainMusic.isPlaying())
    {
      mainMusic.loop();
    }
  }


  if (!battle)
  {
    if (level == 1)
    {
      for (int i = 1; i < 14; i++)
      {
        pushMatrix();
        translate(position.get(i).x, position.get(i).y, position.get(i).z);
        //sphere(2);
        popMatrix();
        //print(position.get(i)+"\n");
      }
      for (int i = 0; i < 13; i++)
      {
        if (dist(xBoxPos, zBoxPos, position.get(i + 1).x, position.get(i + 1).z) < 120)
        {
          shape(levelOne.get(i));
        }
        /*
        if (dist(xBoxPos, zBoxPos, position.get(i + 1).x, position.get(i + 1).z) < 30)
        {
          collision(levelOne.get(i));
        }
        */
        if (position.get(i+1).x > (xBoxPos - 30) && position.get(i+1).x < (xBoxPos + 30))
        {
          if (position.get(i+1).z > (zBoxPos - 30) && position.get(i+1).z < (zBoxPos + 30))
          {
            collision(levelOne.get(i));
          }
        }
      }
    }
    if (level == 2)
    {
      for (int i = 0; i < levelTwo.size(); i++)
      {
        if (dist(xBoxPos, zBoxPos, position.get(i + 14).x, position.get(i + 14).z) < 500)
        {
          shape(levelTwo.get(i));
        }
        if (dist(xBoxPos, zBoxPos, position.get(i + 14).x, position.get(i + 14).z) < 80)
        {
          collision(levelTwo.get(i));
        }
      }
    }
    if (level == 3)
    {
      for (int i = 0; i < levelThree.size(); i++)
      {
        if (dist(xBoxPos, zBoxPos, position.get(i + 43).x, position.get(i + 43).z) < 200)
        {
          shape(levelThree.get(i));
        }
        if (dist(xBoxPos, zBoxPos, position.get(i + 43).x, position.get(i + 43).z) < 70)
        {
          collision(levelThree.get(i));
        }
      }
    }
    if (level == 4 || level == 6)
    {
      if (level == 4)
      {
        movieOpen = true;
        openCutScene.play();
        pg.beginDraw();
        pg.clear();
        pg.fill(255);
        pg.image(openCutScene, 0, 0, 1280, 720);
        pg.endDraw();
        pushMatrix();
        translate(700, 0);
        image(pg, 0, 0, 1280, 720);
        popMatrix();
        float timer = openCutScene.duration() - 0.1;

        //Cutscene Termination
        if (openCutScene.time() >= timer || skipVideo)
        {
          if (timerCount < 100)
          {
            pg.tint(255 - timerCount*2.5);
            timerCount++;
          } else if (timerCount == 100)
          {
            openCutScene.stop();
            pg.clear();
            timerCount = 0;
            movieOpen = false;
            skipVideo = false;
            level = 1;
          }
        }
      } else if (level == 6)
      {
        movieOpen = true;
        finalBossCutScene.play();
        pg.beginDraw();
        pg.clear();
        pg.tint(255);
        pg.fill(255);
        pg.image(finalBossCutScene, 0, 0, 1280, 720);
        pg.endDraw();
        pushMatrix();
        translate(700, 0);
        image(pg, 0, 0, 1280, 720);
        popMatrix();
        float timer = finalBossCutScene.duration() - 0.1;

        //Cutscene Termination
        if (finalBossCutScene.time() >= timer || skipVideo)
        {
          if (timerCount < 100)
          {
            pg.tint(255 - timerCount*2.5);
            timerCount++;
          } else if (timerCount == 100)
          {
            openCutScene.stop();
            pg.clear();
            timerCount = 0;
            movieOpen = false;
            skipVideo = false;
            videoCheck = true;
            level = 3;
          }
        }
      }
    }
    if (level == 5)
    {


      charSelect = true;
      if (!selected)
      {
        characterS();
      } else
      {
        charSelect = false;
        //Character Selection
        characterSelection(characterTemp);
        level = 0;
      }
    }
    if (level == 7)
    {
      if (!title0)
      {
        startScreen();
      } else if (title0)
      {
        level = 5;
      }
    }
    if (level == 8)
    {
      translate(700, 0);
      image(endScreen, 0, 0, 1280, 720);
    }
  }
}

void checkBattle()
{
  if (level == 0)
  {
  } else if (level == 1)
  {
    if (xBoxPos > enemyLocX[0] - 40 && xBoxPos < enemyLocX[0] + 20 && zBoxPos < enemyLocZ[0] + 20 && zBoxPos > enemyLocZ[0] - 20 && round == 0)
    {
      battle = true;
    }
  } else if (level == 2)
  {
    if (xBoxPos > enemyLocX[1] - 20 && xBoxPos < enemyLocX[1] + 20 && zBoxPos < enemyLocZ[1] + 20 && zBoxPos > enemyLocZ[1] - 20 && round == 1)
    {
      battle = true;
    }
    if (xBoxPos > enemyLocX[2] - 40 && xBoxPos < enemyLocX[2] + 40 && zBoxPos < enemyLocZ[2] + 40 && zBoxPos > enemyLocZ[2] - 40 && round == 2)
    {
      battle = true;
    }
  } else if (level == 3)
  {
    if (xBoxPos > enemyLocX[3] - 40 && xBoxPos < enemyLocX[3] + 60 && zBoxPos < enemyLocZ[3] + 40 && zBoxPos > enemyLocZ[3] - 40 && videoCheck == false && round == 3)
    {
      level = 6;
    } else if (xBoxPos > enemyLocX[3] - 40 && xBoxPos < enemyLocX[3] + 60 && zBoxPos < enemyLocZ[3] + 40 && zBoxPos > enemyLocZ[3] - 40 && videoCheck && round == 3)
    {
      battle = true;
    }
  }
}

void exitLevel()
{
  if (level == 0)
  {
  } else if (level == 1)
  {
    /*
    pushMatrix();
     translate(254,-15,-242);
     box(20,30,20);
     popMatrix();
     print(camX + " " + camY + "\n\n");
     */
    if (xBoxPos > 234 && xBoxPos < 274)
    {
      if (zBoxPos > -262 && zBoxPos < -222)
      {
        level++;
        respawn();
      }
    }
  } else if (level == 2)
  {

    if (xBoxPos > 695 && xBoxPos < 735)
    {
      if (zBoxPos > -243 && zBoxPos < -203)
      {
        level++;
        respawn();
      }
    }
  } else if (level == 3)
  {
  }
}

void respawn()
{
  for (int i = 0; i < tony.getChildCount(); i++)
  {
    PShape child = tony.getChild(i);
    for (int j = 0; j < child.getVertexCount(); j++)
    {
      PVector vert = child.getVertex(j);
      child.setVertex(j, vert.x - xBoxPos, vert.y, vert.z - zBoxPos);
    }
  }
  for (int k = 0; k < tonyWalk.length; k++)
  {
    for (int i = 0; i < tonyWalk[k].getChildCount(); i++)
    {
      PShape child = tonyWalk[k].getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, vert.x - xBoxPos, vert.y, vert.z - zBoxPos);
      }
    }
  } 
  battleZoneRed.translate(-xBoxPos, 0, -zBoxPos);
  battleZoneRingRed.translate(-xBoxPos, 0, -zBoxPos);
  xBoxPos = 0;
  zBoxPos = 0;
  camX = 0;
  camY = 0;
}

void bedroom()
{
  if (walkThrough == 0)
  {
    pushMatrix();
    translate(5, -20, 0);
    rotateY(PI/4);
    image(bedroom, 0, 0, bedroom.width/20, bedroom.height/20);
    noFill();
    stroke(0);
    strokeWeight(7);
    if ((mouseX > 1070 + scrollFactorX && mouseX < 1220 + scrollFactorX) && (mouseY > 582 + scrollFactorY && mouseY < 635 + scrollFactorY))
    {
      rect(39.81, 24.35, 14.5, 5.3);
    }
    //print (mouseX + " " + mouseY + "\n");
    popMatrix();
  } else if (walkThrough == 1)
  {
    pushMatrix();
    translate(10, -20, 0);
    rotateY(PI/4);
    fill(255);
    rect(0, 0, 10, 10);
    popMatrix();
  }
}
