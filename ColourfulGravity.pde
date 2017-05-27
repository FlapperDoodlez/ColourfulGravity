Ship ship;

float G = 1;

void setup() {
  size(900, 400);
  background(33, 33, 33);
}

LevelMgr lvlMgr = new LevelMgr();
void draw() {
  background(33, 33, 33);

  for (Body obj : level.mapObjects) {
    PVector force = obj.GetForce(ship);
    ship.applyForce(force);
  }

  for (Body obj : level.mapObjects) {
    obj.Update();
  }

  ship.Update();
}