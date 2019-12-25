//In this method: this code is what's responsible for the movement of the player model(s) (not the enemies); it also does a simple player movement animation.

void movement()
{
  if (isDown && isRight && isLeft && isUp)
  { 
    shape(tony);
  } else if (isDown && isRight && isLeft)
  { 
    shape(tony);
  } else if (isDown && isRight && isUp)
  { 
    shape(tony);
  } else if (isDown && isUp && isLeft)
  { 
    shape(tony);
  } else if (isUp && isRight && isLeft)
  { 
    shape(tony);
  } else if (isDown && isRight)
  {
    movement1();
    for (int i = 0; i < tony.getChildCount(); i++)
    {
      PShape child = tony.getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, vert.x + 0.5, vert.y, vert.z);
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
          child.setVertex(j, vert.x + 0.5, vert.y, vert.z);
        }
      }
    }
    xBoxPos = xBoxPos + 0.5;
    battleZoneRed.translate(0.5, 0, 0);
    battleZoneRingRed.translate(0.5, 0, 0);
  } else if (isUp && isRight)
  {
    movement3();
    for (int i = 0; i < tony.getChildCount(); i++)
    {
      PShape child = tony.getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, vert.x, vert.y, vert.z - 0.5);
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
          child.setVertex(j, vert.x, vert.y, vert.z - 0.5);
        }
      }
    }
    zBoxPos = zBoxPos - 0.5;
    battleZoneRed.translate(0, 0, -0.5);
    battleZoneRingRed.translate(0, 0, -0.5);
  } else if (isUp && isLeft)
  {
    movement5();
    for (int i = 0; i < tony.getChildCount(); i++)
    {
      PShape child = tony.getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, vert.x - 0.5, vert.y, vert.z);
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
          child.setVertex(j, vert.x - 0.5, vert.y, vert.z);
        }
      }
    }
    xBoxPos = xBoxPos - 0.5;
    battleZoneRed.translate(-0.5, 0);
    battleZoneRingRed.translate(-0.5, 0);
  } else if (isDown && isLeft)
  {
    movement7();
    for (int i = 0; i < tony.getChildCount(); i++)
    {
      PShape child = tony.getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, vert.x, vert.y, vert.z + 0.5);
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
          child.setVertex(j, vert.x, vert.y, vert.z + 0.5);
        }
      }
    }
    zBoxPos = zBoxPos + 0.5;
    battleZoneRed.translate(0, 0, 0.5);
    battleZoneRingRed.translate(0, 0, 0.5);
  } else if (isUp)
  {
    movement4();
    for (int i = 0; i < tony.getChildCount(); i++)
    {
      PShape child = tony.getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, vert.x - 0.35, vert.y, vert.z - 0.35);
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
          child.setVertex(j, vert.x - 0.35, vert.y, vert.z - 0.35);
        }
      }
    }
    xBoxPos = xBoxPos - 0.35;
    zBoxPos = zBoxPos - 0.35;
    battleZoneRed.translate(-0.35, 0, -0.35);
    battleZoneRingRed.translate(-0.35, 0, -0.35);
  } else if (isRight)
  {
    movement2();
    for (int i = 0; i < tony.getChildCount(); i++)
    {
      PShape child = tony.getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, vert.x + 0.35, vert.y, vert.z - 0.35);
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
          child.setVertex(j, vert.x + 0.35, vert.y, vert.z - 0.35);
        }
      }
    }
    xBoxPos = xBoxPos + 0.35;
    zBoxPos = zBoxPos - 0.35;
    battleZoneRed.translate(0.35, 0, -0.35);
    battleZoneRingRed.translate(0.35, 0, -0.35);
  } else if (isLeft)
  {
    movement6();
    for (int i = 0; i < tony.getChildCount(); i++)
    {
      PShape child = tony.getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, vert.x - 0.35, vert.y, vert.z + 0.35);
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
          child.setVertex(j, vert.x - 0.35, vert.y, vert.z + 0.35);
        }
      }
    }
    xBoxPos = xBoxPos - 0.35;
    zBoxPos = zBoxPos + 0.35;
    battleZoneRed.translate(-0.35, 0, 0.35);
    battleZoneRingRed.translate(-0.35, 0, 0.35);
  } else if (isDown)
  {
    movement8();
    for (int i = 0; i < tony.getChildCount(); i++)
    {
      PShape child = tony.getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, vert.x + 0.35, vert.y, vert.z + 0.35);
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
          child.setVertex(j, vert.x + 0.35, vert.y, vert.z + 0.35);
        }
      }
    }
    xBoxPos = xBoxPos + 0.35;
    zBoxPos = zBoxPos + 0.35;
    battleZoneRed.translate(0.35, 0, 0.35);
    battleZoneRingRed.translate(0.35, 0, 0.35);
  } else shape(tony);
}

