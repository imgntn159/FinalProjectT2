public class Bullet {
  private float r;
  private int bulletDamage;
  private PVector location,velocity;
  public Bullet(float x, float y, float r,Mouse m) {
    this.r = r;
    float xSlope = m.getX() - x;
    float ySlope = m.getY() - y;
    bulletDamage = 1;
    location = new PVector(x,y);
    velocity = new PVector(xSlope,ySlope);
    velocity.normalize();
    velocity.mult(10);
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
  void shoot() {
    location = PVector.add(location,velocity);
  }
  public void display() {
    stroke(194);
    fill(1);
    ellipse(location.x, location.y, r, r);
  }
}

