Ship ship;

float G = 1;

int levelStatus = -1; // -1, not started, 0 started, 1 crashed, 2 win condition

LevelMgr lvlMgr;
Level level;
UIMgr ui;

int total_points = 0;
int level_points = 0;

void setup() {
  size(900, 500);
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


  Planet low1 = new Planet(300, 50, lowMass, lowRad, lowAct, RED);
  Repulsor low2 = new Repulsor(300, 50, highMass, highRad, highAct, PURPLE);
  Planet med1 = new Planet(400, 150, medMass, medRad, medAct, BLUE);
  Planet med2 = new Planet(400, 150, medMass, medRad, medAct, GREEN);
  Planet high1 = new Planet(600, 300, highMass, highRad, highAct, BLUE);
  Planet high2 = new Planet(600, 300, highMass, highRad, highAct, RED);
  GravityWell well1 = new GravityWell(width - 80, 100, wellMass, wellRad, 100, GREEN);
  GravityWell well2 = new GravityWell(width - 80, 100, highMass, wellRad, 100, PURPLE);

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
    level_points += 10;
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
    }
    DrawGuide();
  }

  for (Obstacle obs : level.mapObstacles) {
    obs.Update();
    if (obs.Collision(ship)) {
      levelStatus = CRASHED;
    }
  }
  // need it here so the ui appears on top of obstacles
  if (levelStatus == NOTSTARTED) {
    ui.Draw();
  }

  for (Body obj : level.mapBodies) {
    obj.Update();
    if (obj.Collision(ship)) {
      levelStatus = CRASHED;
    }
  }

  if (levelStatus == CRASHED) {
    fill(textColour);
    textSize(32);
    text("Game Over", width / 2 - 80, height/2 - 120);
  } else if (levelStatus == FINISHED) {
    fill(textColour);
    textSize(32);
    text("You Win", width / 2 - 60, height/2 - 120);
    textSize(20);
    text("Total Points: " + level_points, width / 2 - 80, height/2 - 90);
    text("or press R to get a better score", width / 2 - 140, height / 2 - 70);
  } else if (levelStatus == COMPLETED) {
    fill(textColour);
    textSize(32);
    text("Press any key", width / 2 - 110, height/2 - 120);
    textSize(20);
    text("or press R to get a better score", width / 2 - 160, height / 2 - 90);
  }

  fill(menuTextColour);
  textSize(20);
  text("Points: " + level_points, width - 140, height - 28); 
  goal.Update();
  ship.Draw();

  if (levelStatus == STARTED && goal.Collision(ship)) {
    if (lvlMgr.finishedGame()) {
      levelStatus = FINISHED;
    } else {
      levelStatus = COMPLETED;
    }
  }
}

void mouseClicked() {
  if (levelStatus == NOTSTARTED && mouseY <= mapHeight && !ui.isSelected) {
    PVector initialPush = PVector.sub(new PVector(mouseX, mouseY), ship.location);
    initialPush.limit(shipPushRadius);
    //PVector initialPush = new PVector(74, -67, 0);
    float strength = map(initialPush.mag(), 1, 100, 1, 10);
    initialPush.setMag(strength);
    ship.ApplyForce(initialPush);
    levelStatus = STARTED;
  }
  if (levelStatus == NOTSTARTED) {
    PVector mousePoint = new PVector(mouseX, mouseY);
    ui.checkItems(mousePoint);
  }
}

void keyPressed() {
  if (levelStatus == COMPLETED || (key == 'r' || key == 'R')) {
    if (levelStatus == FINISHED && !(key == 'r' || key == 'R')) {
      level = lvlMgr.restartGame();
      total_points = level_points = 0;
    } else if (levelStatus == COMPLETED && !(key == 'r' || key == 'R')) {
      total_points = level_points;
      level = lvlMgr.getNextLevel();
    } else {
      level_points = total_points;
      level = lvlMgr.getLevel();
    }

    levelStatus = NOTSTARTED;
    ui = new UIMgr();
    ship = new Ship(level.shipLoc, shipMass);
  }
}

void DrawGuide() {
  Guide guide;
  guide = new Guide(level.shipLoc, shipMass);
  Finish goal = level.goal;


  PVector initialPush = PVector.sub(new PVector(mouseX, mouseY), guide.location);
  initialPush.limit(shipPushRadius);
  float strength = map(initialPush.mag(), 1, shipPushRadius, 1, 10);
  initialPush.setMag(strength);
  guide.ApplyForce(initialPush);
  guide.Update();
  guide.Draw();

  PVector guideLocation = guide.location.copy();
  PVector prevDistance = guide.location.copy();
  boolean crashed = false;
  while (level.shipLoc.dist(guideLocation) < 1000 && crashed == false) { // Num Updates
    for (Body obj : level.mapBodies) {
      if (obj.Collision(guide)) {
        crashed = true;
        break;
      } else {
        PVector force = obj.GetForce(guide);
        guide.ApplyForce(force);
      }
    }

    if (goal.Collision(guide)) {
      crashed = true;
    }

    PVector goalForce = goal.GetForce(guide);
    guide.ApplyForce(goalForce);

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
  }
}