void startScreen() //added in 7.0
{
  
  if (playingMov)
  {
    intro.play();
      timer=intro.duration()-0.1; 
      //Cutscene termination
      if (intro.time() >= timer) 
      {
        intro.stop();
        playingMov = false;
      }
      screenI.beginDraw();
      screenI.image(intro, 0, 0);
      screenI.endDraw();
  }
  
  if (!playingMov)
  {
    screenI.beginDraw();
    startButton.setActive(true);
    screenI.image(background,0,0,1280,720);
    startButton.display();
    
    
    
    
    
    
    
    
    screenI.endDraw();
  }

  image(screenI, 700, 0, 1280, 720);
}

void startScreenInputs()
{
  if (startButton.isClicked())
  {
    startButton.setActive(false);
    title0 = true;
  }
  
}
