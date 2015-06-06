public class Menu {
  int ax,ay,aw,ah;
   PImage intro;
  boolean aOver;
  public Menu(){
     intro = loadImage("K.jpg");
    ax = width/2;
    ay = height/2;
    aw = 100;
    ah = 100;
  }
  void display() {
    // Test if the cursor is over the box 
    background(intro);
    fill(153);
    if (mouseX > ax-aw && mouseX < ax+aw && 
        mouseY > ay-ah && mouseY < ay+ah) { 
      stroke(255);
      aOver = true;
    }else{stroke(153); aOver = false;}
    rectMode(CENTER);
    rect(ax,ay,aw,ah);
    fill(0, 102, 153);
    textSize(32);
    text("Start!",ax-(aw/2),ay);
  }
  public boolean mouseIn(){
    return mouseX > ax-aw && mouseX < ax+aw && 
        mouseY > ay-ah && mouseY < ay+ah;
  }
}

