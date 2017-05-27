class UIMgr {
  ArrayList<Body> menuBodies = level.menuBodies;
  int nLow, nMed, nHigh, nWell;
  Body selected;
  final int menux = 400;
  final int menuy = height-30;
  int offset = 0;
  int count = 0;
  int m = 0;
  ArrayList<Integer> lowI = new ArrayList<Integer>();
  ArrayList<Integer> medI = new ArrayList<Integer>();
  ArrayList<Integer> highI = new ArrayList<Integer>();
  ArrayList<Integer> wellI = new ArrayList<Integer>();
  

  UIMgr() {
    selected = null;
    
    
    for (Body menuBody : menuBodies) {
      switch(menuBody.colour) {
      case cLow:
        ++nLow;
        lowI.add(new Integer(count));
        break;
      case cMed:
        ++nMed;
        medI.add(new Integer(count));
        break;
      case cHigh:
        ++nHigh;
        highI.add(new Integer(count));
        break;
      case cWell:
        ++nWell;
        wellI.add(new Integer(count));
        break;
      }
      ++count;
    }
  }
  
  void Draw(){
    count = 0;
    m = 0;
    for (int i = 0; i < nLow; i++){
        pushMatrix();
        translate(menux+offset*count, menuy);
        menuBodies.get(lowI.get(i+m)).Draw();
        popMatrix();
        ++count;
        ++m;
    }
    m = 0;
    for (int i = 0; i < nMed; i++){
        pushMatrix();
        translate(menux+offset*count, menuy);
        menuBodies.get(medI.get(i+m)).Draw();
        popMatrix();
        ++count;
        ++m;
    }
    m = 0;
    for (int i = 0; i < nHigh; i++){
        pushMatrix();
        translate(menux+offset*count, menuy);
        menuBodies.get(highI.get(i+m)).Draw();
        popMatrix();
        ++count;
        ++m;
    }
    m = 0;
    for (int i = 0; i < nWell; i++){
        pushMatrix();
        translate(menux+offset*count, menuy);
        menuBodies.get(wellI.get(i+m)).Draw();
        popMatrix();
        ++count;
        ++m;
    }
  }
}