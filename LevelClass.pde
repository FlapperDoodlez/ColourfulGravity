
//Each Level instance gets filled by ReadLevels();
class Level {
  PVector shipLoc;
  Finish goal;
  ArrayList<Body> mapBodies;
  ArrayList<Obstacle> mapObstacles;
  ArrayList<Body> menuBodies;
  
  Level(float x, float y, float goalX, float goalY) {
    shipLoc = new PVector(x, y);
    goal = new Finish(goalX, goalY);
    mapBodies = new ArrayList<Body>();
    mapObstacles = new ArrayList<Obstacle>();
    menuBodies = new ArrayList<Body>();
  }
  
  String Save() {
    return String.format("%s %s %s %s %s", LEVEL, shipLoc.x, shipLoc.y, goal.location.x, goal.location.y);
  }
}