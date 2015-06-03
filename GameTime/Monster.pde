public class Monster {
  private float x, y, v,xSlope,ySlope;
  private int health;
  PVector location,velocity;
  //access granted
  public Monster(int x, int y, int v) {
    this.x = x;
    this.y = y;
    this.v = v;
    location = new PVector(x,y);
    health = 10;
  }
  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }
  public float getV() {
    return v;
  }
  public boolean shouldDie() {
    return health <= 0;
  }
  public void collision() {
    //I'm thinking we should have a similar method in the main also
  }
  public void damage(int d) {
    health -= d; //reduces health by d
  }
  void follow(float playerX, float playerY){
    xSlope = x-playerX;
    ySlope = y-playerY;
    if(ySlope < 0){
     y+=1; 
    }
    else{
     y-=1; 
    }
    if(xSlope < 0){
     x +=1;
    }
    else{
      x -=1;
    }

  }
  void display() {
    //stroke(0);
    fill(1);
    ellipse(x,y, 100, 100);
  }
}

