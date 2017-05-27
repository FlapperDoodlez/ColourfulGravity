abstract class Body implements Cloneable{
  PVector location;
  PVector oLocation;
  float mass = 1;
  float radius;
  float active_radius = 500;
  color colour;
  int colourType; // Red = 0, Blue = 1, Green = 2, Purple = 3, Yellow = Finish = 4
    
  PVector GetForce(Body b) {
    PVector force = PVector.sub(location, b.location);
    if (force.mag() > active_radius){
      force.x = 0;
      force.y = 0;
      return force;
    }
    float d = max(force.mag(), radius);
    force.setMag((G * mass * b.mass )/(d * d));
    return force;
  }
  
  abstract void Update();
  abstract void Draw();
  
  boolean Collision(Body b) {
    float dist = location.dist(b.location);
    return (dist < radius);
  }
  
  String Save(int menu) {
    return menu + "";
  }
  
  Body clone(){
    try {
      Body clone = (Body) super.clone();
      clone.location= new PVector(location.x,location.y);
      clone.oLocation= new PVector(oLocation.x,oLocation.y);
      clone.mass = mass;
      clone.radius = radius;
      clone.active_radius = active_radius;
      clone.colour = colour;
      return clone;
    } catch (CloneNotSupportedException e){
      throw new RuntimeException("this can't happen", e);
    }
  }
}