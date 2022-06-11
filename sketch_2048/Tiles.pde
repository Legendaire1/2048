class Tiles{
  float x;
  float y;
  int size;
  String state;
  int num;
  Tiles left,right,up,down;
  boolean combined;
  
  Tiles(float x_in,float y_in, int size_in, String state_in, int num_in){
    x = x_in;
    y = y_in;
    size = size_in;
    state = state_in;
    num = num_in;
    combined = false;
  }
  
  void display(){
    strokeWeight(15);
    stroke(187,173,160);
    rect(x,y,size,size);
    if (num > 4) {
      fill(255);
    }
    else {
    fill(100);
    }
    textSize(50);
    textAlign(CENTER);
    if (num != 0) {
    text(num,x+size/2,y+15+size/2);
    }
  }
  
  void setColor() {
    if (this.num == 0) {
      fill(205,193,180);
    }
    if (this.num == 2) {
      fill(238,228,218);
    }
    if (this.num == 4) {
      fill(238,225,201);
    }
    if (this.num == 8) {
      fill(243,178,122);
    }
    if (this.num == 16) {
      fill(246,150,100);
    }
    if (this.num == 32) {
      fill(247,124,95);
    }
    if (this.num == 64) {
      fill(247,95,59);
    }
    if (this.num == 128) {
      fill(237,208,115);
    }
    if (this.num == 256) {
      fill(237,202,100);
    }
    if (this.num == 512) {
      fill(238,200,66);
    }
    if (this.num == 1024) {
      fill(238,200,67);
    }
    if (this.num == 2048) {
      fill(236,195,48);
    }
  }
  
  
}
