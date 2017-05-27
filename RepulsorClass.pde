class Repulsor extends Body {

  void Draw() {
    noFill();
    stroke(colour);
    strokeWeight(4);
    ellipse(0, 0, radius, radius);
  }


  void Update() {
    pushMatrix();
    translate(location.x, location.y);
    Draw();
    popMatrix();
  }

  Repulsor(float x, float y, float mass, float radius, float active_radius, int colourType) {
    location = new PVector(x, y);
    oLocation = new PVector(x, y);
    this.active_radius = active_radius;
    this.mass = -(mass);
    this.radius = radius;
    this.colourType = colourType;
    this.colour = getColour(colourType);
  }

  String Save(int menu) {
    return String.format("%s %s %s %s %s %s %s %s", REPULSOR, location.x, location.y, mass, radius, active_radius, colourType, menu);
  }
  
  Repulsor clone(){
      Repulsor clone = (Repulsor) super.clone();
      return clone;
  }
}