class UIMgr {
  ArrayList<Body> menuBodies = level.menuBodies;
  int nLow, nMed, nHigh, nWell;
  Body selected;
  final int menux = 50;
  final int menuy = height-(int)highRad;
  int offset = (int)menuBufRad+5;
  int count = 0;
  int m = 0;
  ArrayList<Integer> lowI = new ArrayList<Integer>();
  ArrayList<Integer> medI = new ArrayList<Integer>();
  ArrayList<Integer> highI = new ArrayList<Integer>();
  ArrayList<Integer> wellI = new ArrayList<Integer>();

  UIMgr() {
    selected = null;

    for (Body menuBody : menuBodies) {
      if (menuBody.radius == lowRad) {
        ++nLow;
        lowI.add(new Integer(count));
      } else if (menuBody.radius == medRad) {
        ++nMed;
        medI.add(new Integer(count));
      } else if (menuBody.radius == highRad) {
        ++nHigh;
        highI.add(new Integer(count));
      } else if (menuBody.radius == wellRad) {
        ++nWell;
        wellI.add(new Integer(count));
      }
      count++;
    }
  }

  void Draw() {
    count = 0;
    m = 0;
    for (int i = 0; i < nLow; i++) {
      pushMatrix();
      translate(menux+offset*(count+1), menuy);
      menuBodies.get(lowI.get(i+m)).Draw();
      noFill();
      stroke(255);
      strokeWeight(2);
      ellipse(0, 0, menuBufRad/2, menuBufRad/2);
      popMatrix();
      ++count;
      ++m;
    }
    m = 0;
    for (int i = 0; i < nMed; i++) {
      pushMatrix();
      translate(menux+offset*(count+1), menuy);
      menuBodies.get(medI.get(i+m)).Draw();
      noFill();
      stroke(255);
      strokeWeight(2);
      ellipse(0, 0, menuBufRad/2, menuBufRad/2);
      popMatrix();
      ++count;
      ++m;
    }
    m = 0;
    for (int i = 0; i < nHigh; i++) {
      pushMatrix();
      translate(menux+offset*(count+1), menuy);
      menuBodies.get(highI.get(i+m)).Draw();
      noFill();
      stroke(255);
      strokeWeight(2);
      ellipse(0, 0, menuBufRad/2, menuBufRad/2);
      popMatrix();
      ++count;
      ++m;
    }
    m = 0;
    for (int i = 0; i < nWell; i++) {
      pushMatrix();
      translate(menux+offset*(count+1), menuy);
      menuBodies.get(wellI.get(i+m)).Draw();
      noFill();
      stroke(255);
      strokeWeight(2);
      ellipse(0, 0, menuBufRad/2, menuBufRad/2);
      popMatrix();
      ++count;
      ++m;
    }
  }

  void checkItems(PVector click) {
    float dist;
    count = 0;
    m = 0;
    PVector center = new PVector(0, 0);
    for (int i = 0; i < nLow; i++) {
      center.x = menux+offset*(count+1);
      center.y = menuy;
      dist = click.dist(center);
      if (dist < menuBufRad) {
        selected = menuBodies.get(lowI.get(i+m));
        println("selected" +selected);
      }
      ++count;
      ++m;
    }
    m = 0;
    for (int i = 0; i < nMed; i++) {
      center.x = menux+offset*(count+1);
      center.y = menuy;
      dist = click.dist(center);
      if (dist < menuBufRad) {
        selected = menuBodies.get(lowI.get(i+m));
        println("selected" +selected);
      }
      ++count;
      ++m;
    }
    m = 0;
    for (int i = 0; i < nHigh; i++) {
      center.x = menux+offset*(count+1);
      center.y = menuy;
      dist = click.dist(center);
      if (dist < menuBufRad) {
        selected = menuBodies.get(lowI.get(i+m));
        println("selected" +selected);
      }
      ++count;
      ++m;
    }
    m = 0;
    for (int i = 0; i < nWell; i++) {
      center.x = menux+offset*(count+1);
      center.y = menuy;
      dist = click.dist(center);
      if (dist < menuBufRad) {
        selected = menuBodies.get(lowI.get(i+m));
        println("selected" +selected);
      }
      ++count;
      ++m;
    }
  }
}