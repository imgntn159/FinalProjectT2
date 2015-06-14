public class Grenade {
  private float r,range,mrange;
  private int grenadeDamage;
  private PVector olocation,location,velocity;
  private PImage sprite;
  public Grenade(float x, float y, float r, int d, Mouse m) {
    this.r = r;
    float xSlope = m.getX() - x;
    float ySlope = m.getY() - y;
    grenadeDamage = d;
    location = olocation = new PVector(x,y);
    velocity = new PVector(xSlope,ySlope);
    velocity.normalize();
    velocity.mult(5);
    sprite = loadImage("bomb.png");
    range = 0;
    //if (PVector.sub(location,m.getVector()).mag() > 60){
    //  mrange = 60;
    //} else {
      mrange = PVector.sub(location,m.getVector()).mag();
    //}
  }
  //access granted
  public float getX() {
    return location.x;
  }
  public float getY() {
    return location.y;
  }
  public PVector getVector(){
    return location;
  }
  public float getR() {
    return r;
  }
  public void setGrenadeDmg(int i) {
    grenadeDamage = i;
  }
  public int getGrenadeDmg() {
    return grenadeDamage;
  }
  public boolean rInc(){
    return PVector.sub(olocation,location).mag() >= mrange;
  }
  void shoot() {
    location = PVector.add(location,velocity);
  }
  void turn(){
    PVector other = new PVector(velocity.x,velocity.y);
    rotate(other.heading() + radians(frameCount%180));
  }
  public void display() {
    imageMode(CENTER);
    image(sprite,location.x,location.y);
  }
}
