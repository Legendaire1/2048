class Tiles{
  float x;
  float y;
  int size;
  String state;
  int num;
  Tiles left,right,up,down;
  
  Tiles(float x_in,float y_in, int size_in, String state_in, int num_in){
    x = x_in;
    y = y_in;
    size = size_in;
    state = state_in;
    num = num_in;
  }
  
  void display(){
    strokeWeight(15);
    stroke(142,142,142);
    rect(x,y,size,size);
    fill(0);
    textSize(50);
    textAlign(CENTER);
    if (num != 0) {
    text(num,x+size/2,y+15+size/2);
    }
  }
  
  void setColor() {
    if (this.num == 0) {
      fill(214,180,180);
    }
    if (this.num == 2) {
      fill(255,240,240);
    }
    if (this.num == 4) {
      fill(240,235,210);
    }
    if (this.num == 8) {
      fill(211,188,141);
    }
    if (this.num == 16) {
      fill(229,158,109);
    }
    if (this.num == 32) {
      fill(255,102,102);
    }
    if (this.num == 64) {
      fill(217,68,30);
    }
  }
  
  
}
