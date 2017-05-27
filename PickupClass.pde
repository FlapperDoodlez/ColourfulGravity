class Pickup extends Body {
  boolean visible;

  Pickup(float x, float y, float radius, int colourType) {
    location = new PVector(x, y);
    oLocation = new PVector(x, y);
    this.radius = radius;
    this.active_radius = 0;
    this.mass = 0;
    this.colourType = colourType;
    this.colour = getColour(colourType);
    visible = true;
  }

  void Update() {
    if (visible) {
      pushMatrix();
      translate(location.x, location.y);
      this.Draw();
      popMatrix();
    }
  }

  void Draw() {
    stroke(colour);
    ellipse(0, 0, (.8)*radius, radius);
    stroke(50);
    line(0, (.25)*radius, 0, -(.25)*radius);
  }
  
  boolean Collision(Body b){
    if (visible){
      boolean collide= super.Collision(b);
      if (collide){
        b.colourType= this.colourType;
        b.colour = getColour(colourType);
        visible = false;
      }
    }
    return false;
  }
}