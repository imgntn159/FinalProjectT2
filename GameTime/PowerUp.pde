public class PowerUp {
  int type;//0 is health, 1 is damage increase I guess, 2 might be attack speed
  int value;//^
  int effecttime;

  int timer;//how long will it stay on the ground
  int x, y;
  PImage sprite;

  public PowerUp(int x, int y, int t, int v) {
    this.x=x;
    this.y=y;
    type = t;
    value = v;
    timer = 180;
    if (t == 0) {
      sprite = loadImage("health.PNG");
    }
  }
  public boolean timeOut() {
    timer--;
    if (timer<=0) {
      return true;
    }
    return false;
  }
  public int getType() {
    return type;
  }
  public int getValue() {
    return value;
  }
  public PVector getVector() {
    return new PVector(x, y);
  }
  public void display() {
    imageMode(CENTER);
    image(sprite, x, y);
  }
}
