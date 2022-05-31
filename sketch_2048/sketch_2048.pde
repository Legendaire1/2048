void setup(){
  size(800,800);
}

void draw(){
  for(int i=0;i<4;i++){
    for(int j=0;j<4;j++){
      strokeWeight(15);
      stroke(142,142,142);
      rect(35+i*180,35+j*180,180,180);
    }
  }
}
