import java.util.*;
public class Monster {
  Random rand = new Random();
  private float x, y, v, r, xSlope, ySlope;
  float xlim = 25;
  float ylim = 25;
  private int health;
  boolean collisionRight, collisionLeft, collisionUp, collisionDown, collision;
  PVector location, velocity;
  //access granted
  public Monster(int x, int y) {
    this.x = x;
    this.y = y;
    v=rand.nextInt(4)+1;
    r= rand.nextInt(50)+50;
    location = new PVector(x, y);
    health = (int)r/5;
    collisionRight = false;
    collisionLeft = false;
    collisionUp = false;
    collisionDown = false;
    collision = false;
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
  float getR() {
    return r;
  }
  public boolean shouldDie() {
    return health <= 0;
  }

  public void damage(int d) {
    health -= d; //reduces health by d
  }
  void move() {

    if (collisionRight)
      x-=v;
    if (collisionLeft)
      x+=v;
    if (collisionUp)
      y+=v;
    if (collisionDown)
      y-=v;
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
  void display() {
    //stroke(0);
    fill(1);
    ellipse(x, y, r, r);
  }
}

