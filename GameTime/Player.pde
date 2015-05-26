public class Player{
  private float x,y;
  private int health,atkSpd,aSCap;
    boolean left = false;
  boolean right = false;
  public Player(float xcor,float ycor){
    x=xcor;
    y=ycor;
    health = 20;
    atkSpd = 0;
    aSCap = 10;
  }
  //access granted
  public float getX(){
    return x;
  }
  public float getY(){
    return y;
  }
  public int getHealth(){
    return health;
  }
  public void damage(int d){
   health -= d; //reduces health by d 
  }
  public void aSd(){//reduces attack speed timer (attackSpeedDown)
    if (atkSpd == 0){
      return;
    }else{
      atkSpd--;
    }
  }
  public void aSr(){//resets attack speed timer (attackSppedReset)
    atkSpd = aSCap;
  }
    void setLeft(boolean x) {
    left=x;
  }
  void setRight(boolean x) {
    right = x;
  }
  void display() {
    rectMode(CENTER);
    stroke(255, 153, 0);
    rect(200, 200, 100, 100);//rect is easier than ellipse for sprite
    //for rect(the first 2 param specify the coordinates
    //last 2 specify the width n height
  }
  void move(){
    
     if (left) {      
      x=x-5;
    }
    if (right) {
      if(x < width){
      x+=5;
      }
    }
  }
}
