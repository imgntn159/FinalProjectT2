public class Player {
  private float x, y, w, h;
  private int health, atkSpd, aSCap, fmode;
  private PImage dude;
  int dMod;
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
    aSCap = 5;
    dude = loadImage("Dude.png");
    fmode = 1;
  }
  //access granted
  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }
  public PVector getVector(){
    return new PVector(x,y);
  }
  public int getHealth() {
    if (health <= 0){
      return 0;
    }
    return health;
  }
  public void damage(int d) {
    health -= d; //reduces health by d
  }
  
  //Attack Speed
  public int getAtkSpd(){
    return atkSpd;
  }
  public void setAS(int as){
    aSCap = as;
    aSr();
  }
  public void aSd() {//reduces attack speed timer (attackSpeedDown)
    if (atkSpd == 0) {
      return;
    } else {
      atkSpd--;
    }
  }
  public void aSr() {//resets attack speed timer (attackSpeedReset)
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
  void turn(Mouse m){
    PVector other = new PVector(m.getX()-x,m.getY()-y);
    rotate(other.heading());
  }
  
  void display() {
    imageMode(CENTER);
    image(dude,x,y);
  }
  boolean alive(){
    return health>0;
  }
  void switchF(){
    fmode *= -1;
  }
  void getGrenade(){
    fmode = 2;
  }
  /*void consume(PowerUp p){
    if*/
}

