
//Each Level instance gets filled by ReadLevels();
class Level {
  PVector shipLoc;
  Finish goal;
  ArrayList<Body> mapBodies;
  ArrayList<Obstacle> mapObstacles;
  ArrayList<Body> menuBodies;
}


class LevelMgr {
  int curLevel;
  final int numLevels = 5;
  ArrayList<Level> levels;

  LevelMgr() {
    curLevel = 0;
    levels = ReadLevels();
  }

  Level getLevel() {
    return levels.get(curLevel);
  }

  Level getNextLevel() {
    if (curLevel-1 == numLevels) { 
      return null;
    }
    ++curLevel;
    return levels.get(curLevel+1);
  }
}