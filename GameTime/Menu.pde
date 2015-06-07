public class Menu {
  int ax, ay, aw, ah;
  PImage intro;
  boolean aOver;
  public Menu() {
    intro = loadImage("K.jpg");
    ax = 1000;
    ay = 1000;
    aw = 100;
    ah = 100;
  }
  void display() {
    // Test if the cursor is over the box 
    background(intro);
    stroke(153);
    if (mouseX > ax-aw && mouseX < ax+aw && 
      mouseY > ay-ah && mouseY < ay+ah) { 
      stroke(255);
      aOver = true;
    } else {
      stroke(153); 
      aOver = false;
    }

    fill(0, 102, 153);
    textSize(32);
    text("Start!", 550, 480);
    fill(155, 155, 155);
  }
  public boolean mouseIn() {
    return mouseX > 450 && mouseX < 750 && 
      mouseY > 380 && mouseY < 580;
  }
}

