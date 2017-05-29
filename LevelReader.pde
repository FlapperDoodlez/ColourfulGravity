void WriteLevels(ArrayList<Level> levels) {
  PrintWriter output = createWriter("levels.txt");
  for (Level level : levels) {
    output.println(level.Save());

    for (Body mapBody : level.mapBodies) {
      output.println(mapBody.Save(0));
    }

    for (Obstacle mapObstacle : level.mapObstacles) {
      output.println(mapObstacle.Save());
    }

    for (Body menuBody : level.menuBodies) {
      output.println(menuBody.Save(1));
    }
    output.flush();
  }

  output.close();
}

ArrayList<Level> ReadLevels() {
  ArrayList<Level> levels = new ArrayList<Level>();
  String[] data = loadStrings("levels.txt");

  String[] firstLine = splitTokens(data[0]);
  Level currLevel = new Level(int(firstLine[1]), int(firstLine[2]), int(firstLine[3]), int(firstLine[4]));

  for (int i = 1; i < data.length; ++i) {
    String[] line = splitTokens(data[i]);
    //Cast in switch is need for Java 1.7 Compliance (Android)
    switch (int(line[0])) {
    case -1: // new Level
      levels.add(currLevel); // Add old level
      currLevel = new Level(int(line[1]), int(line[2]), int(line[3]), int(line[4]));
      break;
    case 0: // Planet
      Planet p = new Planet(float(line[1]), float(line[2]), float(line[3]), float(line[4]), float(line[5]), int(line[6]));
      if (int(line[7]) == 1) {
        currLevel.menuBodies.add(p);
      } else {
        currLevel.mapBodies.add(p);
      }
      break;
    case 1: // Gravity Well
      GravityWell g = new GravityWell(float(line[1]), float(line[2]), float(line[3]), float(line[4]), float(line[5]), int(line[6]));
      if (int(line[7]) == 1) {
        currLevel.menuBodies.add(g);
      } else {
        currLevel.mapBodies.add(g);
      }
      break;
    case 2: // Repulsor
      Repulsor r = new Repulsor(float(line[1]), float(line[2]), float(line[3]), float(line[4]), float(line[5]), int(line[6]));
      if (int(line[7]) == 1) {
        currLevel.menuBodies.add(r);
      } else {
        currLevel.mapBodies.add(r);
      }
      break;
    case 3: // Wall
      Wall w = new Wall(float(line[1]), float(line[2]), float(line[3]), float(line[4]), int(line[5]));
      currLevel.mapObstacles.add(w);
      break;
    case 4: // Pickups, potentially scrapped

      break;
    case 5: // No Collision triangles
      NoCol nT = new NoCol(float(line[1]), float(line[2]), float(line[3]), float(line[4]), float(line[5]), float(line[6]), int(line[7]));
      currLevel.mapObstacles.add(nT);
      break;
    case 6: // No Collision rectangles
      NoCol nR = new NoCol(float(line[1]), float(line[2]), float(line[3]), float(line[4]), float(line[5]), float(line[6]), float(line[7]), float(line[8]), int(line[9]));
      currLevel.mapObstacles.add(nR);
      break;
    }
  }
  levels.add(currLevel);

  return levels;
}