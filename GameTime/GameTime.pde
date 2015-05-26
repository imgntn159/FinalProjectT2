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
  for(int b = 0;b < bulletArr.size();b++){
    for (int m = 0;m < monsterArr.size();m++){
      HitCheck(b,m,bulletArr.get(b).getR());
    }
  }
  p1.aSd();
  for(Bullet b : bulletArr){
    b.draw();
  }
  for(Monster m : monsterArr){
    m.display();
  }
  rect(mouseX,mouseY,3,3);//soon to be recticle
}

void mousePressed(){
  //shoot a bullet at the mouse direction
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

public void CheckCollide(Monster a, Monster b, float r){//r being the radius check of monster a
  if (a.getX() <= b.getX() + r &&
    a.getX() >= b.getX() - r &&
    a.getY() <= b.getY() + r &&
    a.getY() >= b.getY() - r){
      a.collision();
   }
}
     void keyPressed() {
  
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
   
   if (key== 'a'||key=='A') {
      p1.setLeft(false);
    }
    if (key == 'd' || key =='D') {
      p1.setRight(false);
  }
}

