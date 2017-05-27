Level LevelOne(){
  Level lev = new Level(25, height*3/4, width - 50, height*3/4);
  
  // Bodies
  Planet p = new Planet(width/2,mapHeight/2, highMass, highRad, highAct, RED);
  lev.mapBodies.add(p);
  
  // Obstacles
  Wall w1 = new Wall(width/4, mapHeight, width/2, mapHeight/2, cObstacle);
  Wall w2 = new Wall(width*3/4, mapHeight, width/2, mapHeight/2, cObstacle);
  lev.mapObstacles.add(w1);
  lev.mapObstacles.add(w2);
  return lev;
}