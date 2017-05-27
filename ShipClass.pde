class Ship extends Body {
  PVector velocity;
  PVector acceleration;
  
Ship(float Mass, color colour) {
  
}

void ApplyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
    velocity.add(acceleration);
    oLocation.add(velocity);
    acceleration.x = acceleration.y = 0;    
  }
  
  void Update() {
    pushMatrix();
    translate(location.x, location.y);
    strokeJoin(ROUND);
    triangle(0, -radius, radius * sqrt(3) / 2f, radius * 1/2f, radius * -sqrt(3)/2f, radius * 1/2f);
    popMatrix();
    location = oLocation;
  }
}