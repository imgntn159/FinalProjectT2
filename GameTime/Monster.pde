import java.util.*;
public class Monster {
  Random rand = new Random();
  private int v, r;
  private int health;
  PVector location,direction;
  PImage zombie;
  //access granted
  public Monster(int x, int y) {
    v=rand.nextInt(4)+1;
    r= rand.nextInt(50)+50;
    location = new PVector(x, y);
    direction = new PVector(x, y);
    health = (int)r/5;
    zombie = loadImage("zombie.png");
    zombie.resize(r+10,r+10);
  }
  public float getX() {
    return location.x;
  }
  public float getY() {
    return location.y;
  }
  public float getV() {
    return v;
  }
  public PVector getVector() {
    return location;
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
  void follow(Player p) {
    direction = PVector.sub(p.getVector(),location);
    direction.normalize();
    direction.mult(v);
    location = PVector.add(location,direction);
  }
  void turn(){
    rotate(direction.heading());
  }
  void display() {
    //stroke(0);
    //fill(1);
    //ellipse(location.x, location.y, r, r);
    imageMode(CENTER);
    image(zombie,location.x,location.y);
  }
}

