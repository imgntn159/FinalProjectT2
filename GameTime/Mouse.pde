public class Mouse {
  private float w, h, xmod, ymod;
  private PImage cross = loadImage("cross.png");
  public Mouse(float w, float h) {
    this.w = w;
    this.h = h;
    cross.resize(50,50);
  }
  //access granted
  public float getX() {
    return mouseX+xmod-40;
  }
  public float getY() {
    return mouseY+ymod-10;
  }
  public PVector getVector(){
    return new PVector(getX(),getY());
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
    imageMode(CENTER);
    image(cross, getX(),getY());
  }
}

