
class Ship extends Body {
  PVector velocity;
  PVector acceleration;

  Ship(PVector initial_position, float Mass) {
    mass = Mass;
    colour = cShip;
    location = new PVector(initial_position.x, initial_position.y);
    oLocation = new PVector(initial_position.x, initial_position.y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    radius = shipRad;
  }

  void ApplyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f); 
  }

  void Draw() {
    pushMatrix();
    translate(location.x, location.y);
    fill(colour);
    stroke(0);
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
    popMatrix();
  }
  void Update() {
    velocity.add(acceleration);
    oLocation.add(velocity);
    acceleration.x = acceleration.y = 0;
    location.x = oLocation.x;
    location.y = oLocation.y;
  }

  String toString() {
    return String.format("%s %s %s %s", location, velocity, acceleration, mass);
  }
}