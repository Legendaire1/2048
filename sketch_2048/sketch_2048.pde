void setup(){
  size(645,743);
}

void draw(){
  for(int i=0;i<4;i++){
    for(int j=0;j<4;j++){
      strokeWeight(15);
      stroke(142,142,142);
      rect(72.5+i*125,200+j*125,125,125);
    }
  }
}
