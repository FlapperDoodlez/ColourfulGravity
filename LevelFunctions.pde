Level LevelOne() {
  //Level 1
  /*Level lev = new Level(25, height*3/4, width - 50, height*3/4);

  // Bodies
  Planet p = new Planet(width/2, mapHeight*4/5, medMass, medRad, medAct, RED);
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

  // fill in the triangular area

  // happy accident, makes it look like a dope pyramid
  //NoCol tri = new NoCol(w1.point1.x,w1.point1.y,w1.point2.x,w1.point2.y,w2.point1.y,w2.point1.y, cObstacle);

  NoCol tri = new NoCol(w1.point1.x, w1.point1.y, w1.point2.x, w1.point2.y, w2.point1.x, w2.point1.y, cObstacle);
  lev.mapObstacles.add(tri);

  // cover menu area with background
  NoCol r = new NoCol(0, mapHeight, width, mapHeight, 0, height, width, height, cUnSelected);
  lev.mapObstacles.add(r);*/
  
  //Level 2
  /*Level lev = new Level(20, 20, width - 50, mapHeight-20);
  
  // Bodies
  GravityWell well = new GravityWell(width/2, mapHeight/2, wellMass, wellRad, 100, BLUE);
  lev.mapBodies.add(well);
  
   //Menu Items
  Planet low1 = new Planet(300, 50, lowMass, lowRad, lowAct, RED);
  lev.menuBodies.add(low1);
  
  // Menu Fill
  NoCol r = new NoCol(0, mapHeight, width, mapHeight, 0, height, width, height, cUnSelected);
  lev.mapObstacles.add(r);
  
  // Outer Walls
  Wall left = new Wall (0, 0, 0, mapHeight, cObstacle);
  Wall right = new Wall (width, 0, width, mapHeight, cObstacle);
  Wall upper = new Wall (0, 0, width, 0, cObstacle);
  Wall lower = new Wall (0, mapHeight, width, mapHeight, cObstacle);

  lev.mapObstacles.add(left);
  lev.mapObstacles.add(right);
  lev.mapObstacles.add(upper);
  lev.mapObstacles.add(lower);*/
  
  
  //Level 3
  /*Level lev = new Level(20, 200, width - 150, mapHeight-150);
  
  GravityWell well = new GravityWell(width/2, mapHeight/2, wellMass, wellRad, 100, PURPLE);
  lev.menuBodies.add(well);
  
  Wall w = new Wall(400, 200, 450, 300, cObstacle);
  lev.mapObstacles.add(w);
  
  // Menu Fill
  NoCol r = new NoCol(0, mapHeight, width, mapHeight, 0, height, width, height, cUnSelected);
  lev.mapObstacles.add(r);
  
  // Outer Walls
  Wall left = new Wall (0, 0, 0, mapHeight, cObstacle);
  Wall right = new Wall (width, 0, width, mapHeight, cObstacle);
  Wall upper = new Wall (0, 0, width, 0, cObstacle);
  Wall lower = new Wall (0, mapHeight, width, mapHeight, cObstacle);

  lev.mapObstacles.add(left);
  lev.mapObstacles.add(right);
  lev.mapObstacles.add(upper);
  lev.mapObstacles.add(lower);*/
  
  //Level 4
  /*Level lev = new Level(20, mapHeight-200, width - 50, 50);
  
  Repulsor rep = new Repulsor(300, 50, highMass, highRad, highAct, RED);
  lev.menuBodies.add(rep);
  
  Wall w = new Wall(475, 100, 450, 200, cObstacle);
  lev.mapObstacles.add(w);
  
  // Menu Fill
  NoCol r = new NoCol(0, mapHeight, width, mapHeight, 0, height, width, height, cUnSelected);
  lev.mapObstacles.add(r);
  
  // Outer Walls
  Wall left = new Wall (0, 0, 0, mapHeight, cObstacle);
  Wall right = new Wall (width, 0, width, mapHeight, cObstacle);
  Wall upper = new Wall (0, 0, width, 0, cObstacle);
  Wall lower = new Wall (0, mapHeight, width, mapHeight, cObstacle);

  lev.mapObstacles.add(left);
  lev.mapObstacles.add(right);
  lev.mapObstacles.add(upper);
  lev.mapObstacles.add(lower);*/
  
  //Level 5
  /*Level lev = new Level(20, 150, width - 150, mapHeight-100);
  
  GravityWell well = new GravityWell(width/2, mapHeight/2, wellMass, wellRad, 100, PURPLE);
  Repulsor rep = new Repulsor(300, 50, highMass, highRad, highAct, RED);
  lev.menuBodies.add(well);
  lev.menuBodies.add(rep);
  
  Wall w1 = new Wall(250, 250, width - 150, 275, cObstacle);
  Wall w2 = new Wall(200, 350, width - 200, 375, cObstacle);
  lev.mapObstacles.add(w1);
  lev.mapObstacles.add(w2);
  
  // Menu Fill
  NoCol r = new NoCol(0, mapHeight, width, mapHeight, 0, height, width, height, cUnSelected);
  lev.mapObstacles.add(r);
  
  // Outer Walls
  Wall left = new Wall (0, 0, 0, mapHeight, cObstacle);
  Wall right = new Wall (width, 0, width, mapHeight, cObstacle);
  Wall upper = new Wall (0, 0, width, 0, cObstacle);
  Wall lower = new Wall (0, mapHeight, width, mapHeight, cObstacle);

  lev.mapObstacles.add(left);
  lev.mapObstacles.add(right);
  lev.mapObstacles.add(upper);
  lev.mapObstacles.add(lower);*/
  
  //Level 6
  Level lev = new Level(50, mapHeight-100, width - 50, mapHeight-100);
  
  Planet med1 = new Planet(200, 175, medMass, medRad, medAct, RED);
  Planet med2 = new Planet(259, 250, medMass, medRad, medAct, BLUE);
  Planet med3 = new Planet(575, 230, medMass, medRad, medAct, GREEN);
  Planet low1 = new Planet(350, 75, lowMass, lowRad, lowAct, RED);
  Planet low2 = new Planet(400, 200, lowMass, lowRad, lowAct, BLUE);
  Planet low3 = new Planet(475, 75, lowMass, lowRad, lowAct, GREEN);
  
  lev.mapBodies.add(med1);
  lev.mapBodies.add(med2);
  lev.mapBodies.add(med3);
  lev.mapBodies.add(low1);
  lev.mapBodies.add(low2);
  lev.mapBodies.add(low3);
  
  Wall w = new Wall(750, 300, 700, 350, cObstacle);
  lev.mapObstacles.add(w);
  
  Repulsor rep = new Repulsor(300, 50, highMass, highRad, highAct, RED);
  lev.menuBodies.add(rep);
  
  
  // Menu Fill
  NoCol r = new NoCol(0, mapHeight, width, mapHeight, 0, height, width, height, cUnSelected);
  lev.mapObstacles.add(r);
  
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