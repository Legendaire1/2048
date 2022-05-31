class Grid{
  Tiles[][] grids;
  int rows;
  int cols;
  
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
  
  boolean full(){
  }
  
  void shift(){
  }
}
