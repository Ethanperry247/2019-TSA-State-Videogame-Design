//In this method: collision is called from render; it works with an interacting player and setting collision

void collision(PShape render)
{
  boolean collide = false;
  /*
  print(modelX(1,1,1) + " ");
   print(modelY(1,1,1) + " ");
   print(modelZ(1,1,1) + "\n");
   */

  /*
  for (int k = 0; k < tonyWalk.length; k++)
   {
   for (int i = 0; i < tonyWalk[k].getChildCount(); i++)
   {
   PShape child = tonyWalk[k].getChild(i);
   for (int j = 0; j < child.getVertexCount(); j++)
   {
   PVector vert = child.getVertex(j);
   }
   }
   }  
   */
  boolean temporary = false;
  for (int i = 0; i < render.getChildCount(); i++)
  {
    PShape child = render.getChild(i);
    //float childX = 0;
    //float childY = 0;
    //float childZ = 0;
    
    for (int m = 0; m < child.getVertexCount(); m++)
    {
      PVector vert = child.getVertex(m);
      if (vert.y > (yBoxPos - 10) && vert.y < (yBoxPos + 10))
      {
        if (vert.z > (zBoxPos - 6) && vert.z < (zBoxPos + 6))
        {
          if (vert.x > (xBoxPos - 6) && vert.x < (xBoxPos + 6))
          {
            collide = true;
            //AABB(true);
          }
        }
      }
      if (vert.z > (zBoxPos - 5) && vert.z < (zBoxPos + 5))
        {
          if (vert.x > (xBoxPos - 5) && vert.x < (xBoxPos + 5))
          {
            temporary = true;
          }
        }
        
        if (level == 1)
        {
          if (xBoxPos > -30 && xBoxPos < 193 && zBoxPos > 12 && zBoxPos < 14)
          {
           collide = true; 
          }
          if (xBoxPos > 187 && xBoxPos < 193 && zBoxPos > -163 && zBoxPos < 12)
          {
           collide = true; 
          }
          if (xBoxPos > 187 && xBoxPos < 232 && zBoxPos > -165 && zBoxPos < -163)
          {
           collide = true; 
          }
          if (xBoxPos > 232 && xBoxPos < 234 && zBoxPos > -208 && zBoxPos < -163)
          {
           collide = true; 
          }
          if (xBoxPos > 232 && xBoxPos < 275 && zBoxPos > -208 && zBoxPos < -206)
          {
           collide = true; 
          }
          if (xBoxPos > 275 && xBoxPos < 277 && zBoxPos > -250 && zBoxPos < -208)
          {
           collide = true; 
          }
        }
        if (level == 2)
        {
          if (xBoxPos > -45 && xBoxPos < 39 && zBoxPos > 38 && zBoxPos < 40)
          {
           collide = true; 
          }
          if (xBoxPos > 39 && xBoxPos < 41 && zBoxPos > 8 && zBoxPos < 38)
          {
           collide = true; 
          }
          if (xBoxPos > 39 && xBoxPos < 130 && zBoxPos > 8 && zBoxPos < 10)
          {
           collide = true; 
          }
          if (xBoxPos > 39 && xBoxPos < 41 && zBoxPos > -49 && zBoxPos < -21)
          {
           collide = true; 
          }
          if (xBoxPos > 130 && xBoxPos < 578 && zBoxPos > 218 && zBoxPos < 220)
          {
           collide = true; 
          }
          if (xBoxPos > 578 && xBoxPos < 580 && zBoxPos > -170 && zBoxPos < 218)
          {
           collide = true; 
          }
          if (xBoxPos > 578 && xBoxPos < 580 && zBoxPos > -230 && zBoxPos < -202)
          {
           collide = true; 
          }
          if (xBoxPos > 578 && xBoxPos < 669 && zBoxPos > -172 && zBoxPos < -170)
          {
           collide = true; 
          }
          if (xBoxPos > 669 && xBoxPos < 671 && zBoxPos > -170 && zBoxPos < -141)
          {
           collide = true; 
          }
          if (xBoxPos > 669 && xBoxPos < 758 && zBoxPos > -141 && zBoxPos < -139)
          {
           collide = true; 
          }
          if (xBoxPos > 758 && xBoxPos < 760 && zBoxPos > -282 && zBoxPos < -141)
          {
           collide = true; 
          }
        }
        if (level == 3)
        {
          if (xBoxPos > -49 && xBoxPos < 32 && zBoxPos > 10 && zBoxPos < 12)
          {
           collide = true; 
          }
          if (xBoxPos > 71 && xBoxPos < 73 && zBoxPos > -28 && zBoxPos < 92)
          {
           collide = true; 
          }
          if (xBoxPos > 32 && xBoxPos < 310 && zBoxPos > 130 && zBoxPos < 132)
          {
           collide = true; 
          }
          if (xBoxPos > 310 && xBoxPos < 312 && zBoxPos > -110 && zBoxPos < 132)
          {
           collide = true; 
          }
          if (xBoxPos > 150 && xBoxPos < 270 && zBoxPos > 10 && zBoxPos < 12)
          {
           collide = true; 
          }
          if (xBoxPos > 310 && xBoxPos < 430 && zBoxPos > -110 && zBoxPos < -108)
          {
           collide = true; 
          }
          if (xBoxPos > 470 && xBoxPos < 472 && zBoxPos > -270 && zBoxPos < -30)
          {
           collide = true; 
          }
          if (xBoxPos > 430 && xBoxPos < 670 && zBoxPos > 10 && zBoxPos < 12)
          {
           collide = true; 
          }
          if (xBoxPos > 670 && xBoxPos < 672 && zBoxPos > -70 && zBoxPos < 10)
          {
           collide = true; 
          }
        }
        
      /*
      boolean temporary = false;
      if ((vert.z > (zBoxPos - 6) && vert.z < (zBoxPos + 6)))
      {
        if ((vert.x > (xBoxPos - 6) && vert.x < (xBoxPos + 6)))
        {
          temporary = true;
        }
      }
      
      if (temporary)
      {
        print ("true + + + ");
      }
      else if (!temporary) { print ("false + + +"); }
      else print ("IDONKNOW");
      //print ("Vert Z: " + vert.z + ", ZPos: " + zBoxPos + "Vert X: " + vert.x + ", XPos: " + xBoxPos + "\n");
      
      //childX = childX + vert.x;
      //childY = childY + vert.y;
      //childZ = childZ + vert.z;
      /*
      if (collide == true)
      {
        //lHallChild.setFill(color(255, 0, 0));
      } //else lHallChild.setFill(color(255, 255, 255));

      //collide = false;
      */
    }
    
    //COLLISION AVERAGE SYSTEM
    /*
    childX = childX/lHallChild.getVertexCount();
    childY = childY/lHallChild.getVertexCount();
    childZ = childZ/lHallChild.getVertexCount();
    if (childY > (yBoxPos - 10) && childY < (yBoxPos + 10) || (childY + 1) > (yBoxPos - 10) && (childY + 1) < (yBoxPos + 10))
      {
        if (childZ > (zBoxPos - 4) && childZ < (zBoxPos + 4) || (childZ + 1) > (zBoxPos - 4) && (childZ + 1) < (zBoxPos + 4) || (childZ - 1) > (zBoxPos - 4) && (childZ - 1) < (zBoxPos + 4))
        {
          if (childX > (xBoxPos - 4) && childX < (xBoxPos + 4) || (childX + 1) > (xBoxPos - 4) && (childX + 1) < (xBoxPos + 4) || (childX - 1) > (xBoxPos - 4) && (childX - 1) < (xBoxPos + 4))
          {
            collide = true;
            //AABB(true);
          }
        }
      }
      */
  }
  //print (temporary);
  //print (xBoxPos + " " + zBoxPos + "\n");
  if (!temporary)
  {
   //collide = true; 
  }
  
  if (level == 0)
  {
   collide = true; 
  }
  AABB(collide);
}

