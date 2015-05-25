int mode;
ArrayList<Bullet> bulletArr = new ArrayList<Bullet>();
ArrayList<Monster> monsterArr = new ArrayList<Monster>();
Player p1;

void setup(){
  background(0);
  size(1200, 700);
   mode = 0;
   p1 = new Player(width/2,height/2);
}

void draw(){
  p1.display();
  fill(0);
  for(Bullet b : bulletArr){
    b.draw();
  }
  for(Monster m : monsterArr){
    m.draw();
  }
}

public void HitCheck(int bi, int mi,float r){
  Bullet b = bulletArr.get(bi);
  Monster m = monsterArr.get(mi);
  if (m.getX() <= b.getX() + r &&
    m.getX() >= b.getX() - r &&
    m.getY() <= b.getY() + r &&
    m.getY() >= b.getY() - r){
    bulletArr.remove(bi);
    m.damage(b.getBulletDmg());
    if(m.shouldDie()){
      monsterArr.remove(mi);
    }
  }
}
