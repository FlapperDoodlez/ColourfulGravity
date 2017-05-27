abstract class Body {
  PVector location;
  PVector oLocation;
  float mass = 1;
  float radius;
  
  PVector GetForce(Body b) {
       PVector force = PVector.sub(location, b.location);
       float d = max(force.mag(), 10);
           force.setMag((G * mass * b.mass )/(d * d));
    return force;

  }
  abstract void Update();
  
  boolean Collision(Body b) {
    float dist = sqrt((location.x - b.location.x)*(location.x - b.location.x)
    + (location.y - b.location.y)*(location.y - b.location.y));
    if (dist > radius + b.radius) return true;
    return false;
  }
}