public class Bullet {
  private float x, y, v, r;
  private int bulletDamage;
  public Bullet(float x, float y, float v, float r) {
    this.x = x;
    this.y = y;
    this.v = v;
    this.r = r;
    bulletDamage = 1;
  }
  //access granted
  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }
  public float getV() {
    return v;
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
  public void draw() {
    stroke(0);
    fill(1);
    ellipse(x, y, 2, 2);
  }
}


