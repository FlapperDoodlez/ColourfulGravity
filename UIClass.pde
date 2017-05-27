class UIMgr {
  ArrayList<Body> menuBodies = level.menuBodies;
  int nLow, nMed, nHigh, nWell;
  Body selected;

  UIMgr() {
    selected = null;
    for (Body menuBody : menuBodies) {
      switch(menuBody.colour) {
      case cLow:
        ++nLow;
        break;
      case cMed:
        ++nMed;
        break;
      case cHigh:
        ++nHigh;
        break;
      case cWell:
        ++nWell;
        break;
      }
    }
  }
}