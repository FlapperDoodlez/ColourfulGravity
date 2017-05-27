class Planet extends Body {
  color colour;
  
  void Update() {
    pushMatrix();
    stroke(colour);
    ellipse(location.x, location.y, radius, radius);
    popMatrix();
  }
  
  Planet(float x,float y,float mass,float radius,color colour){
    location = new PVector(x,y);
    oLocation = location;
    this.mass = mass;
    this.radius = radius;
    this.colour = colour;
  }
}