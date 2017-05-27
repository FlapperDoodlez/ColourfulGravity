class Finish extends Body {
  color colour;
  
  Finish(PVector Location) {
    location = oLocation = Location;
    radius = 25;
  }
  
  void Update() {
    pushMatrix();
    ellipse(location.x, location.y, 25, 25);
    text('\u272a', location.x, location.y);
    popMatrix();
  }
}