void movement1()
{
  if (tonyI < 20 && tonyBool == true)
  {
    shape(tonyWalk[0]);
    tonyI++;
  } else if (tonyI == 20 && tonyBool)
  {
    shape(tonyWalk[0]);
    tonyBool = false;
  } else if (tonyI <= 20 && tonyI > 1 && tonyBool == false)
  {
    tonyI--; 
    shape(tonyWalk[1]);
  } else if (tonyI == 1 && tonyBool == false)
  {
    tonyBool = true; 
    shape(tonyWalk[1]);
  }
}

void movement2()
{
  if (tonyI < 20 && tonyBool == true)
  {
    shape(tonyWalk[2]);
    tonyI++;
  } else if (tonyI == 20 && tonyBool)
  {
    shape(tonyWalk[2]);
    tonyBool = false;
  } else if (tonyI <= 20 && tonyI > 1 && tonyBool == false)
  {
    tonyI--; 
    shape(tonyWalk[3]);
  } else if (tonyI == 1 && tonyBool == false)
  {
    tonyBool = true; 
    shape(tonyWalk[3]);
  }
}

void movement3()
{
  if (tonyI < 20 && tonyBool == true)
  {
    shape(tonyWalk[4]);
    tonyI++;
  } else if (tonyI == 20 && tonyBool)
  {
    shape(tonyWalk[4]);
    tonyBool = false;
  } else if (tonyI <= 20 && tonyI > 1 && tonyBool == false)
  {
    tonyI--; 
    shape(tonyWalk[5]);
  } else if (tonyI == 1 && tonyBool == false)
  {
    tonyBool = true; 
    shape(tonyWalk[5]);
  }
}

void movement4()
{
  if (tonyI < 20 && tonyBool == true)
  {
    shape(tonyWalk[6]);
    tonyI++;
  } else if (tonyI == 20 && tonyBool)
  {
    shape(tonyWalk[6]);
    tonyBool = false;
  } else if (tonyI <= 20 && tonyI > 1 && tonyBool == false)
  {
    tonyI--; 
    shape(tonyWalk[7]);
  } else if (tonyI == 1 && tonyBool == false)
  {
    tonyBool = true; 
    shape(tonyWalk[7]);
  }
}

void movement5()
{
  if (tonyI < 20 && tonyBool == true)
  {
    shape(tonyWalk[8]);
    tonyI++;
  } else if (tonyI == 20 && tonyBool)
  {
    shape(tonyWalk[8]);
    tonyBool = false;
  } else if (tonyI <= 20 && tonyI > 1 && tonyBool == false)
  {
    tonyI--; 
    shape(tonyWalk[9]);
  } else if (tonyI == 1 && tonyBool == false)
  {
    tonyBool = true; 
    shape(tonyWalk[9]);
  }
}

void movement6()
{
  if (tonyI < 20 && tonyBool == true)
  {
    shape(tonyWalk[10]);
    tonyI++;
  } else if (tonyI == 20 && tonyBool)
  {
    shape(tonyWalk[10]);
    tonyBool = false;
  } else if (tonyI <= 20 && tonyI > 1 && tonyBool == false)
  {
    tonyI--; 
    shape(tonyWalk[11]);
  } else if (tonyI == 1 && tonyBool == false)
  {
    tonyBool = true; 
    shape(tonyWalk[11]);
  }
}

void movement7()
{
  if (tonyI < 20 && tonyBool == true)
  {
    shape(tonyWalk[12]);
    tonyI++;
  } else if (tonyI == 20 && tonyBool)
  {
    shape(tonyWalk[12]);
    tonyBool = false;
  } else if (tonyI <= 20 && tonyI > 1 && tonyBool == false)
  {
    tonyI--; 
    shape(tonyWalk[13]);
  } else if (tonyI == 1 && tonyBool == false)
  {
    tonyBool = true; 
    shape(tonyWalk[13]);
  }
}

void movement8()
{
  if (tonyI < 20 && tonyBool == true)
  {
    shape(tonyWalk[14]);
    tonyI++;
  } else if (tonyI == 20 && tonyBool)
  {
    shape(tonyWalk[14]);
    tonyBool = false;
  } else if (tonyI <= 20 && tonyI > 1 && tonyBool == false)
  {
    tonyI--; 
    shape(tonyWalk[15]);
  } else if (tonyI == 1 && tonyBool == false)
  {
    tonyBool = true; 
    shape(tonyWalk[15]);
  }
}

void moveModel(PShape shape, float x, float y, float z)
{
  for (int i = 0; i < shape.getChildCount(); i++)
  {
    PShape child = shape.getChild(i);
    for (int j = 0; j < child.getVertexCount(); j++)
    {
      PVector vert = child.getVertex(j);
      child.setVertex(j, vert.x + x, vert.y + y, vert.z + z);
    }
  }
}
