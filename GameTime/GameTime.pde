import java.util.*;
PImage wall;
int mode;
Random r = new Random();
ArrayList<Bullet> bulletArr = new ArrayList<Bullet>();
ArrayList<Monster> monsterArr = new ArrayList<Monster>();
Player p1;
Mouse mouse;
Menu menu;

void setup() {
  size(1280, 720);
  mode = 1;
  p1 = new Player(600, 350, 50, 50);
  mouse = new Mouse(3, 3);
  menu = new Menu();
  wall = loadImage("W.jpeg");
}

void draw() {
  if (mode == 1) {//menu
    menu.display();
  } else {//literally the game
    background(155);
    image(wall, 650-(p1.getX()/10), 350-(p1.getY()/10));
    pushMatrix();
    translate(width/2, height/2);
    p1.move(mouse);
    translate(-p1.getX(), -p1.getY());
    pushMatrix();//rotation
    translate(p1.getX(), p1.getY());
    p1.turn(mouse);
    translate(-p1.getX(), -p1.getY());
    if (p1.getHealth()>0) {
      p1.display();
    }
    popMatrix();
    spawnMonster();
    mouse.display();
    fill(0);
    bulletShootMonster();
    p1.aSd();
    for (Bullet b : bulletArr) {

      pushMatrix();//rotation
      translate(b.getX(), b.getY());
      b.turn();
      translate(-b.getX(), -b.getY());
      b.display();
      popMatrix();

      b.shoot();
    }
    /* THIS PART MESSES WITH BULLET ARRAY HITCHECK
     INDEX OUT OF BOUNDS
     ArrayList<Bullet> tbulletArr = new ArrayList<Bullet>();
     if (b.rInc()) {
     tbulletArr.add(b);
     }
     }
     for (Bullet b : tbulletArr) {
     bulletArr.remove(b);
     }
     */
    Collide();
    monsterMovement();
    popMatrix();
  }
}

void bulletShootMonster() {//FUNCTION THAT LETS BULLETS SHOOT MONSTERS
  if (bulletArr.size()>0) {
    for (int b = 0; b < bulletArr.size (); b++) {
      for (int m = 0; m < monsterArr.size (); m++) {
        if (HitCheck(b, m, bulletArr.get(b).getR())) {
          b--;
        }
      }
    }
  }
}
void monsterMovement() { //FUNCTION THAT LETS MONSTERS MOVE AROUND
  for (Monster m : monsterArr) {
    m.follow(p1.getX(), p1.getY());
    playerDamaged(m);
    m.display();
    if (!m.getCollision())
      m.move();
  }
}
void mousePressed() {
  if (mode == 0) {
    if (p1.getAtkSpd() == 0) {
      Bullet bull = new Bullet(p1.getX(), p1.getY(), 10, mouse);
      bulletArr.add(bull);
      p1.aSr();
    }//added attack speed constraint
  } else if (mode == 1) {
    if (menu.mouseIn()) {
      mode = 0;
    }
  }
}
void playerDamaged(Monster m) {
  int r = 50;
  if (m.getX() <= p1.getX() + r &&
    m.getX() >= p1.getX() - r &&
    m.getY() <= p1.getY() + r &&
    m.getY() >= p1.getY() - r) {
    p1.damage(1);
  }
}
boolean HitCheck(int bi, int mi, float r) {
  Bullet b = bulletArr.get(bi);
  Monster m = monsterArr.get(mi);
  if (m.getX() <= b.getX() + r &&
    m.getX() >= b.getX() - r &&
    m.getY() <= b.getY() + r &&
    m.getY() >= b.getY() - r) {
    m.damage(b.getBulletDmg());
    if (m.shouldDie()) {
      monsterArr.remove(mi);
    }
    bulletArr.remove(bi);
    return true;
  }
  return false;
}

void Collide() {
  for (int i = 0; i < monsterArr.size (); i++) {
    Monster m = monsterArr.get(i);
    for (int f = i + 1; f < monsterArr.size (); f++) {
      m.collision(monsterArr.get(f));
    }
  }
}
void CheckCollide(Monster a, Monster b, int r) {//r being the radius check of monster a
  if (a.getX() <= b.getX() + 60 &&
    a.getX() >= b.getX() - 60 &&
    a.getY() <= b.getY() + 60 &&
    a.getY() >= b.getY() - 60) {
    a.setCollision(true);
  }
  else{
   a.setCollision(false); 
  }
}
void spawnMonster() {
  if (r.nextInt(100) < 1) {
    Monster john = new Monster(r.nextInt(1000), r.nextInt(1000), 5);
    monsterArr.add(john);
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

