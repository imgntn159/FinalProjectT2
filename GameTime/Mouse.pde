public class Mouse {
  private float w, h, xmod, ymod;
  public Mouse(float w, float h) {
    this.w = w;
    this.h = h;
  }
  //access granted
  public float getX() {
    return mouseX;
  }
  public float getY() {
    return mouseY;
  }
  public float getXmod() {
    return xmod;
  }
  public float getYmod() {
    return ymod;
  }
  
  public void setXmod(float xmod){
    this.xmod = xmod;
  }
  public void setYmod(float ymod){
    this.ymod = ymod;
  }
  
  void display() {
    rectMode(CENTER);
    stroke(255, 153, 0);
    rect(mouseX+xmod, mouseY+ymod, w, h);//rect is easier than ellipse for sprite
    //for rect(the first 2 param specify the coordinates
    //last 2 specify the width n height
  }
}

