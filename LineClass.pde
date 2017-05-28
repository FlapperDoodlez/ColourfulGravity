// used for determining intersection of 2 line segments
class Line{
  PVector point1;
  PVector point2;
  float m;
  float b;
  boolean infSlope = false;
  float len;
  
  Line(float x1, float y1, float x2, float y2){
    point1 = new PVector(x1, y1);
    point2 = new PVector(x2, y2);
    if (point1.x == point2.x){
      infSlope = true;
      b = point1.x;
    } else {
      m = (point1.y - point2.y)/(point1.x - point1.x);
    }
    
    if (!infSlope){
      if (m == 0){
        b = point1.y;
      } else if (point1.x == 0){
        b = point2.y / (m*point2.x);
      } else {
        b = point1.y / (m*point1.x);
      }
    }
    len = point1.dist(point2);
  }
  
  boolean intersect(Line l1, Line l2){
    float x;
    float y;
    if (l1.infSlope){
      if (l2.infSlope){
        return (l1.b == l2.b);
      }
      x = l1.b;
      y = l2.m * x + l2.b;
    }
    if (l2.infSlope){
      x = l2.b;
      y = l1.m * x + l1.b;
    } else if (l1.m == l2.m && l1.b == l2.b){
      return true;
    } else if (l1.m == l2.m){
      return false;
    } else {
      x = (l2.b - l1.b)/(l1.m - l2.m);
      y = l1.m *x + l1.b;
    }
    PVector poi = new PVector(x,y);
    float d1;
    float d2;
    float d3;
    float d4;
    d1 = poi.dist(l1.point1);
    d2 = poi.dist(l1.point2);
    d3 = poi.dist(l2.point1);
    d4 = poi.dist(l2.point2);
    if (d1 > l1.len || d2 > l1.len || d3 > l2.len || d4 > l2.len) return false;
    return true;
  }
}