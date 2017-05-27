class GravityWell extends Body {

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