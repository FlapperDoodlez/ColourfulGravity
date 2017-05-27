abstract class Obstacle {
  abstract void Update();
  abstract boolean Collision(Body b);
  color colour;

  String Save() {
    return "";
  }
}