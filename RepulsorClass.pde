class Repulsor extends Body implements Serializable{
  color colour;

  void Update() {
    pushMatrix();
    stroke(colour);
    ellipse(location.x, location.y, radius, radius);
    popMatrix();
  }
  
  Repulsor(float x, float y, float mass, float radius, color colour){
    location = new PVector(x,y);
    this.mass = mass;
    this.radius = radius;
    this.colour = colour;
  }
}