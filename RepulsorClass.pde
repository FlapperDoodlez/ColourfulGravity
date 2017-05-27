class Repulsor extends Body {
  color colour;

  void Update() {
    pushMatrix();
    stroke(colour);
    ellipse(location.x, location.y, radius, radius);
    popMatrix();
  }

  Repulsor(float x, float y, float mass, float radius, float active_radius, color colour) {
    location = new PVector(x, y);
    oLocation = new PVector(x, y);
    this.active_radius = active_radius;
    this.mass = -(mass);
    this.radius = radius;
    this.colour = colour;
  }

  String Save(int menu) {
    return String.format("%s %s %s %s %s %s %s %s", REPULSOR, location.x, location.y, mass, radius, active_radius, colour, menu);
  }
}