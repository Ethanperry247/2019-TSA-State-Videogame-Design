//This method positions the model

void model()
{
  //tony.disableStyle();
  for (int i = 0; i < tonyWalk.length; i++)
  {
    //tonyWalk[i].disableStyle();
  }
  //print(tony.getChildCount() + "\n");
  if (check==1)
  {
    for (int i = 0; i < tony.getChildCount(); i++)
    {
      PShape child = tony.getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, (vert.z*sin(PI/2)+vert.x*cos(PI/2))*0.7, -vert.y*0.7, (vert.z*cos(PI/2)-vert.x*sin(PI/2))*0.7);
      }
    }
    for (int i = 0; i < tonyWalk[0].getChildCount(); i++)
    {
      PShape child = tonyWalk[0].getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, (vert.z*sin(PI/2)+vert.x*cos(PI/2))*0.7, -vert.y*0.7, (vert.z*cos(PI/2)-vert.x*sin(PI/2))*0.7);
      }
    }
    for (int i = 0; i < tonyWalk[1].getChildCount(); i++)
    {
      PShape child = tonyWalk[1].getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, (vert.z*sin(PI/2)+vert.x*cos(PI/2))*0.7, -vert.y*0.7, (vert.z*cos(PI/2)-vert.x*sin(PI/2))*0.7);
      }
    }
    for (int i = 0; i < tonyWalk[2].getChildCount(); i++)
    {
      PShape child = tonyWalk[2].getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, (vert.z*sin(3*PI/4)+vert.x*cos(3*PI/4))*0.7, -vert.y*0.7, (vert.z*cos(3*PI/4)-vert.x*sin(3*PI/4))*0.7);
      }
    }
    for (int i = 0; i < tonyWalk[3].getChildCount(); i++)
    {
      PShape child = tonyWalk[3].getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, (vert.z*sin(3*PI/4)+vert.x*cos(3*PI/4))*0.7, -vert.y*0.7, (vert.z*cos(3*PI/4)-vert.x*sin(3*PI/4))*0.7);
      }
    }
    for (int i = 0; i < tonyWalk[4].getChildCount(); i++)
    {
      PShape child = tonyWalk[4].getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, (vert.z*sin(PI)+vert.x*cos(PI))*0.7, -vert.y*0.7, (vert.z*cos(PI)-vert.x*sin(PI))*0.7);
      }
    }
    for (int i = 0; i < tonyWalk[5].getChildCount(); i++)
    {
      PShape child = tonyWalk[5].getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, (vert.z*sin(PI)+vert.x*cos(PI))*0.7, -vert.y*0.7, (vert.z*cos(PI)-vert.x*sin(PI))*0.7);
      }
    }
    for (int i = 0; i < tonyWalk[6].getChildCount(); i++)
    {
      PShape child = tonyWalk[6].getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, (vert.z*sin(5*PI/4)+vert.x*cos(5*PI/4))*0.7, -vert.y*0.7, (vert.z*cos(5*PI/4)-vert.x*sin(5*PI/4))*0.7);
      }
    }
    for (int i = 0; i < tonyWalk[7].getChildCount(); i++)
    {
      PShape child = tonyWalk[7].getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, (vert.z*sin(5*PI/4)+vert.x*cos(5*PI/4))*0.7, -vert.y*0.7, (vert.z*cos(5*PI/4)-vert.x*sin(5*PI/4))*0.7);
      }
    }
    for (int i = 0; i < tonyWalk[8].getChildCount(); i++)
    {
      PShape child = tonyWalk[8].getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, (vert.z*sin(6*PI/4)+vert.x*cos(6*PI/4))*0.7, -vert.y*0.7, (vert.z*cos(6*PI/4)-vert.x*sin(6*PI/4))*0.7);
      }
    }
    for (int i = 0; i < tonyWalk[9].getChildCount(); i++)
    {
      PShape child = tonyWalk[9].getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, (vert.z*sin(6*PI/4)+vert.x*cos(6*PI/4))*0.7, -vert.y*0.7, (vert.z*cos(6*PI/4)-vert.x*sin(6*PI/4))*0.7);
      }
    }
    for (int i = 0; i < tonyWalk[10].getChildCount(); i++)
    {
      PShape child = tonyWalk[10].getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, (vert.z*sin(7*PI/4)+vert.x*cos(7*PI/4))*0.7, -vert.y*0.7, (vert.z*cos(7*PI/4)-vert.x*sin(7*PI/4))*0.7);
      }
    }
    for (int i = 0; i < tonyWalk[11].getChildCount(); i++)
    {
      PShape child = tonyWalk[11].getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, (vert.z*sin(7*PI/4)+vert.x*cos(7*PI/4))*0.7, -vert.y*0.7, (vert.z*cos(7*PI/4)-vert.x*sin(7*PI/4))*0.7);
      }
    }
    for (int i = 0; i < tonyWalk[12].getChildCount(); i++)
    {
      PShape child = tonyWalk[12].getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, (vert.z*sin(8*PI/4)+vert.x*cos(8*PI/4))*0.7, -vert.y*0.7, (vert.z*cos(8*PI/4)-vert.x*sin(8*PI/4))*0.7);
      }
    }
    for (int i = 0; i < tonyWalk[13].getChildCount(); i++)
    {
      PShape child = tonyWalk[13].getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, (vert.z*sin(8*PI/4)+vert.x*cos(8*PI/4))*0.7, -vert.y*0.7, (vert.z*cos(8*PI/4)-vert.x*sin(8*PI/4))*0.7);
      }
    }
    for (int i = 0; i < tonyWalk[14].getChildCount(); i++)
    {
      PShape child = tonyWalk[14].getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, (vert.z*sin(1*PI/4)+vert.x*cos(1*PI/4))*0.7, -vert.y*0.7, (vert.z*cos(1*PI/4)-vert.x*sin(1*PI/4))*0.7);
      }
    }
    for (int i = 0; i < tonyWalk[15].getChildCount(); i++)
    {
      PShape child = tonyWalk[15].getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, (vert.z*sin(1*PI/4)+vert.x*cos(1*PI/4))*0.7, -vert.y*0.7, (vert.z*cos(1*PI/4)-vert.x*sin(1*PI/4))*0.7);
      }
    }
    for (int i = 0; i < tony.getChildCount(); i++)
    {
      PShape child = tony.getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        child.setVertex(j, vert.x, vert.y - 2, vert.z);
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
          child.setVertex(j, vert.x, vert.y - 2, vert.z);
        }
      }
    }
  }

  check++;
  //Testing
  for (int i = 0; i < tony.getChildCount(); i++)
  {
    PShape child = tony.getChild(i);
    for (int j = 0; j < child.getVertexCount(); j++)
    {
      PVector vert = child.getVertex(j);
      //Y-Axis Rotation
      //child.setVertex(j, vert.z*sin(PI/360)+vert.x*cos(PI/360), vert.y, vert.z*cos(PI/360)-vert.x*sin(PI/360));

      PVector vert1 = child.getVertex(j);
      //Z-Axis Rotation
      //child.setVertex(j, vert1.x*cos(PI/360)-vert1.y*sin(PI/360), vert1.x*sin(PI/360)+vert1.y*cos(PI/360), vert1.z);

      PVector vert2 = child.getVertex(j);
      //X-Axis Rotation
      //child.setVertex(j, vert2.x, vert2.y*cos(PI/360)-vert2.z*sin(PI/360), vert2.y*sin(PI/360)+vert2.z*cos(PI/360));
    }
  }
  //print(tony.getChild(1).getVertex(1) + "\n");


  

  
}
