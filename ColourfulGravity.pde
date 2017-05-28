Ship ship;

float G = 1;

int levelStatus = -2; // -1, not started, 0 started, 1 crashed, 2 win condition

LevelMgr lvlMgr;
Level level;
UIMgr ui;

int total_points = 0;
int level_points = 0;

ArrayList<Body> bodiesInMenu = new ArrayList<Body>();
ArrayList<Obstacle> obstaclesInMenu = new ArrayList<Obstacle>();

Ship menuShip;

void setup() {
  size(900, 500);
  background(cBack);
  textSize(40);

  bodiesInMenu.add(new Planet((width/2) - 100, height/2 - 50, medMass, medRad, 999, BLUE)); // Med Planet
  obstaclesInMenu.add(new Wall((width/2) - 105, height/2 + 35, (width/2) - 95, height/2 + 65, cObstacle));
  bodiesInMenu.add(new Repulsor((width/2) - 100, height/2, medMass, medRad, 999, GREEN)); // low Repulsor
  bodiesInMenu.add(new GravityWell((width/2) - 105, height/2 + 100, medMass, medRad, 999, PURPLE)); // high Well

  bodiesInMenu.add(new Planet((width/2) - 95, height/2 + 150, lowMass, lowRad, 999, PURPLE)); // low Planet
  bodiesInMenu.add(new Planet((width/2) - 115, height/2 + 150, medMass, medRad, 999, BLUE)); // med Planet
  bodiesInMenu.add(new Planet((width/2) - 145, height/2 + 150, medMass, highRad, 999, RED)); // High Planet
  bodiesInMenu.add(new Finish((width/2) - 105, height/2 + 195));

  Wall left = new Wall (0, 0, 0, height, cObstacle);
  Wall right = new Wall (width, 0, width, height, cObstacle);
  Wall upper = new Wall (0, 0, width, 0, cObstacle);
  Wall lower = new Wall (0, height, width, height, cObstacle);
  obstaclesInMenu.add(left);
  obstaclesInMenu.add(right);
  obstaclesInMenu.add(upper);
  obstaclesInMenu.add(lower);

  float x = random(20, width - 20);
  float y = random(20, height - 20);
  menuShip = new Ship(new PVector(x, y), shipMass);

  CreateLevels();
  lvlMgr = new LevelMgr();
  level = lvlMgr.getLevel();
  ship = new Ship(level.shipLoc, shipMass);
  ui = new UIMgr();
  levelStatus = MENU;
}


void draw() {
  background(cBack);
  if (levelStatus == MENU) {
    for (Body obj : bodiesInMenu) {
      PVector f = obj.GetForce(menuShip);
      println(f);
      menuShip.ApplyForce(f);
    }

    for (Obstacle obs : obstaclesInMenu) {
      obs.Update();
      if (obs.Collision(menuShip)) {
        float x = random(20, width - 20);
        float y = random(20, height - 20);
        menuShip = new Ship(new PVector(x, y), shipMass);
      }
    }

    menuShip.Update();
    menuShip.Draw();
    
    for (Body obj : bodiesInMenu) {
      obj.Update();
      /*if (obj.Collision(menuShip)) {
        float x = random(20, width - 20);
        float y = random(20, height - 20);
        menuShip = new Ship(new PVector(x, y), shipMass);
      }*/
    }

    fill(textColour);
    textSize(15);
    text("These attract the player", (width/2) - 80, height/2 - 45);
    text("These repel the player", (width/2) - 80, height/2 + 5);
    text("Don't crash into these", (width/2) - 80, height/2 + 55);

    text("These attract the player (a lot), can pass through", (width/2) - 80, height/2 + 110);
    text("Size determines the strength", (width/2) - 80, height/2 + 155);
    text("Get to here!", (width/2) - 80, height/2 + 200);

    textSize(40);
    String m = "ColourfulGravity";
    float mLength = textWidth(m); 
    text(m, (width / 2f) - (mLength/2), 100);

    textSize(20);
    String s = "Press any key to start!";
    float sLength = textWidth(s);
    text("Press any key to start!", (width / 2f) - (sLength / 2), 130);
    return;
  }
  Finish goal = level.goal;  

  if (levelStatus == STARTED) {
    for (Body obj : level.mapBodies) {
      PVector force = obj.GetForce(ship);
      ship.ApplyForce(force);
    }
    PVector goalForce = goal.GetForce(ship);
    ship.ApplyForce(goalForce);
    ship.Update();

    // Accumulate points
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
    text("Press any key to restart", width / 2 - 180, height/2 - 90);
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
    PVector mousePos = new PVector(mouseX, mouseY);
    if (mousePos.x == ship.location.x && mousePos.y == ship.location.y) return;

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
  if (levelStatus == MENU) {
    levelStatus = NOTSTARTED;
  } 
  if (levelStatus == FINISHED && !(key == 'r' || key == 'R')) {
    println("Finished");
    level = lvlMgr.restartGame();
    total_points = level_points = 0;

    levelStatus = NOTSTARTED;
    ui = new UIMgr();
    ship = new Ship(level.shipLoc, shipMass);
  } else if (levelStatus == COMPLETED && !(key == 'r' || key == 'R')) {
    total_points = level_points;
    level = lvlMgr.getNextLevel();

    levelStatus = NOTSTARTED;
    ui = new UIMgr();
    ship = new Ship(level.shipLoc, shipMass);
  } else if (levelStatus == CRASHED || (key == 'r' || key == 'R')) {
    level_points = total_points;
    level = lvlMgr.getLevel();
    levelStatus = NOTSTARTED;
    ui = new UIMgr();
    ship = new Ship(level.shipLoc, shipMass);
  }
}


void DrawGuide() {
  Guide guide;
  guide = new Guide(level.shipLoc, shipMass);
  Finish goal = level.goal;

  PVector mousePos = new PVector(mouseX, mouseY);
  if (mousePos.x == guide.location.x && mousePos.y == guide.location.y) return;

  PVector initialPush = PVector.sub(mousePos, guide.location);
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