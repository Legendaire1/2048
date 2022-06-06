Grid grid;

void setup(){
  size(645,743);
  grid= new Grid(4,4);
  grid.initialspawn();
}

void draw(){
  grid.display();
}

void keyPressed() {
  if (key == 'w') {
    makeBefore();
    grid.shift(2);
    makeAfter();
    if (compare(grid.before,grid.after) == true) {}
    else {grid.spawn();}
  }
  if (key == 'a') {
  makeBefore();
    grid.shift(0);
    makeAfter();
    if (compare(grid.before,grid.after) == true) {}
    else {grid.spawn();}
  }
  if (key == 's') {
   makeBefore();
    grid.shift(3);
    makeAfter();
    if (compare(grid.before,grid.after) == true) {}
    else {grid.spawn();}
  }
  if (key == 'd') {
  makeBefore();
    grid.shift(1);
  makeAfter();
    if (compare(grid.before,grid.after) == true) {}
    else {grid.spawn();}
  }
  
  if (key == CODED) {
    if (keyCode == UP) {
      makeBefore();
      grid.shift(2);
     makeAfter();
    if (compare(grid.before,grid.after) == true) {}
    else {grid.spawn();}
    } 
    if (keyCode == DOWN) {
    makeBefore();
      grid.shift(3);
     makeAfter();
    if (compare(grid.before,grid.after) == true) {}
    else {grid.spawn();}
    }
   if (keyCode == RIGHT) {
      makeBefore();
      grid.shift(1);
     makeAfter();
    if (compare(grid.before,grid.after) == true) {}
    else {grid.spawn();}
    } 
    if (keyCode == LEFT) {
      makeBefore();
      grid.shift(0);
    makeAfter();
    if (compare(grid.before,grid.after) == true) {}
    else {grid.spawn();}
    } 
    }
}
    void makeBefore() {
      for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
          grid.before[i][j].num = grid.grids[i][j].num;
        }
      }
    }
    
    void makeAfter() {
      for (int i = 0; i < 4; i++) {
        for (int j = 0; j < 4; j++) {
          grid.after[i][j].num = grid.grids[i][j].num;
        }
      }
    }
    boolean compare(Tiles[][] before, Tiles[][] after) {
       for (int i = 0; i < 4; i++) {
         for (int j = 0; j < 4; j++) {
            if (before[i][j].num != after[i][j].num) {
              return false;
              
            }
         }
       }
       return true;
    }
