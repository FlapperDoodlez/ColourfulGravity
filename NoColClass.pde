class NoCol extends Obstacle {
  // If triangle, input the points in any order
  // If rectangle, input p1 = topLeft, p2 = topRight, p3 = botLeft, p4 = botRight
  PVector[] points = new PVector[4];

  boolean Collision(Body b) { 
    return false;
  }
  void Update() {
    pushMatrix();
    stroke(colour);
    fill(colour);
    if (points[3] == null) { // it's a triangle
      triangle(points[0].x, points[0].y, points[1].x, points[1].y, points[2].x, points[2].y);
    } else { // it's a rectangle
      float rWidth= points[1].x - points[0].x;
      float rHeight = points[2].y - points[0].y;
      rect(points[0].x,points[0].y,rWidth,rHeight);
    }
    popMatrix();
  }

  NoCol(float x1, float y1, float x2, float y2, float x3, float y3, color colour) {
    points[0] = new PVector(x1, y1);
    points[1] = new PVector(x2, y2);
    points[2] = new PVector(x3, y3);
    points[3] = null;
    this.colour = colour;
  }

  NoCol(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, color colour) {
    points[0] = new PVector(x1, y1);
    points[1] = new PVector(x2, y2);
    points[2] = new PVector(x3, y3);
    points[3] = new PVector(x4, y4);
    this.colour = colour;
  }
  
  String Save(){
    if (points[3] == null){
    return String.format("%s %s %s %s %s %s %s %s", NOCOLTRI, points[0].x, points[0].y, points[1].x, points[1].y, points[2].x, points[2].y, colour);    
    } else {
      return String.format("%s %s %s %s %s %s %s %s %s %s", NOCOLRECT, points[0].x, points[0].y, points[1].x, points[1].y, points[2].x, points[2].y, points[3].x, points[3].y, colour);
    }
  }
  
  NoCol clone(){
    NoCol clone = (NoCol) super.clone();
    clone.points = new PVector[4];
    clone.points[0] = new PVector(this.points[0].x,this.points[0].y);
    clone.points[1] = new PVector(this.points[1].x,this.points[1].y);
    clone.points[2] = new PVector(this.points[2].x,this.points[2].y);
    if (this.points[3] == null){
      clone.points[3] = null;
    } else {
      clone.points[3] = new PVector(this.points[3].x,this.points[3].y);
    }
    return clone;
  }
}