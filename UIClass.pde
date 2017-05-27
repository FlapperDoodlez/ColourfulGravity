class UIMgr {
  ArrayList<Body> menuBodies = level.menuBodies;
  Body selected;
  Boolean isSelected = false;
  final int menux = 35;
  final int menuy = height-35;
  int offset = (int)menuBufRad+5;

  UIMgr() {
    selected = null;
  }

  void placeSelected(PVector click) {
    if (click.y >= mapHeight) {
      return;
    }

    for (int i = 0; i < menuBodies.size(); i++) {
      if (selected == menuBodies.get(i)) {
        println(selected + " was at " + i);
        selected.location = click;
        level.mapBodies.add(selected);
        menuBodies.remove(i);
        break;
      }
    }
  }

  void Draw() {
    for (int i = 0; i < menuBodies.size(); i++) {
      pushMatrix();
      translate(menux+offset*(i+1), menuy);
      menuBodies.get(i).Draw();
      noFill();
      stroke(255);
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
        println("selected: " +selected);
      }
    }
  }
}