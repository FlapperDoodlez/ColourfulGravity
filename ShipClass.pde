class Ship extends Body {
  PVector velocity;
  PVector acceleration;
  color colour;

  Ship(PVector initial_position, float Mass, color Colour) {
    mass = Mass;
    colour = Colour;
    location = initial_position.copy();
    oLocation = initial_position.copy();
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    radius = 12;
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
    fill(colour);
    translate(location.x, location.y);
    strokeJoin(ROUND);
    triangle(0, -radius, radius * sqrt(3) / 2f, radius * 1/2f, radius * -sqrt(3)/2f, radius * 1/2f);
    popMatrix();
    location = oLocation;
  }
}