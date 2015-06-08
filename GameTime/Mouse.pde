public class Mouse {
  private float w, h, xmod, ymod;
  private PImage cross = loadImage("cross.png");
  public Mouse(float w, float h) {
    this.w = w;
    this.h = h;
  }
  //access granted
  public float getX() {
    return mouseX+xmod;
  }
  public float getY() {
    return mouseY+ymod;
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
    //pushMatrix();
    imageMode(CENTER);
    //translate(-getX(),-getY());
    //rotate(radians(frameCount%360));
    //translate(getX(),getY());
    image(cross, getX(),getY());
    //popMatrix();
  }
}

