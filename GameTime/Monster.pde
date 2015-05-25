public abstract class Monster{
  private float x,y,v;
  private int health;
  //access granted
  public Monster(int x, int y, int v){
    this.x = x;
    this.y = y;
    this.v = v;
    health = 10;
  }
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
  public void collision(){
    //dicks
  }
  public void damage(int d){
   health -= d; //reduces health by d 
  }
  void display(){
    stroke(0);
    fill(1);
    ellipse(x, y, 2, 2);
  }
}
  
