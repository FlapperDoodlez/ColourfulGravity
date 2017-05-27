abstract class Obstacle {
  abstract void Update();
  abstract boolean Collision(Body b);

  String Save() {
    return "";
  }
}