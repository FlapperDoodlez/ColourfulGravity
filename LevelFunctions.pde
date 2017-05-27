Level LevelOne(){
  Level lev = new Level(25, height*3/4, width - 50, height*3/4);
  
  // Bodies
  Planet p = new Planet(width/2,mapHeight*4/5, highMass, highRad, highAct, RED);
  lev.mapBodies.add(p);
  
  // Obstacles
  Wall w1 = new Wall(width/4, mapHeight, width/2, mapHeight*4/5, cObstacle);
  Wall w2 = new Wall(width*3/4, mapHeight, width/2, mapHeight*4/5, cObstacle);
  lev.mapObstacles.add(w1);
  lev.mapObstacles.add(w2);
  
  // Outer Walls
  Wall left = new Wall (0, 0, 0, mapHeight, cObstacle);
  Wall right = new Wall (width, 0, width, mapHeight, cObstacle);
  Wall upper = new Wall (0, 0, width, 0, cObstacle);
  Wall lower = new Wall (0, mapHeight, width, mapHeight, cObstacle);

  lev.mapObstacles.add(left);
  lev.mapObstacles.add(right);
  lev.mapObstacles.add(upper);
  lev.mapObstacles.add(lower);
  return lev;
}