public class Animation{
  String base;
  int x, y, frame, maxL;
  private PImage pic;
  public Animation(String s, int maxL, int x, int y){
    this.x = x;
    this.y = y;
    base = s;
    this.maxL = maxL;
    frame = 0;
  }
  public boolean advance(){
    frame++;
    return frame >= maxL;
  }
  void display(){
    if(frame >= maxL){
      pic = loadImage(base + "/" + base + frame + ".png");
      imageMode(CENTER);
      image(pic,x,y);
    }
  }
}
