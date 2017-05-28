class Guide extends Ship {

  Guide (PVector initial_position, float Mass) {
    super(initial_position, Mass);  
    colour = color(100, 100, 170);
  }
   
  void Draw() {
    pushMatrix();
    fill(colour);
    noStroke();
    translate(location.x, location.y);
    ellipse(0, 0, 3, 3);
    popMatrix();
  }
}