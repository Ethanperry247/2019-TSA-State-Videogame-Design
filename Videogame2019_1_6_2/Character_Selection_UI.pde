void characterS() //added in 6.0
{
  if (turnClock)
  {
    lightB.setActive(false);
    medB.setActive(false);
    darkB.setActive(false);
    arrowClock.setActive(false);
    arrowCounter.setActive(false);

    if (characterTemp == 0)
    {
      cSelectLightSpinRev.play();
      timer=cSelectLightSpinRev.duration()-0.1; 
      //Cutscene termination
      if (cSelectLightSpinRev.time() >= timer) 
      {
        cSelectLightSpinRev.stop();
        turnClock = false;
      }
      screenI.beginDraw();
      screenI.image(cSelectLightSpinRev, 0, 0);
      screenI.endDraw();
    }
    if (characterTemp == 1)
    {
      cSelectMedSpinRev.play();
      timer=cSelectMedSpinRev.duration()-0.1; 
      //Cutscene termination
      if (cSelectMedSpinRev.time() >= timer) 
      {
        cSelectMedSpinRev.stop();
        turnClock = false;
      }
      screenI.beginDraw();
      screenI.image(cSelectMedSpinRev, 0, 0);
      screenI.endDraw();
    }
    if (characterTemp == 2)
    {
      cSelectDarkSpinRev.play();
      timer=cSelectDarkSpinRev.duration()-0.1; 
      //Cutscene termination
      if (cSelectDarkSpinRev.time() >= timer) 
      {
        cSelectDarkSpinRev.stop();
        turnClock = false;
      }
      screenI.beginDraw();
      screenI.image(cSelectDarkSpinRev, 0, 0);
      screenI.endDraw();
    }
  }

  if (turnCounter)
  {
    lightB.setActive(false);
    medB.setActive(false);
    darkB.setActive(false);
    arrowClock.setActive(false);
    arrowCounter.setActive(false);
    donezo.setActive(false);

    if (characterTemp == 0)
    {
      cSelectLightSpin.play();
      timer=cSelectLightSpin.duration()-0.1; 
      //Cutscene termination
      if (cSelectLightSpin.time() >= timer) 
      {
        cSelectLightSpin.stop();
        turnCounter = false;
      }
      screenI.beginDraw();
      screenI.image(cSelectLightSpin, 0, 0);
      screenI.endDraw();
    }
    if (characterTemp == 1)
    {
      cSelectMedSpin.play();
      timer=cSelectMedSpin.duration()-0.1; 
      //Cutscene termination
      if (cSelectMedSpin.time() >= timer) 
      {
        cSelectMedSpin.stop();
        turnCounter = false;
      }
      screenI.beginDraw();
      screenI.image(cSelectMedSpin, 0, 0);
      screenI.endDraw();
    }
    if (characterTemp == 2)
    {
      cSelectDarkSpin.play();
      timer=cSelectDarkSpin.duration()-0.1; 
      //Cutscene termination
      if (cSelectDarkSpin.time() >= timer) 
      {
        cSelectDarkSpin.stop();
        turnCounter = false;
      }
      screenI.beginDraw();
      screenI.image(cSelectDarkSpin, 0, 0);
      screenI.endDraw();
    }
  }


  if (!turnClock && !turnCounter)
  {
    arrowClock.setActive(true);
    arrowCounter.setActive(true);
    donezo.setActive(true);

    if (characterTemp == 0)
    {
      lightB.setActive(false);
      medB.setActive(true);
      darkB.setActive(true);

      screenI.beginDraw();
      screenI.imageMode(CORNER);
      screenI.image(cSelectLight, 0, 0, 1280, 720);
      //lightB.display();
      //medB.display();
      //darkB.display();
      donezo.display();
      screenI.endDraw();
    }
    if (characterTemp == 1)
    {
      lightB.setActive(true);
      medB.setActive(false);
      darkB.setActive(true);
      screenI.beginDraw();
      screenI.imageMode(CORNER);
      screenI.image(cSelectMed, 0, 0, 1280, 720);
      //lightB.display();
      //medB.display();
      //darkB.display();
      donezo.display();
      screenI.endDraw();
    }
    if (characterTemp == 2)
    {
      lightB.setActive(true);
      medB.setActive(true);
      darkB.setActive(false);
      screenI.beginDraw();
      screenI.imageMode(CORNER);
      screenI.image(cSelectDark, 0, 0, 1280, 720);
      //lightB.display();
      //medB.display();
      //darkB.display();
      donezo.display();
      screenI.endDraw();
    }
  }

  image(screenI, 700, 0, 1280, 720); //adjust output size here
}

void characterSInputs()
{
  if (lightB.isClicked())
  {
    characterTemp = 0;
  }
  if (medB.isClicked())
  {
    characterTemp = 1;
  }
  if (darkB.isClicked())
  {
    characterTemp = 2;
  }
  if (arrowClock.isClicked())
  {
    turnClock = true;
  }
  if (arrowCounter.isClicked())
  {
    turnCounter = true;
  }
  if (donezo.isClicked())
  {
    if (characterTemp == 0)
    {
      main.setImage(inventoryBack2);
    }
    if (characterTemp == 2)
    {
      main.setImage(inventoryBack3);
    }
    selected = true;
    lightB.setActive(false);
    medB.setActive(false);
    darkB.setActive(false);
    arrowClock.setActive(false);
    arrowCounter.setActive(false);
    donezo.setActive(false);
  }
}
