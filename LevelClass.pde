
//Each Level instance gets filled by ReadLevels();
class Level {
  ArrayList<Body> mapBodies;
  ArrayList<Obstacle> mapObstacle;
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
    return levels.get(curLevel+1);
  }
}