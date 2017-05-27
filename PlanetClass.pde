class Planet extends Body {

  void Draw() {
    fill(colour);
    noStroke();
    ellipse(0, 0, radius, radius);
  }
  void Update() {
    pushMatrix();
    translate(location.x, location.y);
    Draw();
    popMatrix();
  }

  Planet(float x, float y, float mass, float radius, float active_radius, int colourType) {
    location = new PVector(x, y);
    oLocation = new PVector(x, y);
    this.mass = mass;
    this.radius = radius;
    this.active_radius = active_radius;
    this.colourType = colourType;
    colour = getColour(colourType);
  }

  String Save(int menu) {
    return String.format("%s %s %s %s %s %s %s %s", PLANET, location.x, location.y, mass, radius, active_radius, colourType, menu);
  }
  
  Planet clone(){
      Planet clone = (Planet) super.clone();
      return clone;
  }
}