class Wall extends Obstacle {
  PVector point1;
  PVector point2;

  void Update() {
    pushMatrix();
    stroke(colour);
    strokeCap(ROUND);
    strokeWeight(10);
    line(point1.x, point1.y, point2.x, point2.y);
    popMatrix();
  }

  boolean Collision(Ship b) {
    float dist;
    float x0= b.location.x;
    float y0= b.location.y;
    // calculates the distance between a line and a point
    float nume= abs((point2.y-point1.y)*x0 - (point2.x-point1.x)*y0 + point2.x*point1.y - point2.y*point1.x);
    float denom= sqrt((point2.y - point1.y)*(point2.y - point1.y) + (point2.x - point1.x)*(point2.x - point1.x));
    dist = nume / denom;
    float lineLen = point1.dist(point2) + b.radius; // make sure to add body radius
    float dp1 = point1.dist(b.location);
    float dp2 = point2.dist(b.location);
    if (dist<b.radius && dp1 <= lineLen && dp2 <= lineLen){
      pushMatrix();
      PVector unit = new PVector(0,-1);
      float theta = PVector.angleBetween(unit, b.velocity);
      if (b.velocity.x < 0) theta = 2*PI - theta;
      translate(b.location.x,b.location.y);
      // rotate the reference point such that the triangle is facing upwards
      rotate(theta);
      Line p = new Line(point1.x, point1.y, point2.x, point2.y);
      Line l1 = new Line(0, b.radius, sqrt(3) * b.radius / 2f, b.radius / -2f);
      Line l2 = new Line(0, b.radius, sqrt(3) * b.radius / -2f, b.radius / -2f);
      Line l3 = new Line(sqrt(3) * b.radius / -2f, b.radius / -2f, sqrt(3) * b.radius / 2f, b.radius / -2f);
      popMatrix();
      return(p.intersect(p,l1) || p.intersect(p,l2) || p.intersect(p,l3));
    } else return false;
  }
  
  boolean Collision(Guide b) {
    float dist;
    float x0= b.location.x;
    float y0= b.location.y;
    // calculates the distance between a line and a point
    float nume= abs((point2.y-point1.y)*x0 - (point2.x-point1.x)*y0 + point2.x*point1.y - point2.y*point1.x);
    float denom= sqrt((point2.y - point1.y)*(point2.y - point1.y) + (point2.x - point1.x)*(point2.x - point1.x));
    dist = nume / denom;
    float lineLen = point1.dist(point2) + b.radius; // make sure to add body radius
    float dp1 = point1.dist(b.location);
    float dp2 = point2.dist(b.location);
    if (dist<b.radius && dp1 <= lineLen && dp2 <= lineLen) return true;
    return false;
  }

  Wall(float x1, float y1, float x2, float y2, color colour) {
    this.colour= colour;
    point1= new PVector(x1, y1);
    point2= new PVector(x2, y2);
  }

  String Save() {
    return String.format("%s %s %s %s %s %s", WALL, point1.x, point1.y, point2.x, point2.y, colour);
  }
  
  Wall clone(){
    Wall clone = (Wall) super.clone();
    clone.point1 = new PVector (point1.x, point1.y);
    clone.point2 = new PVector (point2.x, point2.y);
    return clone;
  }
}