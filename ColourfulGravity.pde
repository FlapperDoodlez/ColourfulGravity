Ship ship;
int LEVEL = -1;
int PLANET = 0;
int GRAVITYWELL = 1;
int REPULSOR = 2;
int WALL = 3;

float G = 1;

LevelMgr lvlMgr;
Level level;
void setup() {
  size(900, 400);
  background(33, 33, 33);
  ArrayList<Level> levelsList = new ArrayList<Level>();
  Level lev = new Level(width - 50, height/2, 50, 50);
  lev.mapBodies = new ArrayList<Body>();
  lev.mapObstacles = new   ArrayList<Obstacle>();
  lev.menuBodies = new   ArrayList<Body>();

  Planet b = new Planet(width/2, height/2, 1000, 30, color(150, 100, 200));
  lev.mapBodies.add(b);
  levelsList.add(lev);
  WriteLevels(levelsList);
  
  lvlMgr = new LevelMgr();
  level = lvlMgr.getLevel();
  ship = new Ship(level.shipLoc, 5, color(200, 100, 150));
}

void draw() {
  background(33, 33, 33);

  for (Body obj : level.mapBodies) {
    PVector force = obj.GetForce(ship);
    println(force);
    ship.ApplyForce(force);
  }

  for (Body obj : level.mapBodies) {
    obj.Update();
  }

  for (Obstacle obs : level.mapObstacles) {
    obs.Update();
  }

  Finish goal = level.goal;

  ship.Update();
  goal.Update();

  if (goal.Collision(ship)) {
    if (lvlMgr.getNextLevel() == null) {
      // You win!
    }
  }
}