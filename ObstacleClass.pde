abstract class Obstacle implements Cloneable{
  abstract void Update();
  abstract boolean Collision(Ship b);
  abstract boolean Collision(Guide b);
  color colour;

  String Save() {
    return "";
  }
  
  Obstacle clone(){
    try{
      Obstacle clone = (Obstacle) super.clone();
      clone.colour= colour;
      return clone;
    } catch(CloneNotSupportedException e){
      throw new RuntimeException("this can't happen",e);
    }
  }
}