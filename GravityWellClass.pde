class GravityWell extends Body {

  void Update() {
    pushMatrix();
    stroke(colour);
    ellipse(location.x, location.y, radius, radius);
    popMatrix();
  }

  boolean Collision(Body b) {
    return false;
  }

  GravityWell(float x, float y, float mass, float radius, float active_radius, color colour) {
    location = new PVector(x, y);
    oLocation = new PVector(x, y);
    this.active_radius = active_radius;
    this.colour = colour;
    this.mass = mass;
    this.radius = radius;
  }
  
  String Save(int menu) {
    return String.format("%s %s %s %s %s %s %s %s", GRAVITYWELL, location.x, location.y, mass, radius, active_radius, colour, menu);
  }
}