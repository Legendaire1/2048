class Tiles{
  int x;
  int y;
  int size;
  String state;
  color c;
  int num;
  
  Tiles(int x_in,int y_in, int size_in, String state_in, color c_in, int num_in){
    x = x_in;
    y = y_in;
    size = size_in;
    state = state_in;
    c = c_in;
    num = num_in;
  }
  
  void display(){
    fill(c);
    rect(x,y,size,size);
  }
}
    
    
