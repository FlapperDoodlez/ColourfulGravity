class Planet extends Body {
  
  void Update() {
    pushMatrix();
    stroke(colour);
    ellipse(location.x, location.y, radius, radius);
    popMatrix();
  }

  Planet(float x, float y, float mass, float radius, float active_radius, color colour) {
    location = new PVector(x, y);
    oLocation = new PVector(x, y);
    this.mass = mass;
    this.radius = radius;
    this.active_radius = active_radius;
    this.colour = colour;
  }
  
  String Save(int menu) {
    return String.format("%s %s %s %s %s %s %s %s", PLANET, location.x, location.y, mass, radius, active_radius, colour, menu);
  }
}