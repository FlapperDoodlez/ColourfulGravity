abstract class Body {
  PVector location;
  PVector oLocation;
  float mass = 1;
  
  abstract PVector GetForce(Body b);
  abstract void Update();
}