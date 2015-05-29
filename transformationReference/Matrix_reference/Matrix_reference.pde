void setup(){
 size(600,600); 
}

void axis(){
  line(width/2,0,width/2,height);
  line(0,height/2,width,height/2); 
}

void draw(){
  background(255);
  stroke(255,0,0);
  axis();
  
  stroke(0,0,255);
  pushMatrix();
  
  //rotate by 10 deg
  translate(mouseX-width/2,mouseY-height/2);
  translate(width/2,height/2);
  rotate(radians(-frameCount%360));
  translate(-width/2,-height/2);
  
  //translate after rotate
  //translate(20,40);
  
  
  axis();
  popMatrix();
}
