class GravityWell extends Body{
  color colour;
  
  void Update(){
    pushMatrix();
    stroke(colour);
    ellipse(location.x, location.y, radius, radius);
    popMatrix();
  }
  
  boolean Collision(Body b){
    return false;
  }
  
  GravityWell(float x,float y,color colour,float mass,float radius){
    location = new PVector(x,y);
    oLocation = location;
    this.colour = colour;
    this.mass = mass;
    this.radius = radius;
  }
}