public class Player{
  float x;
  float y;
  private int health;
  //access granted
  public Player(float xcor,float ycor){
    x=xcor;
    y=ycor;
  }
  public int getHealth(){
    return health;
  }
  void display() {
    rectMode(CENTER);
   stroke(255, 153, 0);
  rect(200, 200, 100, 100);//rect is easier than ellipse for sprite
  //for rect(the first 2 param specify the coordinates
  //last 2 specify the width n height
  }
}
