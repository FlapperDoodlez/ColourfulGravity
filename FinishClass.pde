class Finish extends Body{
  
  Finish(float x, float y) {
    oLocation = new PVector(x, y);
    location = new PVector(x, y);
    radius = 25;
    colour = cGoal;
  }
  
  void Draw() {
    noStroke();
    fill(colour);
    ellipse(0, 0, radius, radius);
    fill(33, 33, 33);
    textSize(27);
    text('\u272a', -13, 10);
  }
  
  void Update() {
    pushMatrix();
    translate(location.x, location.y);
    Draw();
    popMatrix();
  }
  
  Finish clone(){
      Finish clone = (Finish) super.clone();
      return clone;
  }
}