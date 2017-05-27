class Ship extends Body {
  PVector velocity;
  PVector acceleration;

  Ship(PVector initial_position, float Mass) {
    mass = Mass;
    colour = cShip;
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

  void Draw() {
    fill(colour);
    strokeJoin(ROUND);
    strokeWeight(1);

    // Calculate the angle the ship needs to be rotated based on its current velocity
    PVector axis = new PVector(0, -1);
    float angle = PVector.angleBetween(axis, velocity);
    if (velocity.x < 0) {
      angle = 2*PI - angle;
    }

    rotate(angle);

    triangle(0, -radius, radius * sqrt(3) / 2f, radius * 1/2f, radius * -sqrt(3)/2f, radius * 1/2f);
  }
  void Update() {
    location = oLocation;
    pushMatrix();
    translate(location.x, location.y);
    Draw();
    popMatrix();
  }
}