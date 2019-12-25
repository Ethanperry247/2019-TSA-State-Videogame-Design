//In this method: this method loads all map pieces and battle zones and repositions them

void Map()
{
  //Battle Zones
  for (int i = 0; i < battleZoneBlue.length; i++)
  {
  battleZoneBlue[i] = loadShape("Assets/Map_Models/battle_zone_blue.obj");
  battleZoneRingBlue[i] = loadShape("Assets/Map_Models/battle_zone_ring_blue.obj");
  battlePiece(battleZoneBlue[i], 0, -50, 0, 1);
  battlePiece(battleZoneRingBlue[i], 0, -50, 0, 1);
  battleZoneBlue[i].rotate(PI);
  battleZoneRingBlue[i].rotate(PI);
  }
  
  battleZoneRed = loadShape("Assets/Map_Models/battle_zone_red.obj");
  battleZoneRingRed = loadShape("Assets/Map_Models/battle_zone_ring_red.obj");
  battlePiece(battleZoneRed, 0, -50, 0, 1);
  battlePiece(battleZoneRingRed, 0, -50, 0, 1);
  battleZoneRed.rotate(PI);
  battleZoneRingRed.rotate(PI);
  
  //Map at 0 - Tony's Bedroom
  map.add(loadShape("Assets/Map_Models/tony_bedroom.obj"));
  if (cut2 == 1)
  {
    float xPos = 0;
    float yPos = 0;
    float zPos = 0;
    float total = 0;
    PVector pos = new PVector(0.0, 0.0, 0.0);
    for (int i = 0; i < map.get(0).getChildCount(); i++)
    {
      PShape child = map.get(0).getChild(i);
      for (int j = 0; j < child.getVertexCount(); j++)
      {
        PVector vert = child.getVertex(j);
        //Y-Axis Rotation
        child.setVertex(j, vert.z*sin(PI)+vert.x*cos(PI), vert.y, vert.z*cos(PI)-vert.x*sin(PI));

        PVector vert1 = child.getVertex(j);
        //Z-Axis Rotation
        child.setVertex(j, vert1.x*cos(PI)-vert1.y*sin(PI), vert1.x*sin(PI)+vert1.y*cos(PI), vert1.z);

        PVector vert2 = child.getVertex(j);
        //X-Axis Rotation
        //child.setVertex(j, vert2.x, vert2.y*cos(PI)-vert2.z*sin(PI), vert2.y*sin(PI)+vert2.z*cos(PI));
        child.setVertex(j, vert2.x - 5, vert2.y, vert2.z*-1 - 5);

        PVector vert3 = child.getVertex(j);
        child.setVertex(j, vert3.x*2, vert3.y*2, vert3.z*2);

        xPos = xPos + vert3.x;
        yPos = yPos + vert3.y;
        zPos = zPos + vert3.z;
        total++;
      }
    }

    //This code sets the location.
    xPos = xPos/total;
    yPos = yPos/total;
    zPos = zPos/total;
    pos.set(xPos, yPos, zPos);
    position.add(pos);
  }


  //Map at 1 - Level One - Entrance
  mapPiece(loadShape("Assets/Map_Models/level_one-0.obj"), -5, -5);

  //Map at 2 - Level One - Hall Piece #1
  mapPiece(loadShape("Assets/Map_Models/level_one-1.obj"), 17, -5);

  //Map at 3 - Level One - Hall Piece #2
  mapPiece(loadShape("Assets/Map_Models/level_one-2.obj"), 39, -5);

  //Map at 4 - Level One - Hall Piece #3
  mapPiece(loadShape("Assets/Map_Models/level_one-3.obj"), 61, -5);

  //Map at 5 - Level One - Hall Piece #4
  mapPiece(loadShape("Assets/Map_Models/level_one-4.obj"), 83, -5);

  //Map at 6 - Level One - Hall Piece #5
  mapPiece(loadShape("Assets/Map_Models/level_one-5.obj"), 83, -27);

  //Map at 7 - Level One - Hall Piece #6
  mapPiece(loadShape("Assets/Map_Models/level_one-6.obj"), 83, -49);

  //Map at 8 - Level One - Hall Piece #7
  mapPiece(loadShape("Assets/Map_Models/level_one-7.obj"), 83, -71);

  //Map at 9 - Level One - Hall Piece #8
  mapPiece(loadShape("Assets/Map_Models/level_one-8.obj"), 83, -93);

  //Map at 10 - Level One - Hall Piece #9
  mapPiece(loadShape("Assets/Map_Models/level_one-9.obj"), 83, -115);

  //Map at 11 - Level One - Hall Piece #10
  mapPiece(loadShape("Assets/Map_Models/level_one-10.obj"), 105, -93);

  //Map at 12 - Level One - Hall Piece #11
  mapPiece(loadShape("Assets/Map_Models/level_one-11.obj"), 105, -115);

  //Map at 13 - Level One - Exit
  mapPiece(loadShape("Assets/Map_Models/level_one-12.obj"), 127, -115.5);

  //Map at 14 - Level Maze - Entrance - Battle Zone #2
  mapPiece(loadShape("Assets/Map_Models/level_maze-0.obj"), -5, -5, 1.5);

  //Map at 15 - Level Maze - Foyer
  mapPiece(loadShape("Assets/Map_Models/level_maze-1.obj"), 55.5, -5, 1.5);

  //Map at 16 - Level Maze - Piece #1
  mapPiece(loadShape("Assets/Map_Models/level_maze-2.obj"), 115.5, 115, 1.5);

  //Map at 17 - Level Maze - Piece #2
  mapPiece(loadShape("Assets/Map_Models/level_maze-3.obj"), 115.5, 55, 1.5);

  //Map at 18 - Level Maze - Piece #3
  mapPiece(loadShape("Assets/Map_Models/level_maze-4.obj"), 115.5, -5, 1.5);

  //Map at 19 - Level Maze - Piece #4
  mapPiece(loadShape("Assets/Map_Models/level_maze-5.obj"), 115.5, -65, 1.5);

  //Map at 20 - Level Maze - Piece #5
  mapPiece(loadShape("Assets/Map_Models/level_maze-6.obj"), 115.5, -125, 1.5);

  //Map at 21 - Level Maze - Piece #6
  mapPiece(loadShape("Assets/Map_Models/level_maze-7.obj"), 175.5, 115, 1.5);

  //Map at 22 - Level Maze - Piece #7
  mapPiece(loadShape("Assets/Map_Models/level_maze-8.obj"), 175.5, 55, 1.5);

  //Map at 23 - Level Maze - Piece #8
  mapPiece(loadShape("Assets/Map_Models/level_maze-9.obj"), 175.5, -5, 1.5);

  //Map at 24 - Level Maze - Piece #9
  mapPiece(loadShape("Assets/Map_Models/level_maze-10.obj"), 175.5, -65, 1.5);

  //Map at 25 - Level Maze - Piece #10
  mapPiece(loadShape("Assets/Map_Models/level_maze-11.obj"), 175.5, -125, 1.5);
  
  //Map at 26 - Level Maze - Piece #11
  mapPiece(loadShape("Assets/Map_Models/level_maze-12.obj"), 235.5, 115, 1.5);

  //Map at 27 - Level Maze - Piece #12
  mapPiece(loadShape("Assets/Map_Models/level_maze-13.obj"), 235.5, 55, 1.5);

  //Map at 28 - Level Maze - Piece #13
  mapPiece(loadShape("Assets/Map_Models/level_maze-14.obj"), 235.5, -5, 1.5);

  //Map at 29 - Level Maze - Piece #14
  mapPiece(loadShape("Assets/Map_Models/level_maze-15.obj"), 235.5, -65, 1.5);

  //Map at 30 - Level Maze - Piece #15
  mapPiece(loadShape("Assets/Map_Models/level_maze-16.obj"), 235.5, -125, 1.5);
  
  //Map at 31 - Level Maze - Piece #16
  mapPiece(loadShape("Assets/Map_Models/level_maze-17.obj"), 295.5, 115, 1.5);

  //Map at 32 - Level Maze - Piece #17
  mapPiece(loadShape("Assets/Map_Models/level_maze-18.obj"), 295.5, 55, 1.5);

  //Map at 33 - Level Maze - Piece #18
  mapPiece(loadShape("Assets/Map_Models/level_maze-19.obj"), 295.5, -5, 1.5);

  //Map at 34 - Level Maze - Piece #19
  mapPiece(loadShape("Assets/Map_Models/level_maze-20.obj"), 295.5, -65, 1.5);

  //Map at 35 - Level Maze - Piece #20
  mapPiece(loadShape("Assets/Map_Models/level_maze-21.obj"), 295.5, -125, 1.5);
  
  //Map at 36 - Level Maze - Piece #21
  mapPiece(loadShape("Assets/Map_Models/level_maze-22.obj"), 355.5, 115, 1.5);

  //Map at 37 - Level Maze - Piece #22
  mapPiece(loadShape("Assets/Map_Models/level_maze-23.obj"), 355, 55, 1.5); //This block could use an additional fix

  //Map at 38 - Level Maze - Piece #23
  mapPiece(loadShape("Assets/Map_Models/level_maze-24.obj"), 355.5, -5, 1.5);

  //Map at 39 - Level Maze - Piece #24
  mapPiece(loadShape("Assets/Map_Models/level_maze-25.obj"), 355.5, -65, 1.5);

  //Map at 40 - Level Maze - Piece #25
  mapPiece(loadShape("Assets/Map_Models/level_maze-26.obj"), 355.5, -125, 1.5);

  //Map at 41 - Level Maze - Exit Hallway
  mapPiece(loadShape("Assets/Map_Models/level_maze-27.obj"), 415.5, -125, 1.5);

  //Map at 42 - Level Maze - Exit - Battle Zone #3
  mapPiece(loadShape("Assets/Map_Models/level_maze-28.obj"), 475.5, -125, 1.5);
  
  //Map at 43 - Level Three - Entrance
  mapPiece(loadShape("Assets/Map_Models/level_three-0.obj"), -5, -5.5, 1.5, 2);
  
  //Map at 44 - Level Three - Entrance
  mapPiece(loadShape("Assets/Map_Models/level_three-1.obj"), 35, 45, 1.5, 2);
  
  //Map at 45 - Level Three - Entrance
  mapPiece(loadShape("Assets/Map_Models/level_three-2.obj"), 25, 5, 1.5, 2);
  
  //Map at 46 - Level Three - Entrance
  mapPiece(loadShape("Assets/Map_Models/level_three-3.obj"), 75, 55, 1.5, 2);
  
  //Map at 47 - Level Three - Entrance
  mapPiece(loadShape("Assets/Map_Models/level_three-4.obj"), 85, -5, 1.5, 2);
  
  //Map at 48 - Level Three - Entrance
  mapPiece(loadShape("Assets/Map_Models/level_three-5.obj"), 115, 55, 1.5, 2);
  
  //Map at 49 - Level Three - Entrance
  mapPiece(loadShape("Assets/Map_Models/level_three-6.obj"), 115, -5, 1.5, 2);
  
  //Map at 50 - Level Three - Entrance
  mapPiece(loadShape("Assets/Map_Models/level_three-7.obj"), 145, 45, 1.5, 2);
  
  //Map at 51 - Level Three - Entrance
  mapPiece(loadShape("Assets/Map_Models/level_three-8.obj"), 145, 5, 1.5, 2);
  
  //Map at 52 - Level Three - Entrance
  mapPiece(loadShape("Assets/Map_Models/level_three-9.obj"), 145, -35, 1.5, 2);
  
  //Map at 53 - Level Three - Entrance
  mapPiece(loadShape("Assets/Map_Models/level_three-10.obj"), 155, -65, 1.5, 2);
  
  //Map at 54 - Level Three - Entrance
  mapPiece(loadShape("Assets/Map_Models/level_three-11.obj"), 195, -65, 1.5, 2);
  
  //Map at 55 - Level Three - Entrance
  mapPiece(loadShape("Assets/Map_Models/level_three-12.obj"), 235, -5, 1.5, 2);
  
  //Map at 56 - Level Three - Entrance
  mapPiece(loadShape("Assets/Map_Models/level_three-13.obj"), 225, -35, 1.5, 2);
  
  //Map at 57 - Level Three - Entrance
  mapPiece(loadShape("Assets/Map_Models/level_three-14.obj"), 225, -75, 1.5, 2);
  
  //Map at 58 - Level Three - Entrance
  mapPiece(loadShape("Assets/Map_Models/level_three-15.obj"), 225, -115, 1.5, 2);
  
  //Map at 59 - Level Three - Entrance
  mapPiece(loadShape("Assets/Map_Models/level_three-16.obj"), 275, -5, 1.5, 2);
  
  //Map at 60 - Level Three - Entrance
  mapPiece(loadShape("Assets/Map_Models/level_three-17.obj"), 315, -15, 1.5, 2);

  levelZero = map.get(0); 
  for (int i = 1; i < 14; i++)
  {
    levelOne.add(map.get(i));
  }

  for (int i = 14; i < 43; i++)
  {
    levelTwo.add(map.get(i));
  }
  
  for (int i = 43; i < 61; i++)
  {
    levelThree.add(map.get(i));
  }

  cut2++;
}

