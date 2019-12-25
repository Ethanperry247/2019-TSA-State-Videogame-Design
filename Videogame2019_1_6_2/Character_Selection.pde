void characterSelection(int choice)
{

  if (choice==0)
  {
    tony = loadShape("Assets/Character_Models/Tony_Ethn1_Standing.obj");
    for (int i = 0; i < tonyWalk.length; i++)
    {
      if (i%2==0)
      {
        tonyWalk[i] = loadShape("Assets/Character_Models/Tony_Ethn1_Walking1.obj");
      } else
      {
        tonyWalk[i] = loadShape("Assets/Character_Models/Tony_Ethn1_Walking2.obj");
      }
    }
    
    openCutScene = new Movie (this, "OpeningDraft3_light.mp4");
    finalBossCutScene = new Movie (this, "boss_cutscene_light.mp4");
  } else if (choice==1)
  {
    tony = loadShape("Assets/Character_Models/Tony_Ethn2_Standing.obj");
    for (int i = 0; i < tonyWalk.length; i++)
    {
      if (i%2==0)
      {
        tonyWalk[i] = loadShape("Assets/Character_Models/Tony_Ethn2_Walking1.obj");
      } else
      {
        tonyWalk[i] = loadShape("Assets/Character_Models/Tony_Ethn2_Walking2.obj");
      }
    }
    
    openCutScene = new Movie (this, "OpeningDraft3_med.mp4");
    finalBossCutScene = new Movie (this, "boss_cutscene_med.mp4");
  } else if (choice==2)
  {
    tony = loadShape("Assets/Character_Models/Tony_Ethn3_Standing.obj");
    for (int i = 0; i < tonyWalk.length; i++)
    {
      if (i%2==0)
      {
        tonyWalk[i] = loadShape("Assets/Character_Models/Tony_Ethn3_Walking1.obj");
      } else
      {
        tonyWalk[i] = loadShape("Assets/Character_Models/Tony_Ethn3_Walking2.obj");
      }
    }
    
    openCutScene = new Movie (this, "OpeningDraft3_dark.mp4");
    finalBossCutScene = new Movie (this, "boss_cutscene_dark.mp4");
  } else if (choice==4)
  {
    tony = loadShape("Assets/Enemy_Models/TSA_Officer_Standing.obj");
    for (int i = 0; i < tonyWalk.length; i++)
    {
      if (i%2==0)
      {
        tonyWalk[i] = loadShape("Assets/Enemy_Models/TSA_Officer_Walking1.obj");
      } else
      {
        tonyWalk[i] = loadShape("Assets/Enemy_Models/TSA_Officer_Walking2.obj");
      }
    }
  } else if (choice==5)
  {
    tony = loadShape("Assets/Enemy_Models/crane.obj");
    for (int i = 0; i < tonyWalk.length; i++)
    {
      if (i%2==0)
      {
        tonyWalk[i] = loadShape("Assets/Enemy_Models/crane.obj");
      } else
      {
        tonyWalk[i] = loadShape("Assets/Enemy_Models/crane.obj");
      }
    }
  }
}
