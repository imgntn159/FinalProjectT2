public class Monster {
  private float x, y, v, xSlope, ySlope;
  float xlim = 25;
  float ylim = 25;
  private int health;
  boolean collisionRight, collisionLeft, collisionUp, collisionDown, collision;
  PVector location, velocity;
  //access granted
  public Monster(int x, int y, int v) {
    this.x = x;
    this.y = y;
    this.v = v;
    location = new PVector(x, y);
    health = 10;
    collisionRight = false;
    collisionLeft = false;
    collisionUp = false;
    collisionDown = false;
    collision = false;
  }
  public boolean getCollision() {
    return collision;
  }
  void setCollision(boolean col) {
    collision = col;
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

  public void damage(int d) {
    health -= d; //reduces health by d
  }
  void move() {
    if (collisionRight)
      x-=1;
    if (collisionLeft)
      x+=1;
    if (collisionUp)
      y+=1;
    if (collisionDown)
      y-=1;
  }
  void follow(float playerX, float playerY) {
    xSlope = x-playerX;
    ySlope = y-playerY;
    if (ySlope < 0) {
      collisionUp = true;
      collisionDown = false;
    } else {
      collisionDown = true;
      collisionUp = false;
    }
    if (xSlope < 0) {
      collisionLeft = true;
      collisionRight = false;
    } else {
      collisionLeft = false;
      collisionRight = true;
    }
  }
  void collision(Monster a) {
    float xlimit1 = a.getX() + (.5 * 50);//measures dimensions of obstacle
    float xlimit2 = a.getX() - (.5 * 50);
    float ylimit1 = a.getY()+ (.5 * 50);
    float ylimit2 = a.getY() - (.5 * 50);

    if ((x-xlim<xlimit1+1 && x> xlimit2 ) && (y > ylimit2 && y < ylimit1)) {//&& x < xlimit2 && y > ylimit1){
      collisionLeft=true; 
      collisionRight=false;
    } else {
      collisionLeft=false;
    }
    if ((x+xlim>xlimit2-1 && x< xlimit1 ) && (y > ylimit2 && y < ylimit1)) {
      collisionRight=true;
      collisionLeft=false;
    } else {
      collisionRight=false;
    }
    if ((x < xlimit1 && x>xlimit2) && (y+ylim > ylimit2-7 && y < ylimit1)) {//&& x < xlimit2 && y > ylimit1){
      collisionDown=true; 
      collisionUp=false;
    } else {
      collisionDown=false;
    }
    if ((x < xlimit1 && x>xlimit2) && (y> ylimit2 && y-ylim < ylimit1+10)) {//&& x < xlimit2 && y > ylimit1){
      collisionUp=true; 
      collisionDown=false;
    } else {
      collisionUp=false;
    }
    if (collisionLeft && !collisionRight) {  
      x=xlimit1+30;
    }
    if (collisionRight && !collisionLeft) {
      x=xlimit2 - 30;
    }
    if (collisionUp && !collisionDown) {      
      y=ylimit1+30;
    } else if (collisionDown && !collisionUp) {
      y=ylimit2-30;
    }
  }

  void display() {
    //stroke(0);
    fill(1);
    ellipse(x, y, 50, 50);
  }
}

