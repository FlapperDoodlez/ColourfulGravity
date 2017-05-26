

class LevelMgr{
    int curLevel;
    final int numLevels = 5;
    ArrayList<Level> levels;

    LevelMgr(){
        curLevel = 0;
        levels = new ArrayList<Level>(numLevels);

        for (int i = 0; i < numLevels; i++){
            levels.add(new Level());
        }
    }

    static Level getLevel(){
        return levels[curLevel];
    }

    static Level getNextLevel(){
        if (curLevel-1 == numLevels) { return NULL; }
        return levels[curLevel+1]
    }

}

class Level{
    ArrayList<Body> mapBodies;
    ArrayList<Obstacle> mapObstacle;
    
    Level(){
        //read from file and init mapBodies
        //read from file and init mapObstacle
    }
    
    void LoadLevel(int levelID){
  
  
    }
}