public class Animation{
  String base;
  int x, y, frame, maxL, timer, r;
  float rotation;
  private PImage pic;
  public Animation(String s, int maxL, int x, int y){
    this.x = x;
    this.y = y;
    base = s;
    this.maxL = maxL;
    this.rotation = rotation;
    frame = 0;
    timer = 0;
  }
  public Animation(String s, int maxL, PVector v, float r, float rotation){
    x = (int)v.x;
    y = (int)v.y;
    base = s;
    this.maxL = maxL;
    this.rotation = rotation;
    this.r = (int)r;
    frame = 0;
    timer = 0;
  }
  public boolean advance(){
    timer++;
    if(timer >=10){
      frame++;
      timer = 0;
    }
    return frame >= maxL;
  }
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
  void turn(){
    rotate(rotation);
  }
  void display(){
    if(frame <= maxL){
      pic = loadImage(base + "/" + frame + ".png");
      pic.resize(r+10,r+10);
      imageMode(CENTER);
      image(pic,x,y);
    }
  }
}
