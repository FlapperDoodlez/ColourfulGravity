class Finish extends Body {
  
  Finish(float x, float y) {
    oLocation = new PVector(x, y);
    location = new PVector(x, y);
    radius = 25;
    colour = cGoal;
  }
  
  void Draw() {
    noStroke();
    fill(colour);
    ellipse(0, 0, radius, radius);
    text('\u272a', location.x, location.y);
  }
  
  void Update() {
    pushMatrix();
    translate(location.x, location.y);
    popMatrix();
  }
}