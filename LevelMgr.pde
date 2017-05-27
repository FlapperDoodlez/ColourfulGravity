class LevelMgr {
  int curLevel;
  ArrayList<Level> levels;

  LevelMgr() {
    curLevel = 0;
    levels = ReadLevels();
  }

  Level getLevel() {
    return levels.get(curLevel);
  }

  Level getNextLevel() {
    if (curLevel < levels.size() - 1) { 
      return null;
    }
    ++curLevel;
    return levels.get(curLevel);
  }
}