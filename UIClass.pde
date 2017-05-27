class UIMgr {
  ArrayList<Body> menuBodies = level.menuBodies;
  Body selected;
  int selectInd;
  Boolean isSelected = false;
  final int menux = 35;
  final int menuy = height-35;
  int offset = (int)menuBufRad+5;

  UIMgr() {
    selected = null;
    selectInd = -1;
  }

  void placeSelected(PVector click) {
    if (click.y >= mapHeight) {
      selected = null;
      selectInd = -1;
      isSelected = false;
      return;
    }

    selected.location = click;
    level.mapBodies.add(selected);
    menuBodies.remove(selectInd);

    selected = null;
    selectInd = -1;
    isSelected = false;
  }

  void Draw() {
    for (int i = 0; i < menuBodies.size(); i++) {
      pushMatrix();
      translate(menux+offset*(i+1), menuy);
      menuBodies.get(i).Draw();
      noFill();
      stroke(cUnSelected);
      if (selectInd == i) {
        stroke(cSelected);
      }
      strokeWeight(2);
      ellipse(0, 0, menuBufRad/2, menuBufRad/2);
      popMatrix();
    }
  }

  void checkItems(PVector click) {
    if (isSelected == true) {
      placeSelected(click);
      isSelected = false;
      return;
    }

    float dist;
    PVector center = new PVector(0, 0);
    for (int i = 0; i < menuBodies.size(); i++) {
      center.x = menux+offset*(i+1);
      center.y = menuy;
      dist = click.dist(center);
      if (dist < menuBufRad) {
        selected = menuBodies.get(i);
        isSelected = true;
        selectInd = i;
        println("selected: " +selected);
      }
    }
  }
}