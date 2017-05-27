import controlP5.*;
ControlP5 cp5;

Ship ship;

float G = 1;

Slider powSlider;
Button launchBtn;

int levelStatus = -1; // -1, not started, 0 started, 1 crashed, 2 win condition
float shipPushRadius = 100;

LevelMgr lvlMgr;
Level level;
UIMgr ui;

void setup() {
  size(900, 400);
  background(cBack);
  ArrayList<Level> levelsList = new ArrayList<Level>();

  Level lev = new Level(50, height/2, width - 50, height/2);
  lev.mapBodies = new ArrayList<Body>();
  lev.mapObstacles = new ArrayList<Obstacle>();
  lev.menuBodies = new ArrayList<Body>();

  Wall left = new Wall (0, 0, 0, height, color(33, 33, 33));
  Wall right = new Wall (width, 0, width, height, color(33, 33, 33));
  Wall upper = new Wall (0, 0, width, 0, color(33, 33, 33));
  Wall lower = new Wall (0, height, width, height, color(33, 33, 33));

  lev.mapObstacles.add(left);
  lev.mapObstacles.add(right);
  lev.mapObstacles.add(upper);
  lev.mapObstacles.add(lower);

  Planet low1 = new Planet(100, 100, lowMass, lowRad, lowRad, cLow);
  Planet low2 = new Planet(100, 200, lowMass, lowRad, lowRad, cLow);
  Planet med1 = new Planet(200, 100, medMass, medRad, medRad, cMed);
  Planet med2 = new Planet(200, 200, medMass, medRad, medRad, cMed);
  Planet high1 = new Planet(300, 100, highMass, highRad, highRad, cHigh);
  Planet high2 = new Planet(300, 200, highMass, highRad, highRad, cHigh);
  GravityWell well1 = new GravityWell(400, 100, wellMass, 20, 100, cWell);
  GravityWell well2 = new GravityWell(400, 200, highMass, 20, 100, cWell);
  
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
  ship = new Ship(level.shipLoc, 5);
  ui = new UIMgr();
}


void draw() {
  background(33, 33, 33);

  if (levelStatus == STARTED) {
    for (Body obj : level.mapBodies) {
      PVector force = obj.GetForce(ship);
      ship.ApplyForce(force);
    }
  } else if (levelStatus == NOTSTARTED) {
    fill(99, 213, 255, 200);
    ellipse(ship.location.x, ship.location.y, shipPushRadius * 2, shipPushRadius * 2);

    if (ship.location.dist(new PVector(mouseX, mouseY)) < shipPushRadius) {
      fill(73, 180, 210);
      stroke(0);
      strokeWeight(1);
      ellipse(mouseX, mouseY, 10, 10);
    }
  } else if (levelStatus == CRASHED) {
    fill(255);
    textSize(32);
    text("Game Over Loser", width / 2 - 100, height/2 - 100);
  } else if (levelStatus == FINISHED) {
    fill(255);
    textSize(32);
    text("You Win", width / 2 - 100, height/2 - 100);
  }
  // Always update map bodies
  for (Body obj : level.mapBodies) {
    obj.Update();
    if (obj.Collision(ship)) {
      levelStatus = CRASHED;
    }
  }

  for (Obstacle obs : level.mapObstacles) {
    obs.Update();
    if (obs.Collision(ship)) {
      levelStatus = CRASHED;
    }
  }

  Finish goal = level.goal;

  ship.Update();
  goal.Update();

  if (goal.Collision(ship)) {
    if (lvlMgr.getNextLevel() == null) {
      levelStatus = FINISHED;
    }
  }
}

void mouseClicked() {
  if (levelStatus == NOTSTARTED && ship.location.dist(new PVector(mouseX, mouseY)) < shipPushRadius) {
    PVector initialPush = PVector.sub(new PVector(mouseX, mouseY), ship.location);
    println(initialPush.mag());
    float strength = map(initialPush.mag(), 1, 100, 1, 10);
    initialPush.setMag(strength);
    ship.ApplyForce(initialPush);
    levelStatus = STARTED;
  }
}