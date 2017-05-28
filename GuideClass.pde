class Guide extends Body {
  PVector velocity;
  PVector acceleration;

  Guide (PVector initial_position, float Mass) {
    mass = Mass;
    colour = color(100, 100, 170);
    location = initial_position.copy();
    oLocation = initial_position.copy();
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    radius = 12;
  }
  
  void ApplyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void Draw() {
    pushMatrix();
    fill(colour);
    noStroke();
    translate(location.x, location.y);
    ellipse(0, 0, 3, 3);
    popMatrix();
  }
  
  void Update() {
    velocity.add(acceleration);
    oLocation.add(velocity);
    acceleration.x = acceleration.y = 0;
    location = oLocation.copy();
  }
}