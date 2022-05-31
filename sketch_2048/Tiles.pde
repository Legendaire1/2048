class Tiles{
  float x;
  float y;
  int size;
  String state;
  int num;
  
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
    
  }
}
    
    
