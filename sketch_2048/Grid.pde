class Grid{
  Tiles[][] grids;
  int rows;
  int cols;
  
  static final int left = 0;
  static final int right = 1;
  static final int up = 2;
  static final int down = 3;
  
  Grid(int cols_in, int rows_in){
    rows = rows_in;
    cols = cols_in;
    grids = new Tiles[cols][rows];
    for(int i=0;i<rows;i++){
      for(int j=0;j<cols;j++){
        grids[i][j] = new Tiles(72.5+j*125,200+i*125,125,"EMPTY",0);
      }
    }
  }
  
  void display(){
    for(int i=0;i<rows;i++){
      for(int j=0;j<cols;j++){
        grids[i][j].display();
      }
    }
  }
  
  void spawn(){
    int i=int(random(rows));
    int j=int(random(rows));
    int i1=int(random(cols));
    int j1=int(random(cols));
    grids[i][j].num=2;
    grids[i1][j1].num=2;
  }
  
  int shift(int direction){
    if (direction == left) {
      
    }
    if (direction == right) {
      
    }
    if (direction == up) {
      
    }
    if (direction == down) {
      
    }
    return 0;
  }
}
