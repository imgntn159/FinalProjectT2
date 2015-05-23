Ball player;
boolean isUp, isSpace, isSpaceReleased;

void setup() {
  isSpaceReleased = true;
  size(200, 600);
  background(255);
  player = new Ball(width/2.0, 3*height/4.0);
  pushMatrix();
}


void draw() {
  popMatrix();
  background(255);
  fill(0);
  //text(frameCount+"", 20, 20);
  rect(10,10,20,20);
  player.draw();
  processKeys();
  pushMatrix();
}

public void processKeys() {
  if (isUp) {
    player.setY(player.getY()-2.0);
    translate(0,2);
  }
  if (isSpace && isSpaceReleased) {
    isSpaceReleased = false; 
    //don't do this again until you release it
    player.randomColor();
  }
}

void keyReleased() {
  if (keyCode == 32) {//space
    isSpace = false;
    isSpaceReleased = true;
  }
  if (keyCode == 38) {//up
    isUp = false;
  }
}

void keyPressed() {
  if (keyCode == 32) {//space
    isSpace = true;
  }
  if (keyCode == 38) {//up
    isUp = true;
  }
}
