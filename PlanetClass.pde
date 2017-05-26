class Planet extends Body {
  color colour;
  float radius = 5;
  
  void Update() {
    pushMatrix();
    ellipse(location.x, location.y, radius, radius);
    popMatrix();
  }
}