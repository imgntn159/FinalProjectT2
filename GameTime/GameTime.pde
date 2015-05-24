int Mode;
ArrayList<Bullet> bulletArr = new ArrayList<Bullet>();
ArrayList<Monster> monsterArr = new ArrayList<Monster>();
Player p1;

void setup(){
  background(255);
  Mode = 0;
}

void draw(){
  fill(0);
  for(Bullet b : bulletArr){
    b.draw();
  }
  for(Monster m : monsterArr){
    m.draw();
  }
}

public void HitCheck(int bi, int mi,float r){
  b = bulletArr.get(bi);
  m = monsterArr.get(mi);
  if (m.getX() <= b.getX() + r &&
    m.getX() >= b.getX() - r &&
    m.getY() <= b.getY() + r &&
    m.getY() >= b.getY() - r){
    delBullet(bi);
    m.damage(p1.getBDmg());
    if(m.shouldDie()){
      delMonster(mi);
    }
  }
}
