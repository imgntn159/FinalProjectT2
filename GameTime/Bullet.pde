public class Bullet {
  private float x, y, v, r, mouseCorX, mouseCorY, playerX, playerY;
  private float xSlope, ySlope;
  private int bulletDamage;
  public Bullet(float x, float y, float v, float r, 
  float mX, float mY) {
    this.x = x;
    this.y = y;
    this.v = v;
    this.r = r;
    mouseCorX = mX;
    mouseCorY = mY;
    playerY = y;
    playerX = x;
    xSlope = mX - playerX;
    ySlope = mY - playerY;
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
  void shoot() {
    x += xSlope/10;
    y += ySlope/10;
  }
  public void display() {
    stroke(194);
    fill(1);
    ellipse(x, y, r, r);
  }
}

