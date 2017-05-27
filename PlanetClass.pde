class Planet extends Body {
  color colour;

  void Update() {
    pushMatrix();
    stroke(colour);
    ellipse(location.x, location.y, radius, radius);
    popMatrix();
  }

  Planet(float x, float y, float mass, float radius, color colour) {
    location = new PVector(x, y);
    oLocation = location;
    this.mass = mass;
    this.radius = radius;
    this.colour = colour;
  }
  
  String Save(int menu) {
    return String.format("%s %s %s %s %s %s %s", PLANET, location.x, location.y, mass, radius, colour, menu);
  }
}