public class Bullet {
  private float r,range,mrange;
  private int bulletDamage;
  private PVector location,velocity;
  private PImage sprite;
  public Bullet(float x, float y, float r, int d, Mouse m) {
    this.r = r;
    float xSlope = m.getX() - x;
    float ySlope = m.getY() - y;
    bulletDamage = d;
    location = new PVector(x,y);
    velocity = new PVector(xSlope,ySlope);
    velocity.normalize();
    velocity.mult(10);
    sprite = loadImage("bullSprite.png");
    range = 0;
    mrange = 50;
  }
  public Bullet(float x, float y, float r, int d, Mouse m, float a) {
    this(x,y,r,d,m);
    velocity.rotate(a);
    bulletDamage = 20;
    mrange = 30;
    sprite = loadImage("pellSprite.png");
  }
  //access granted
  public float getX() {
    return location.x;
  }
  public float getY() {
    return location.y;
  }
  public float getR() {
    return r;
  }
  public void setBulletDmg(int i) {
    bulletDamage = i;
  }
  public int getBulletDmg() {
    return bulletDamage;
  }
  public boolean rInc(){
    range++;
    return range >= mrange;
  }
  void shoot() {
    location = PVector.add(location,velocity);
  }
  void turn(){
    PVector other = new PVector(velocity.x,velocity.y);
    rotate(other.heading());
  }
  public void display() {
    imageMode(CENTER);
    image(sprite,location.x,location.y);
  }
}
