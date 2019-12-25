void combat() //added in 6.0
{
  if (!started)
  {
    if (round == 0)
    {
      mainBad = firstBaddie;
    }
    if (round == 1)
    {
      mainBad = secondBaddie;
    }
    if (round == 2)
    {
      mainBad = thirdBaddie;
    }
    if (round == 3)
    {
      mainBad = boss;
    }
    
    enemyH.setMaxStat(mainBad.getHealth());
    enemyS.setMaxStat(mainBad.getStamina());
    tonyH.setStat(mainUser.getHealth());
    enemyH.setStat(mainBad.getHealth());
    enemyS.setStat(mainBad.getStamina());
    tonyS.setStat(mainUser.getStamina());
    started = true;
    strongA = false;
    weakA = false;
    turn = true;
  }


  print(mainBad.getHealth() + "\n");


  if (!pausedC && turn && (!died && !enemyDied)) //Player's turn
  {
    screenI.beginDraw();
    tonyH.setActive(true);
    tonyS.setActive(true);
    enemyH.setActive(true);
    enemyS.setActive(true);
    if (!useI) //if not using an item
    {
      drunkCof.setActive(false);
      butActuallyDont.setActive(false);
      weako.setActive(true);
      stronkboi.setActive(true);
    }
    useo.setActive(true);
    screenI.clear();
    screenI.fill(255);
    screenI.image(backgroundBox, 0, 0, 1280, 720);
    if (weakA) //attack animations can go here
    {
      healthTemp=(mainUser.getAttack()/mainBad.getDefense());
      pausedC = true;
      displayText = ("You performed a weak attack \n for " + healthTemp + " damage!");
      healthTarget = mainBad.getHealth() - healthTemp;
      weakA = false;
      turn = false;
    }
    if (strongA)  //attack animations can go here
    {
      if (mainUser.getStamina() >= 10)
      {
        healthTemp =(mainUser.getAttack()*2/mainBad.getDefense());
        healthTarget = mainBad.getHealth() - healthTemp;
        staminaTarget = (mainUser.getStamina()-10);
        staminaTemp = 10;
        pausedC = true;
        displayText = ("You performed a strong attack \n for " + healthTemp + " damage!");
        turn = false;
      } else
      {
        //attack couldn't be done, insufficent stamina
      }
    }
    if (useI)  //use item animations can go here
    {
      int counter = 0;
      for (Item item : main.getItems())
      {
        if (item.getConsumable() == true)
        {
          counter++;
          drunkCof.setActive(true);
        }
      }
      weako.setActive(false);
      stronkboi.setActive(false);
      butActuallyDont.setActive(true);
      butActuallyDont.display();
      screenI.textSize(50);
      screenI.text(counter, 400, 580);
      drunkCof.display();
    }

    if (!useI)
    {
      weako.display();
      stronkboi.display();
    }
    useo.display();
    tonyH.display();
    tonyS.display();

    enemyH.display();
    enemyS.display();
    screenI.endDraw();
  }

  if (mainBad.getHealth()<=0 && !pausedC)
  {
    enemyDied = true;
  }

  if (!pausedC && !turn && (!died && !enemyDied)) //enemy turn
  {
    int decision = (int)(Math.random() * 50 + 1);

    if (decision > 10) //enemy light attack
    {
      healthTemp = mainBad.getAttack() / mainUser.getDefense();
      healthETarget = mainUser.getHealth() - healthTemp;
      //print("light attacked \n");

      pausedC = true;
      displayText = ("Your opponent performed a light attack \n for " + healthTemp + " damage!");
    } else if (mainBad.getStamina() < 10 ) //drinks their own coffee, which they have infinite of because they are gods
    {
      float temp = mainBad.getHealth();
      float temptemp = mainBad.getStamina();
      mainBad.setHealth(mainBad.getHealth() + 10);
      mainBad.setStamina(mainBad.getStamina() + 15);

      if (mainBad.getHealth() > mainBad.getMaxHealth())
      {
        mainBad.setHealth(mainBad.getMaxHealth());
      }
      if (mainBad.getStamina() > mainBad.getMaxStamina())
      {
        mainBad.setStamina(mainBad.getMaxStamina());
      }
      enemyH.setStat(mainBad.getHealth());
      enemyS.setStat(mainBad.getStamina());
      float val1 = mainBad.getHealth() - temp;
      float val2 = mainBad.getStamina() - temptemp;
      pausedC = true;
      displayText = ("Your opponent drank coffee, \n regaining " + val1 + " health and " + val2 + " stamina!");

      //print("drank coffee \n");
    } else if (mainBad.getStamina() >= 10)//stronk attack
    {
      enemyStrong = true;
      healthTemp = mainBad.getAttack()*2 / mainUser.getDefense();
      healthETarget = (mainUser.getHealth() - healthTemp);
      staminaETarget = (mainBad.getStamina() - 10);
      staminaTemp = 10;
      //print("stronk attacked \n");
      pausedC = true;
      displayText = ("Your opponent performed a strong \n attack for " + healthTemp + " damage!");
    }

    turn = true;
  }

  if (mainUser.getHealth()<=0 && !pausedC)
  {
    died = true;
  }



  if (died) //LOSE CODE
  {
    started = false;
    left = true;
    drunkCof.setActive(false);
    butActuallyDont.setActive(false);
    weako.setActive(false);
    stronkboi.setActive(false);
    useo.setActive(false);
    battle = false;
    ready2 = false;
    ready3 = false;
    win = true;
    round--;

    /*
    battlePosition = 0;
     enemyDied = false;
     battleThemeMain.pause();
     battleThemeMain.rewind();
     battleZoneRed.translate(0, 49, 0);
     battleZoneRingRed.translate(0, 49, 0);
     respawn();
     */

    mainUser.setHealth(mainUser.getMaxHealth());
    mainUser.setStamina(mainUser.getMaxStamina());
    mainBad.setHealth(mainBad.getMaxHealth());
    mainBad.setStamina(mainBad.getMaxStamina());

    died = false;
  }

  if (enemyDied) //WIN CODE
  {
    drunkCof.setActive(false);
    butActuallyDont.setActive(false);
    weako.setActive(false);
    stronkboi.setActive(false);
    useo.setActive(false);
    started = false;
    left = true;
    ready2 = false;
    ready3 = false;
    win = true;
    battle = false;
    if (round == 0)
    {
      enemyStatus[0] = false;
    }
    if (round == 1)
    {
      enemyStatus[1] = false;
    }
    if (round == 2)
    {
      enemyStatus[2] = false;
    }
    if (round == 3)
    {
      enemyStatus[3] = false;
    }
  }

  if (pausedC && !(mainUser.getHealth()<=0) && !(mainBad.getHealth()<=0))
  {
    drunkCof.setActive(false);
    butActuallyDont.setActive(false);
    weako.setActive(false);
    stronkboi.setActive(false);
    useo.setActive(false);
    screenI.beginDraw();
    screenI.image(backgroundBox, 0, 0, 1280, 720);
    screenI.pushMatrix();
    screenI.fill(255);
    screenI.rect(300, 500, 680, 220);
    screenI.textSize(30);
    screenI.fill(0);
    
    
    if (turn == false && !uhg)
    {
      if (mainBad.getHealth() > healthTarget)
      {
        mainBad.setHealth(mainBad.getHealth()-(healthTemp/60));
      }
      if (mainBad.getHealth() < healthTarget)
      {
        mainBad.setHealth(healthTarget);
      }

      if (strongA)
      {
        if (mainUser.getStamina() > staminaTarget)
        {
          mainUser.setStamina(mainUser.getStamina() - staminaTemp/60);
        }
        if (mainUser.getStamina() <= staminaTarget)
        {
          mainUser.setStamina(staminaTarget);
        }
      }
    


      enemyH.setStat(mainBad.getHealth());
      tonyS.setStat(mainUser.getStamina());
    }
    
    
    if (turn == true && !uhg)
    {
      if (mainUser.getHealth() > healthETarget)
      {
        mainUser.setHealth(mainUser.getHealth()-(healthTemp/60));
      }
      if (mainUser.getHealth() < healthETarget)
      {
        mainUser.setHealth(healthETarget);
      }

      if (enemyStrong)
      {
        if (mainBad.getStamina() > staminaETarget)
        {
          mainBad.setStamina(mainBad.getStamina() - staminaTemp/60);
        }
        if (mainBad.getStamina() <= staminaETarget)
        {
          mainBad.setStamina(staminaETarget);
        }
      }

      tonyH.setStat(mainUser.getHealth());
      enemyS.setStat(mainBad.getStamina());
    }
    screenI.textAlign(CENTER);
    screenI.text(displayText, width/2, 600);
    screenI.textAlign(LEFT);
    screenI.fill(255);
    tonyH.display();
    tonyS.display();
    enemyH.display();
    enemyS.display();
    screenI.endDraw();
    screenI.popMatrix();



    if (pauseClick)
    {
      if (turn == false && !uhg)
      {
        mainBad.setHealth(healthTarget);
        if (strongA)
        {
          mainUser.setStamina(staminaTarget);
        }
        enemyH.setStat(mainBad.getHealth());
        tonyS.setStat(mainUser.getStamina());
        strongA = false;
      }
      if (turn == true && !uhg)
      {
        mainUser.setHealth(healthETarget); 
        if (enemyStrong)
        {
          mainBad.setStamina(staminaETarget);
        }
        tonyH.setStat(mainUser.getHealth());
        enemyS.setStat(mainBad.getStamina());
        enemyStrong = false;
      }

      pauseClick = false;
      pausedC = false;
      if (uhg)
      {
        uhg = false;
      }

      if (mainUser.getHealth()<=0 || mainBad.getHealth()<=0)
      {
        pausedC = true;
      }
    }
  }



  if (pausedC && (mainUser.getHealth()<=0))
  {
    drunkCof.setActive(false);
    butActuallyDont.setActive(false);
    weako.setActive(false);
    stronkboi.setActive(false);
    useo.setActive(false);
    screenI.beginDraw();
    screenI.pushMatrix();
    screenI.fill(255);
    screenI.rect(0, 500, 1280, 220);
    screenI.textSize(30);
    screenI.fill(0);
    screenI.textAlign(CENTER);
    screenI.text("You got dragged away by airport security!", width/2, 600);
    screenI.textAlign(LEFT);
    screenI.fill(255);
    screenI.endDraw();
    screenI.popMatrix();

    if (pauseClick)
    {
      pauseClick = false;
      pausedC = false;
    }
  }

  if (pausedC && (mainBad.getHealth()<=0))
  {
    String tempString = "";

    if (round == 0)
    {
      for (int i = 0; i<firstBaddie.getRewards().length; i++)
      {
        tempString += firstBaddie.getRewards()[i].getName() ;
        if (i<firstBaddie.getRewards().length-1)
        {
          tempString += " and ";
        }
      }
    }
    if (round == 1)
    {
      for (int i = 0; i<secondBaddie.getRewards().length; i++)
      {
        tempString += secondBaddie.getRewards()[i].getName() ;
        if (i<secondBaddie.getRewards().length-1)
        {
          tempString += " and ";
        }
      }
    }
    if (round == 2)
    {
      for (int i = 0; i<thirdBaddie.getRewards().length; i++)
      {
        tempString += thirdBaddie.getRewards()[i].getName() ;
        if (i<thirdBaddie.getRewards().length-1)
        {
          tempString += " and ";
        }
      }
    }
    if (round == 3)
    {
      for (int i = 0; i<boss.getRewards().length; i++)
      {
        tempString += boss.getRewards()[i].getName() ;
        if (i<boss.getRewards().length-1)
        {
          tempString += " and ";
        }
      }
    }
    drunkCof.setActive(false);
    butActuallyDont.setActive(false);
    weako.setActive(false);
    stronkboi.setActive(false);
    useo.setActive(false);
    screenI.beginDraw();
    screenI.pushMatrix();
    screenI.fill(255);
    screenI.rect(0, 500, 1280, 220);
    screenI.textSize(30);
    screenI.fill(0);
    screenI.textAlign(CENTER);
    screenI.text( "You won! You recieved: " + tempString, width/2, 600);
    screenI.textAlign(LEFT);
    screenI.fill(255);
    screenI.endDraw();
    screenI.popMatrix();

    if (pauseClick)
    {
      if (round == 0)
      {
        for (Item item : firstBaddie.getRewards())
        {
          main.addItem(item);
        }
      }
      if (round == 1)
      {
        for (Item item : secondBaddie.getRewards())
        {
          main.addItem(item);
        }
      }
      if (round == 2)
      {
        for (Item item : thirdBaddie.getRewards())
        {
          main.addItem(item);
        }
      }
      if (round == 3)
      {
        for (Item item : boss.getRewards())
        {
          main.addItem(item);
        }
      }
      pauseClick = false;
      pausedC = false;
    }
  }

  //Scaling, Rotation, and Drawing
  pushMatrix();
  translate(xBoxPos + -50.91, 0, zBoxPos + -18.76);
  rotateY(-0.9);
  image(screenI, 0, -60, width/10, height/10); //adjust size here
  popMatrix();
}

void combatInputs()
{
  if (pausedC)
  {
    pauseClick = true;
  }
  if (weako.isClicked())
  {
    weakA = true;
  }
  if (stronkboi.isClicked())
  {
    strongA = true;
  }
  if (useo.isClicked())
  {
    useI = true;
  }
  if (butActuallyDont.isClicked())
  {
    useI = false;
  }
  if (drunkCof.isClicked())
  {
    Item temp = null;
    for (Item item : main.getItems())
    {
      if (item.getConsumable() == true)
      {
        temp = item;
      }
    }
    float temptemp = mainUser.getHealth();
    float eventempertemp = mainUser.getStamina();
    main.consumeItem(temp);
    tonyH.setStat(mainUser.getHealth());
    tonyS.setStat(mainUser.getStamina());

    float val1 = (mainUser.getHealth() - temptemp);
    float val2 = (mainUser.getStamina() - eventempertemp);


    pausedC = true;
    displayText = ("You drank coffee, \n regaining " + val1 + " health and " + val2 + " stamina!");
    useI = false;
    uhg = true;
    turn = false;
  }
}
