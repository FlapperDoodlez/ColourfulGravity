Ship ship;

float G = 1;

int levelStatus = -1; // -1, not started, 0 started, 1 crashed, 2 win condition
float shipPushRadius = 100;

LevelMgr lvlMgr;
Level level;
UIMgr ui;

void setup() {
  size(900, 600);
  background(cBack);
  ArrayList<Level> levelsList = new ArrayList<Level>();

  levelsList.add(LevelOne());

  Level lev = new Level(25, height/2, width - 50, height/2);

  Wall left = new Wall (0, 0, 0, mapHeight, cObstacle);
  Wall right = new Wall (width, 0, width, mapHeight, cObstacle);
  Wall upper = new Wall (0, 0, width, 0, cObstacle);
  Wall lower = new Wall (0, mapHeight, width, mapHeight, cObstacle);

  lev.mapObstacles.add(left);
  lev.mapObstacles.add(right);
  lev.mapObstacles.add(upper);
  lev.mapObstacles.add(lower);
  
  NoCol r = new NoCol(0, mapHeight, width, mapHeight, 0, height, width, height, cUnSelected);
  lev.mapObstacles.add(r);
  

  Planet low1 = new Planet(300, 50, lowMass, lowRad, lowAct, 0);
  Repulsor low2 = new Repulsor(300, 50, highMass, highRad, highAct, 1);
  Planet med1 = new Planet(400, 150, medMass, medRad, medAct, 2);
  Planet med2 = new Planet(400, 150, medMass, medRad, medAct, 3);
  Planet high1 = new Planet(600, 300, highMass, highRad, highAct, 2);
  Planet high2 = new Planet(600, 300, highMass, highRad, highAct, 1);
  GravityWell well1 = new GravityWell(width - 80, 100, wellMass, wellRad, 100, 3);
  GravityWell well2 = new GravityWell(width - 80, 100, highMass, wellRad, 100, 3);

  lev.mapBodies.add(low2);
  lev.mapBodies.add(med2);
  lev.mapBodies.add(high2);
  lev.mapBodies.add(well2);

  lev.menuBodies.add(low1);
  lev.menuBodies.add(med1);
  lev.menuBodies.add(high1);
  lev.menuBodies.add(well1);

  levelsList.add(lev);

  WriteLevels(levelsList);

  lvlMgr = new LevelMgr();
  level = lvlMgr.getLevel();
  ship = new Ship(level.shipLoc, shipMass);
  ui = new UIMgr();
}


void draw() {
  background(cBack);
  Finish goal = level.goal;  

  if (levelStatus == STARTED) {
    for (Body obj : level.mapBodies) {
      PVector force = obj.GetForce(ship);
      ship.ApplyForce(force);
    }
    PVector goalForce = goal.GetForce(ship);
    ship.ApplyForce(goalForce);
    ship.Update();
  } else if (levelStatus == NOTSTARTED) {
    //ui.Draw();
    noStroke();
    fill(99, 213, 255, 200);
    ellipse(level.shipLoc.x, level.shipLoc.y, shipPushRadius * 2, shipPushRadius * 2);

    if (level.shipLoc.dist(new PVector(mouseX, mouseY)) < shipPushRadius) {
      fill(73, 180, 210);
      stroke(0);
      strokeWeight(1);
      ellipse(mouseX, mouseY, 10, 10);

      DrawGuide();
    }
  } else if (levelStatus == CRASHED) {
    fill(255);
    textSize(32);
    text("Game Over", width / 2 - 80, height/2 - 100);
  } else if (levelStatus == FINISHED) {
    fill(255);
    textSize(32);
    text("You Win", width / 2 - 60, height/2 - 100);
  }

  for (Obstacle obs : level.mapObstacles) {
    obs.Update();
    if (obs.Collision(ship)) {
      levelStatus = CRASHED;
    }
  }
  // need it here so the ui appears on top of obstacles
  if (levelStatus == NOTSTARTED){
    ui.Draw();
  }
  
  for (Body obj : level.mapBodies) {
    obj.Update();
    if (obj.Collision(ship)) {
      levelStatus = CRASHED;
    }
  }

  goal.Update();
  ship.Draw();

  if (goal.Collision(ship)) {
    if (lvlMgr.getNextLevel() == null) {
      levelStatus = FINISHED;
    }
  }
}

void mouseClicked() {
  if (levelStatus == NOTSTARTED && ship.location.dist(new PVector(mouseX, mouseY)) < shipPushRadius) {
    PVector initialPush = PVector.sub(new PVector(mouseX, mouseY), ship.location);
    //PVector initialPush = new PVector(74, -67, 0);
    float strength = map(initialPush.mag(), 1, 100, 1, 10);
    initialPush.setMag(strength);
    print("m");
    ship.ApplyForce(initialPush);
    levelStatus = STARTED;
  }
  PVector mousePoint = new PVector(mouseX, mouseY);
  ui.checkItems(mousePoint);
}

void keyPressed() {
  levelStatus = NOTSTARTED;
  level = lvlMgr.getLevel();
  ui = new UIMgr();
  ship = new Ship(level.shipLoc, shipMass);
}

void DrawGuide() {

  Guide guide;
  guide = new Guide(level.shipLoc, shipMass);
  PVector initialPush = PVector.sub(new PVector(mouseX, mouseY), guide.location);
  float strength = map(initialPush.mag(), 1, 100, 1, 10);
  initialPush.setMag(strength);
  guide.ApplyForce(initialPush);
  guide.Update();
  guide.Draw();


  PVector guideLocation = guide.location.copy();
  PVector prevDistance = guide.location.copy();
  boolean crashed = false;
  int step = 0;
  while (step < 120 && crashed == false) { // Num Updates
    for (Body obj : level.mapBodies) {
      if (obj.Collision(guide)) {
        crashed = true;
        break;
      } else {
        PVector force = obj.GetForce(guide);
        guide.ApplyForce(force);
      }
    }

    for (Obstacle obs : level.mapObstacles) {
      if (obs.Collision(guide)) {
        crashed = true;
        break;
      }
    }

    guide.Update();
    guideLocation.x = guide.location.x;
    guideLocation.y = guide.location.y;

    if (prevDistance.dist(guideLocation) >= 10) {
      prevDistance = guideLocation.copy();
      guide.Draw();
    }
    ++step;
  }
}