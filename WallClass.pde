class Wall extends Obstacle {
  PVector point1;
  PVector point2;
  color colour;

  void Update() {
    stroke(colour);
    line(point1.x, point1.y, point2.x, point2.y);
  }

  boolean Collision(Body b) {
    float dist;
    dist = abs() / sqrt(point1.y + );
  }
}