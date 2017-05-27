class Wall extends Obstacle {
  PVector point1;
  PVector point2;
  color colour;

  void Update() {
    pushMatrix();
    stroke(colour);
    strokeCap(ROUND);
    strokeWeight(4);
    line(point1.x, point1.y, point2.x, point2.y);
    popMatrix()
  }

  boolean Collision(Body b) {
    float dist;
    float x0= b.location.x;
    float y0= b.location.y;
    // calculates the distance between a line and a point
    float nume= abs((point2.y-point1.y)*x0 - (point2.x-point1.x)*y0 + point2.x*point1.y - point2.y*point1.x);
    float denom= sqrt((point2.y - point1.y)*(point2.y - point1.y) + (point2.x - point1.x)*(point2.x - point1.x));
    dist = nume / denom;
    if(dist<b.radius) return true;
    return false;
  }
  
  Wall(float x1, float y1, float x2, float y2, color colour){
    this.colour= colour;
    point1= new PVector(x1,y1);
    point2= new PVector(x2,y2);
  }
}