void mapPiece(PShape shape, float x, float z)
{
  map.add(shape);
  float xPos = 0;
  float yPos = 0;
  float zPos = 0;
  float total = 0;
  PVector pos = new PVector(0.0, 0.0, 0.0);
  for (int i = 0; i < map.get(map.size()-1).getChildCount(); i++)
  {
    PShape child = map.get(map.size()-1).getChild(i);
    for (int j = 0; j < child.getVertexCount(); j++)
    {
      PVector vert = child.getVertex(j);
      //Y-Axis Rotation
      child.setVertex(j, vert.z*sin(PI)+vert.x*cos(PI), vert.y, vert.z*cos(PI)-vert.x*sin(PI));

      PVector vert1 = child.getVertex(j);
      //Z-Axis Rotation
      child.setVertex(j, vert1.x*cos(PI)-vert1.y*sin(PI), vert1.x*sin(PI)+vert1.y*cos(PI), vert1.z);

      PVector vert2 = child.getVertex(j);
      //X-Axis Rotation
      //child.setVertex(j, vert2.x, vert2.y*cos(PI)-vert2.z*sin(PI), vert2.y*sin(PI)+vert2.z*cos(PI));
      child.setVertex(j, vert2.x + x, vert2.y, vert2.z*-1 + z);

      PVector vert3 = child.getVertex(j);
      child.setVertex(j, vert3.x*2, vert3.y*2, vert3.z*2);

      xPos = xPos + child.getVertex(j).x;
      yPos = yPos + child.getVertex(j).y;
      zPos = zPos + child.getVertex(j).z;
      total++;
    }
  }

  //This code sets the location.
  xPos = xPos/total;
  yPos = yPos/total;
  zPos = zPos/total;
  pos.set(xPos, yPos, zPos);
  position.add(pos);
}

