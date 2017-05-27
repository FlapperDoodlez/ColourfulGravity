Class Repulsor extends Body {
  color colour;

  void Update() {
    pushMatrix();
    stroke(colour);
    ellipse(location.x, location.y, radius, radius);
    popMatrix();
  }
  
  Repulsor(float x, float y, float mass, float radius, color colour){
  
  }
}