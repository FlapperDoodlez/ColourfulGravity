class LevelMgr {
  int curLevel;
  ArrayList<Level> levels;

  LevelMgr() {
    curLevel = 0;
    levels = ReadLevels();
  }

  Level getLevel() {
    Level cLevel = levels.get(curLevel);
    Level r = new Level(cLevel.shipLoc.x, cLevel.shipLoc.y, cLevel.goal.oLocation.x, cLevel.goal.oLocation.y);
    for (Body b : cLevel.mapBodies){
      Body n = b.clone();
      r.mapBodies.add(n);
    }
    for (Obstacle obs: cLevel.mapObstacles){
       Obstacle n = obs.clone();
       r.mapObstacles.add(n);
    }
    for (Body b : cLevel.menuBodies){
      Body n = b.clone();
      r.menuBodies.add(n);
    }
    return r;
  }

  Level getNextLevel() {
    println(levels.size());
    if (curLevel >= levels.size() - 1) { 
      return null;
    }
    ++curLevel;
    return levels.get(curLevel);
  }
}