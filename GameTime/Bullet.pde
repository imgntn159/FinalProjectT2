public class Bullet{
  private float x,y,v;
  public Bullet(float x,float y,float v){
    this.x = x;
    this.y = y;
    this.v = v;
  }
  //access granted
  public float getX(){
    return x;
  }
  public float getY(){
    return y;
  }
  public float getV(){
    return v;
  }
  public void draw(){
    stroke(0);
    fill(c);
    ellipse(x, y, r*2, r*2);
  }
}
  


