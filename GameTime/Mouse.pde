public class Mouse {
  private float x, y, w, h, xmod, ymod;
  boolean left = false;
  boolean right = false;
  boolean up = false;
  boolean down = false;
  public Mouse(float xcor, float ycor, float w, float h) {
    x=xcor;
    y=ycor;
    this.w = w;
    this.h = h;
  }
  //access granted
  public float getX() {
    return x;
  }
  public float getY() {
    return y;
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
  
  //Movement
  void setUp(boolean x) {
    up = x;
  }
  void setDown(boolean x) {
    down = x;
  }
  void setLeft(boolean x) {
    left=x;
  }
  void setRight(boolean x) {
    right = x;
  }
  void move() {
    if (up) {
      y=y-5;
      translate(0,5);
    }
    if (down) {
      y=y+5;
      translate(0,-5);
    }
    if (left) {      
      x=x-5;
      translate(5,0);
    }
    if (right) {
      x+=5;
      translate(-5,0);
    }
  }
  
  void display() {
    rectMode(CENTER);
    stroke(255, 153, 0);
    rect(mouseX+xmod, mouseY+ymod, w, h);//rect is easier than ellipse for sprite
    //for rect(the first 2 param specify the coordinates
    //last 2 specify the width n height
  }
}

