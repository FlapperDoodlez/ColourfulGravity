class GravityWell extends Body {

  void Draw() {
    fill(colour);
    noStroke();
    for (float r = 0, t = 0; r < radius; r += 0.5, t += 1.2) {
      float x = r * cos(t);
      float y = r * sin(t);
      ellipse(x, y, 2, 2);
    }
  }

  void Update() {
    pushMatrix();
    translate(location.x, location.y);
    Draw();
    popMatrix();
  }

  boolean Collision(Ship b) {
    return false;
  }

  GravityWell(float x, float y, float mass, float radius, float active_radius, int colourType) {
    location = new PVector(x, y);
    oLocation = new PVector(x, y);
    this.active_radius = active_radius;
    this.colourType = colourType;
    this.colour = getColour(colourType);
    this.mass = mass;
    this.radius = radius;
  }

  String Save(int menu) {
    return String.format("%s %s %s %s %s %s %s %s", GRAVITYWELL, location.x, location.y, mass, radius, active_radius, colourType, menu);
  }

  GravityWell clone() {
    GravityWell clone = (GravityWell) super.clone();
    return clone;
  }
}