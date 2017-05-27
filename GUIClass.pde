class GUI {
  ControlP5 cp5;
  GUI(PApplet thePApplet) {
    cp5 = new ControlP5(thePApplet);
  }
  
}

public void controlEvent(ControlEvent theEvent) {
  println(theEvent.getController().getName());
  if (theEvent.getController().getName() == "Power"){
    println(powSlider.getValue());
  }
  if (theEvent.getController().getName() == "Launch"){
    println("Launched with Power: " +powSlider.getValue());
  }
}