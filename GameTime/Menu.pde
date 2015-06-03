public class Menu {
  int ax,ay,aw,ah;
  boolean aOver;
  public Menu(){
    ax = width/2;
    ay = height/2;
    aw = 100;
    ah = 100;
  }
  void display() {
    // Test if the cursor is over the box 
    fill(153);
    background(307);
    if (mouseX > ax-aw && mouseX < ax+aw && 
        mouseY > ay-ah && mouseY < ay+ah) { 
      stroke(255);
      aOver = true;
    }else{stroke(153); aOver = false;}
    rectMode(CENTER);
    rect(ax,ay,aw,ah);
  }
  public boolean mouseIn(){
    return mouseX > ax-aw && mouseX < ax+aw && 
        mouseY > ay-ah && mouseY < ay+ah;
  }
}

