abstract class Obstacle implements Serializable{
  abstract void Update();
  abstract boolean Collision(Body b);
}