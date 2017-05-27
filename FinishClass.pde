class Finish extends Body {

  Finish(float x, float y) {
    oLocation = new PVector(x, y);
    location = new PVector(x, y);
    radius = 25;
    colour = cGoal;
  }
  
  void Update() {
    pushMatrix();
    ellipse(location.x, location.y, 25, 25);
    text('\u272a', location.x, location.y);
    popMatrix();
  }
}