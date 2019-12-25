//In this method: enemies are loaded, set in place, and then displayed based on which level you are in and whether they are dead or not

void enemyModel()
{
  if (enemyCheck == false)
  {
    enemyLocX[0] = 209.7;
    enemyLocZ[0] = -186.1;
    enemyLocX[1] = 54.2;
    enemyLocZ[1] = -6.65;
    enemyLocX[2] = 713.6;
    enemyLocZ[2] = -185.8;
    enemyLocX[3] = 609.851;
    enemyLocZ[3] = -64.0497;
    enemy[0] = loadShape("Assets/Enemy_Models/officerOne.obj");
    loadEnemy(enemy[0], -PI/2, enemyLocX[0], -2, enemyLocZ[0], 0.7);
    battleZoneBlue[0].translate(enemyLocX[0], 0, enemyLocZ[0]);
    battleZoneRingBlue[0].translate(enemyLocX[0], 0, enemyLocZ[0]);

    enemy[1] = loadShape("Assets/Enemy_Models/officerTwo.obj");
    loadEnemy(enemy[1], -PI/2, enemyLocX[1], -2, enemyLocZ[1], 0.7);
    battleZoneBlue[1].translate(enemyLocX[1], 0, enemyLocZ[1]);
    battleZoneRingBlue[1].translate(enemyLocX[1], 0, enemyLocZ[1]);

    enemy[2] = loadShape("Assets/Enemy_Models/officerThree.obj");
    loadEnemy(enemy[2], -PI/2, enemyLocX[2], -2, enemyLocZ[2], 0.7);
    battleZoneBlue[2].translate(enemyLocX[2], 0, enemyLocZ[2]);
    battleZoneRingBlue[2].translate(enemyLocX[2], 0, enemyLocZ[2]);

    enemy[3] = loadShape("Assets/Enemy_Models/TSA_Officer_Standing.obj");
    loadEnemy(enemy[3], -PI/2, enemyLocX[3], -2, enemyLocZ[3], 0.7);
    battleZoneBlue[3].translate(enemyLocX[3], 0, enemyLocZ[3]);
    battleZoneRingBlue[3].translate(enemyLocX[3], 0, enemyLocZ[3]);
    enemyCheck = true;
  }
  if (level == 1 && enemyStatus[0])
    shape(enemy[0]);
  if (level == 2)
  {
    if (enemyStatus[1])
      shape(enemy[1]);
    if (enemyStatus[2])
      shape(enemy[2]);
  }
  if (level == 3)
  {
    if (enemyStatus[3])
      shape(enemy[3]);
  }
}



void loadEnemy(PShape shape, float r, float x, float y, float z, float s)
{
  for (int i = 0; i < shape.getChildCount(); i++)
  {
    PShape child = shape.getChild(i);
    for (int j = 0; j < child.getVertexCount(); j++)
    {
      PVector vert = child.getVertex(j);
      child.setVertex(j, (vert.z*sin(r)+vert.x*cos(r))*s + x, -vert.y*s + y, (vert.z*cos(r)-vert.x*sin(r))*s + z);
    }
  }
}