void mapPiece(PShape shape, float x, float z, float r)
{
  map.add(shape);
  float xPos = 0;
  float yPos = 0;
  float zPos = 0;
  float total = 0;
  PVector pos = new PVector(0.0, 0.0, 0.0);
  for (int i = 0; i < map.get(map.size()-1).getChildCount(); i++)
  {
    PShape child = map.get(map.size()-1).getChild(i);
    for (int j = 0; j < child.getVertexCount(); j++)
    {
      PVector vert = child.getVertex(j);
      //Y-Axis Rotation
      child.setVertex(j, vert.z*sin(PI*r)+vert.x*cos(PI*r), vert.y, vert.z*cos(PI*r)-vert.x*sin(PI*r));

      PVector vert1 = child.getVertex(j);
      //Z-Axis Rotation
      child.setVertex(j, vert1.x*cos(PI)-vert1.y*sin(PI), vert1.x*sin(PI)+vert1.y*cos(PI), vert1.z);

      PVector vert2 = child.getVertex(j);
      //X-Axis Rotation
      //child.setVertex(j, vert2.x, vert2.y*cos(PI)-vert2.z*sin(PI), vert2.y*sin(PI)+vert2.z*cos(PI));
      child.setVertex(j, vert2.x + x, vert2.y, vert2.z*-1 + z);

      PVector vert3 = child.getVertex(j);
      child.setVertex(j, vert3.x*1.5, vert3.y*1.5, vert3.z*1.5);

      xPos = xPos + child.getVertex(j).x;
      yPos = yPos + child.getVertex(j).y;
      zPos = zPos + child.getVertex(j).z;
      total++;
    }
  }

  //This code sets the location.
  xPos = xPos/total;
  yPos = yPos/total;
  zPos = zPos/total;
  pos.set(xPos, yPos, zPos);
  position.add(pos);
}

