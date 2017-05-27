class Finish extends Body {
  color colour;

  Finish(float x, float y) {
    oLocation = new PVector(x, y);
    location = new PVector(x, y);
    radius = 25;
  }
  
  void Update() {
    pushMatrix();
    ellipse(location.x, location.y, 25, 25);
    text('\u272a', location.x, location.y);
    popMatrix();
  }
}