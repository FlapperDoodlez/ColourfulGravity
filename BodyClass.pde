abstract class Body {
  PVector location;
  PVector oLocation;
  float mass = 1;
  
  PVector GetForce(Body b) {
       PVector force = PVector.sub(location, b.location);
       float d = max(force.mag(), 10);
           force.setMag((G * mass * b.mass )/(d * d));
    return force;

  }
  abstract void Update();
}