void AABB(boolean collide)
{
  pushMatrix();
  if (collide == true)
  {
    stroke(255, 0, 0);
  }
  noFill();
  translate(xBoxPos, yBoxPos, zBoxPos);
  //box(8, 20, 8);
  popMatrix();

  if (collide == true)
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
  }
    else if (isDown && isRight)
  {
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
    camX = camX - 0.5;
    battleZoneRed.translate(-0.5, 0, 0);
    battleZoneRingRed.translate(-0.5, 0, 0);
  } else if (isUp && isRight)
  {
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
    camY = camY + 0.5;
    battleZoneRed.translate(0, 0, 0.5);
    battleZoneRingRed.translate(0, 0, 0.5);
  } else if (isUp && isLeft)
  {
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
    camX = camX + 0.5;
    battleZoneRed.translate(0.5, 0, 0);
    battleZoneRingRed.translate(0.5, 0, 0);
  } else if (isDown && isLeft)
  {
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
    camY = camY - 0.5;
    battleZoneRed.translate(0, 0, -0.5);
    battleZoneRingRed.translate(0, 0, -0.5);
  } else if (isUp)
  {
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
    camX = camX + 0.35;
    camY = camY + 0.35;
    battleZoneRed.translate(0.35, 0, 0.35);
    battleZoneRingRed.translate(0.35, 0, 0.35);
  } else if (isRight)
  {
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
    camX = camX - 0.35;
    camY = camY + 0.35;
    battleZoneRed.translate(-0.35, 0, 0.35);
    battleZoneRingRed.translate(-0.35, 0, 0.35);
  } else if (isLeft)
  {
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
    camX = camX + 0.35;
    camY = camY - 0.35;
    battleZoneRed.translate(0.35, 0, -0.35);
    battleZoneRingRed.translate(0.35, 0, -0.35);
  } else if (isDown)
  {
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
    camX = camX - 0.35;
    camY = camY - 0.35;
    battleZoneRed.translate(-0.35, 0, -0.35);
    battleZoneRingRed.translate(-0.35, -0, -0.35);
  }
  }
}

//Second Bouding Box
