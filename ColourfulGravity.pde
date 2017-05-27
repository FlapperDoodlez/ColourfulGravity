Ship ship;

float G = 1;
LevelMgr lvlMgr = new LevelMgr();

void setup() {
  size(900, 400);
  background(33, 33, 33);
}

void draw() {
  background(33, 33, 33);

  Level level = lvlMgr.getLevel();
  for (Body obj : level.mapBodies) {
    PVector force = obj.GetForce(ship);
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