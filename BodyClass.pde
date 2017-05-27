abstract class Body {
  PVector location;
  PVector oLocation;
  float mass = 1;
  float radius;
    
  PVector GetForce(Body b) {
    PVector force = PVector.sub(location, b.location);
    float d = max(force.mag(), radius);
    force.setMag((G * mass * b.mass )/(d * d));
    return force;
  }
  abstract void Update();

  boolean Collision(Body b) {
    float dist = location.dist(b.location);
    return (dist < radius);
  }
  
  String Save(int menu) {
    return menu + "";
  }
}