int mode;
ArrayList<Bullet> bulletArr = new ArrayList<Bullet>();
ArrayList<Monster> monsterArr = new ArrayList<Monster>();
Player p1;
Mouse mouse;

void setup() {
  size(1200, 700);
  mode = 0;
  p1 = new Player(600,350, 20,20);
  mouse = new Mouse(3,3);
  pushMatrix();
}

void draw() {
  popMatrix();
  //rect(600,350,20,20);
  background(0);
  p1.move(mouse);
  p1.display();
  mouse.display();
  fill(0);
  for (int b = 0; b < bulletArr.size (); b++) {
    for (int m = 0; m < monsterArr.size (); m++) {
      HitCheck(b, m, bulletArr.get(b).getR());
    }
  }
  p1.aSd();
  ArrayList<Bullet> tbulletArr = new ArrayList<Bullet>();
  for (Bullet b : bulletArr) {
    b.display();
    b.shoot();
    if(abs(b.getX() + b.getY()) >= 1200.0){
	tbulletArr.add(b);
    }
  }
  for (Bullet b: tbulletArr){
    bulletArr.remove(b);
  }
  for (Monster m : monsterArr) {
    m.display();
  }
  rect(900,350,100,100);
  pushMatrix();
}

void mousePressed() {
  if(p1.getAtkSpd() == 0){
      Bullet bull = new Bullet(p1.getX(), p1.getY(),10,mouse);
      bulletArr.add(bull);
      p1.aSr();
  }//added attack speed constraint
}

public void HitCheck(int bi, int mi, float r) {
  Bullet b = bulletArr.get(bi);
  Monster m = monsterArr.get(mi);
  if (m.getX() <= b.getX() + r &&
    m.getX() >= b.getX() - r &&
    m.getY() <= b.getY() + r &&
    m.getY() >= b.getY() - r) {
    bulletArr.remove(bi);
    m.damage(b.getBulletDmg());
    if (m.shouldDie()) {
      monsterArr.remove(mi);
    }
  }
}

public void CheckCollide(Monster a, Monster b, float r) {//r being the radius check of monster a
  if (a.getX() <= b.getX() + r &&
    a.getX() >= b.getX() - r &&
    a.getY() <= b.getY() + r &&
    a.getY() >= b.getY() - r) {
    a.collision();
  }
}
void keyPressed() {
  if (key== 's'||key=='S') {
    p1.setDown(true);
    p1.setUp(false);
  }
  if (key== 'W'||key=='w') {
    p1.setUp(true);
    p1.setDown(false);
  }
  if (key== 'a' || key== 'A') {
    p1.setLeft(true);
    p1.setRight(false);
  }
  if (key== 'd' || key== 'D') {
    p1.setLeft(false);
    p1.setRight(true);
  }
}
void keyReleased() {
  if (key== 'w'||key=='W') {
    p1.setUp(false);
  }
  if (key== 's'||key=='S') {
    p1.setDown(false);
  }
  if (key== 'a'||key=='A') {
    p1.setLeft(false);
  }
  if (key == 'd' || key =='D') {
    p1.setRight(false);
  }
}

