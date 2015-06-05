import java.util.*;
int mode;
Random r = new Random();
ArrayList<Bullet> bulletArr = new ArrayList<Bullet>();
ArrayList<Monster> monsterArr = new ArrayList<Monster>();
Player p1;
Monster m;
Mouse mouse;
Menu menu;

void setup() {
  size(1200, 700);
  mode = 1;
  p1 = new Player(600, 350, 50, 50);
  mouse = new Mouse(3, 3);
  m = new Monster(900, 350, 5);
  menu = new Menu();
  monsterArr.add(m);
}

void draw() {
  if (mode == 1) {//menu
    menu.display();
  } else {//literally the game
    background(155);
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

      pushMatrix();//rotation
      translate(b.getX(), b.getY());
      b.turn();
      translate(-b.getX(), -b.getY());
      b.display();
      popMatrix();

      b.shoot();
      if (b.rInc()) {
        tbulletArr.add(b);
      }
    }
    for (Bullet b : tbulletArr) {
      bulletArr.remove(b);
    }

    for (Monster m : monsterArr) {
      m.follow(p1.getX(), p1.getY());
      playerDamaged(m);
      m.display();
    }
    popMatrix();
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
public void playerDamaged(Monster m) {
  int r = 50;
  if (m.getX() <= p1.getX() + r &&
    m.getX() >= p1.getX() - r &&
    m.getY() <= p1.getY() + r &&
    m.getY() >= p1.getY() - r) {
    p1.damage(1);
  }
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