//For level Three Pieces
void mapPiece(PShape shape, float x, float z, float r, float s)
{
  map.add(shape);
  float xPos = 0;
  float yPos = 0;
  float zPos = 0;
  float total = 0;
  PVector pos = new PVector(0.0, 0.0, 0.0);
  for (int i = 0; i < map.get(map.size()-1).getChildCount(); i++)
  {
    PShape child = map.get(map.size()-1).getChild(i);
    for (int j = 0; j < child.getVertexCount(); j++)
    {
      PVector vert = child.getVertex(j);
      //Y-Axis Rotation
      child.setVertex(j, vert.z*sin(PI*r)+vert.x*cos(PI*r), vert.y, vert.z*cos(PI*r)-vert.x*sin(PI*r));

      PVector vert1 = child.getVertex(j);
      //Z-Axis Rotation
      child.setVertex(j, vert1.x*cos(PI)-vert1.y*sin(PI), vert1.x*sin(PI)+vert1.y*cos(PI), vert1.z);

      PVector vert2 = child.getVertex(j);
      //X-Axis Rotation
      //child.setVertex(j, vert2.x, vert2.y*cos(PI)-vert2.z*sin(PI), vert2.y*sin(PI)+vert2.z*cos(PI));
      child.setVertex(j, vert2.x + x, vert2.y, vert2.z*-1 + z);

      PVector vert3 = child.getVertex(j);
      child.setVertex(j, vert3.x*s, vert3.y*s, vert3.z*s);

      xPos = xPos + child.getVertex(j).x;
      yPos = yPos + child.getVertex(j).y;
      zPos = zPos + child.getVertex(j).z;
      total++;
    }
  }

  //This code sets the location.
  xPos = xPos/total;
  yPos = yPos/total;
  zPos = zPos/total;
  pos.set(xPos, yPos, zPos);
  position.add(pos);
}

