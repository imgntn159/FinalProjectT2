public class Player {
  private float x, y, w, h;
  private int health, atkSpd, aSCap;
  private PImage dude;
  boolean left = false;
  boolean right = false;
  boolean up = false;
  boolean down = false;
  public Player(float xcor, float ycor, float w, float h) {
    x=xcor;
    y=ycor;
    this.w = w;
    this.h = h;
    health = 100;
    atkSpd = 0;
    aSCap = 10;
    dude = loadImage("Dude.png");
  }
  //access granted
  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }
  public int getHealth() {
    return health;
  }
  public void damage(int d) {
    health -= d; //reduces health by d
  }
  public int getAtkSpd(){
    return atkSpd;
  }
  public void aSd() {//reduces attack speed timer (attackSpeedDown)
    if (atkSpd == 0) {
      return;
    } else {
      atkSpd--;
    }
  }
  public void aSr() {//resets attack speed timer (attackSppedReset)
    atkSpd = aSCap;
  }
  
  //Movement
  void setUp(boolean x) {
    up = x;
  }
  void setDown(boolean x) {
    down = x;
  }
  void setLeft(boolean x) {
    left=x;
  }
  void setRight(boolean x) {
    right = x;
  }
  
  void move(Mouse m) {
    if (up && y > -900) {
      y=y-5;
      m.setYmod(m.getYmod() - 5);
      //translate(0,5);
    }
    if (down && y < 900) {
      y=y+5;
      m.setYmod(m.getYmod() + 5);
      //translate(0,-5);
    }
    if (left && x > -2000) {      
      x=x-5;
      m.setXmod(m.getXmod() - 5);
      //translate(5,0);
    }
    if (right && x < 2000) {
      x+=5;
      m.setXmod(m.getXmod() + 5);
      //translate(-5,0);
    }
  }
  /*void dash(Mouse m){
    PVector location = new PVector(x,y);
    PVector velocity = new PVector(m.getX() - x, m.getY() - y);
    velocity.normalize();
    velocity.mult(20);
    location = PVector.add(location,velocity);
    x = location.x;
    y = location.y;
  }*/
  void turn(Mouse m){
    PVector other = new PVector(m.getX()-x,m.getY()-y);
    rotate(other.heading());
  }
  
  void display() {
    imageMode(CENTER);
    stroke(255, 153, 0);
    ellipse(x-10, y, w, h);//rect is easier than ellipse for sprite
    //for rect(the first 2 param specify the coordinates
    //last 2 specify the width n height
    image(dude,x,y);
  }
}

