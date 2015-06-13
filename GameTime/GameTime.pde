import java.util.*;
import ddf.minim.*;
//sound
Minim laserm;
AudioSample laserp;
Minim monS;
AudioSample monsterDeath;
Minim minim;
AudioPlayer player;
//awall
PImage wall;
//other stuffs
int mode;
Random r = new Random();
ArrayList<Bullet> bulletArr = new ArrayList<Bullet>();
ArrayList<Monster> monsterArr = new ArrayList<Monster>();
float time;
Player p1;
Mouse mouse;
Menu menu;
//score
int score;
//why
boolean shooting = false;

void setup() {
  size(1280, 720);
  mode = 1;
  p1 = new Player(600, 350, 50, 50);
  mouse = new Mouse(3, 3);
  menu = new Menu();
  wall = loadImage("W.png");
  time = 0;
  minim = new Minim(this);
  monS = new Minim(this);
  monsterDeath = monS.loadSample("combobreak.wav");
  player = minim.loadFile("song.mp3");
  laserm = new Minim(this);
  laserp = laserm.loadSample("laser.wav");
  score = 0;
}

void draw() {
  if (mode == 1) {//menu
    menu.display();
    score=0;
  } else {//literally the game
    player.play();
    time+=.00001;
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
    if (p1.alive()) {
      p1.display();
    }
    popMatrix();

    pushMatrix();//mouse rotation
    translate(mouse.getX(), mouse.getY());
    rotate(radians(frameCount%360));
    translate(-mouse.getX(), -mouse.getY());
    mouse.display();
    popMatrix();
   
    p1.aSd();
    constantFIRE();
    
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
    
    spawnMonster(); 
    bulletShootMonster(); 
    fill(0);
    //Collide();
    monsterMovement();
    obstacle();
    popMatrix();
    
    textSize(32); // Set text size to 32
    fill(0);
    text(""+p1.getHealth(), 0, 40);
    text(""+score, 0, 80);
    
    if(!p1.alive()){
      textSize(90);
      text("GAME OVER",width/2,height/2);
      textSize(40);
      text("Press M to go back to the menu",width/2,height/2 + 100);
      monsterArr = new ArrayList<Monster>();
    }
  }
}

void obstacle() {
  rect(-2100, -1000, 50, 5000); 
  rect(2050, -1000, 50, 5000);
  rect(-1000, 950, 50000, 50);
  rect(-1000, -1000, 50000, 50);
}

void bulletShootMonster() {//FUNCTION THAT LETS BULLETS SHOOT MONSTERS
  for (int b = 0; b < bulletArr.size (); b++) {
    for (int m = 0; m < monsterArr.size (); m++) {
      if (b>0 && bulletArr.size() >0) {
        if (HitCheck(b, m, bulletArr.get(b).getR()+5))
          if (b>0 && bulletArr.size() >0)
            b--;
      }
    }
  }
}
void monsterMovement() { //FUNCTION THAT LETS MONSTERS MOVE AROUND
  for (Monster m : monsterArr) {
    m.follow(p1);
    playerDamaged(m);
    m.display();
  }
}
void playerDamaged(Monster m) {
  float r = m.getR() * .5;
  if (m.getX() <= p1.getX() + r &&
    m.getX() >= p1.getX() - r &&
    m.getY() <= p1.getY() + r &&
    m.getY() >= p1.getY() - r) {
    p1.damage(1);
  }
}
boolean HitCheck(int bi, int mi, float r) {
  r-=3;
  Bullet b = bulletArr.get(bi);
  Monster m = monsterArr.get(mi);
  float rad = m.getR() * .5;
  if (m.getX()-rad <= b.getX() + r &&
    m.getX()+rad >= b.getX() - r &&
    m.getY()-rad <= b.getY() + r &&
    m.getY()+rad >= b.getY() - r) {
    m.damage(b.getBulletDmg());
    if (m.shouldDie()) {
      score+=10;
      monsterArr.remove(mi);
      monsterDeath.trigger();
    }
    bulletArr.remove(bi);
    return true;
  }
  return false;
}

/*void Collide() {
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
  } else {
    a.setCollision(false);
  }
}
*/
void spawnMonster() {
  if (time > 10)
    time = 10;
  if (r.nextInt(100) < 1+(time)) {
    Monster john = new Monster(r.nextInt(4000)-2000, r.nextInt(2000)-1000);
    monsterArr.add(john);
  }
}

void mousePressed() {
  if (mode == 0 && p1.alive()) {
    if (p1.getAtkSpd() == 0) {
      if (p1.fmode == 1) {
        laserp.trigger();
        Bullet bull = new Bullet(p1.getX(), p1.getY(), 10, 3+p1.dMod, mouse);
        bulletArr.add(bull);
        p1.aSr();
      } else {
        laserp.trigger();
        Bullet bull1 = new Bullet(p1.getX(), p1.getY(), 10, 20+p1.dMod, mouse, 0);
        Bullet bull2 = new Bullet(p1.getX(), p1.getY(), 10, 20+p1.dMod, mouse, PI/6);
        Bullet bull3 = new Bullet(p1.getX(), p1.getY(), 10, 20+p1.dMod, mouse, -PI/6);
        Bullet bull4 = new Bullet(p1.getX(), p1.getY(), 10, 20+p1.dMod, mouse, PI/12);
        Bullet bull5 = new Bullet(p1.getX(), p1.getY(), 10, 20+p1.dMod, mouse, -PI/12);
        bulletArr.add(bull1);
        bulletArr.add(bull2);
        bulletArr.add(bull3);
        bulletArr.add(bull4);
        bulletArr.add(bull5);
        p1.aSr();
      }
    }//added attack speed constraint
  } else if (mode == 1) {
    if (menu.mouseIn()) {
      mode = 0;
      p1.fmode = 1;
    }
  }
}
void mouseReleased(){
  shooting = false;
}
void mouseDragged(){
  shooting = true;
}

void constantFIRE(){
  if (mode == 0 && p1.alive() && shooting == true) {
    if (p1.getAtkSpd() == 0) {
      if (p1.fmode == 1) {
        laserp.trigger();
        Bullet bull = new Bullet(p1.getX(), p1.getY(), 10, 3+p1.dMod, mouse);
        bulletArr.add(bull);
        p1.aSr();
      } /*else {
        laserp.trigger();
        Bullet bull1 = new Bullet(p1.getX(), p1.getY(), 10, 20+p1.dMod, mouse, 0);
        Bullet bull2 = new Bullet(p1.getX(), p1.getY(), 10, 20+p1.dMod, mouse, PI/6);
        Bullet bull3 = new Bullet(p1.getX(), p1.getY(), 10, 20+p1.dMod, mouse, -PI/6);
        bulletArr.add(bull1);
        bulletArr.add(bull2);
        bulletArr.add(bull3);
        p1.aSr();
      }*/
    }//added attack speed constraint
  }
}

void keyPressed() {
  if (p1.alive()) {

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
    if (key== 'f' || key== 'F') {
      if (p1.fmode>0) {
        p1.setAS(20);
      } else {
        p1.setAS(5);
      }
      p1.switchF();
    }
  }
  if (key== 'm'||key=='M') {
    mode = 1;
    p1 = new Player(600, 350, 50, 50);
    mouse = new Mouse(3, 3);
    bulletArr = new ArrayList<Bullet>();
    monsterArr = new ArrayList<Monster>();
    player.rewind();
    player.pause();
    score = 0;
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

