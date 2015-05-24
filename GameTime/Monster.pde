public abstract class Monster{
  private float x,y,v;
  private int health;
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
  public boolean shouldDie(){
    return health <= 0;
  }
  public void draw(){
    stroke(0);
    fill(c);
    ellipse(x, y, r*2, r*2);
  }
}
  