void battlePiece(PShape shape, float x, float y, float z, float r)
{
  for (int i = 0; i < shape.getChildCount(); i++)
  {
    PShape child = shape.getChild(i);
    for (int j = 0; j < child.getVertexCount(); j++)
    {
      PVector vert = child.getVertex(j);
      //Y-Axis Rotation
      //child.setVertex(j, vert.z*sin(PI)+vert.x*cos(PI), vert.y, vert.z*cos(PI)-vert.x*sin(PI));

      PVector vert1 = child.getVertex(j);
      //Z-Axis Rotation
      //child.setVertex(j, vert1.x*cos(PI*r)-vert1.y*sin(PI*r), vert1.x*sin(PI*r)+vert1.y*cos(PI*r), vert1.z);

      PVector vert2 = child.getVertex(j);
      //X-Axis Rotation
      //child.setVertex(j, vert2.x, vert2.y*cos(PI)-vert2.z*sin(PI), vert2.y*sin(PI)+vert2.z*cos(PI));
      child.setVertex(j, vert2.x + x, vert2.y + y, vert2.z + z);

      PVector vert3 = child.getVertex(j);
      child.setVertex(j, vert3.x, vert3.y, vert3.z);

    }
  }
}

void battlePiece(PShape shape, float y, float r)
{
  for (int i = 0; i < shape.getChildCount(); i++)
  {
    PShape child = shape.getChild(i);
    for (int j = 0; j < child.getVertexCount(); j++)
    {
      PVector vert = child.getVertex(j);
      //Y-Axis Rotation
      child.setVertex(j, vert.z*sin(r)+vert.x*cos(r), vert.y, vert.z*cos(r)-vert.x*sin(r));

      PVector vert1 = child.getVertex(j);
      //Z-Axis Rotation
      //child.setVertex(j, vert1.x*cos(PI*r)-vert1.y*sin(PI*r), vert1.x*sin(PI*r)+vert1.y*cos(PI*r), vert1.z);

      PVector vert2 = child.getVertex(j);
      //X-Axis Rotation
      //child.setVertex(j, vert2.x, vert2.y*cos(PI)-vert2.z*sin(PI), vert2.y*sin(PI)+vert2.z*cos(PI));
      child.setVertex(j, vert2.x , vert2.y + y, vert2.z );

      PVector vert3 = child.getVertex(j);
      child.setVertex(j, vert3.x, vert3.y, vert3.z);

    }
  }
}





























/*
/Test/Old
 
 //shape(box);
 //box.disableStyle();
 
 //lHallChairs.disableStyle();
 if (cut2 == 1)
 {
 box.translate(-29, -10, 0);
 box.rotate(PI);
 box.scale(1.8);
 for (int i = 0; i < lHallChairs.getChildCount(); i++)
 {
 PShape child = lHallChairs.getChild(i);
 for (int j = 0; j < child.getVertexCount(); j++)
 {
 PVector vert = child.getVertex(j);
 //Y-Axis Rotation
 //child.setVertex(j, vert.z*sin(PI)+vert.x*cos(PI), vert.y, vert.z*cos(PI)-vert.x*sin(PI));
 
 PVector vert1 = child.getVertex(j);
 //Z-Axis Rotation
 child.setVertex(j, vert1.x*cos(PI)-vert1.y*sin(PI), vert1.x*sin(PI)+vert1.y*cos(PI), vert1.z);
 
 PVector vert2 = child.getVertex(j);
 //X-Axis Rotation
 //child.setVertex(j, vert2.x, vert2.y*cos(PI/360)-vert2.z*sin(PI/360), vert2.y*sin(PI/360)+vert2.z*cos(PI/360));
 
 PVector vert3 = child.getVertex(j);
 child.setVertex(j, vert3.x*2, vert3.y*2, vert3.z*2);
 }
 }
 cut2++;
 }
 
 */
