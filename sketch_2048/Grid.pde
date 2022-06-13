class Grid {
  Tiles[][] grids;
  int rows;
  int cols;
  Tiles[][] before;
  Tiles[][] after;
  int score;

  static final int left = 0;
  static final int right = 1;
  static final int up = 2;
  static final int down = 3;

  Grid(int cols_in, int rows_in) {
    rows = rows_in;
    cols = cols_in;
    grids = new Tiles[cols][rows];
    before = new Tiles[rows][cols];
    after = new Tiles[rows][cols];
    for (int i=0; i<rows; i++) {
      for (int j=0; j<cols; j++) {
        grids[i][j] = new Tiles(72.5+j*125, 200+i*125, 125, "EMPTY", 0);
        before[i][j] = new Tiles(72.5+j*125, 200+i*125, 125, "EMPTY", 0);
        after[i][j] = new Tiles(72.5+j*125, 200+i*125, 125, "EMPTY", 0);
      }
    }
    setDir();
  }



  void display() {
    for (int i=0; i<rows; i++) {
      for (int j=0; j<cols; j++) {
        grids[i][j].setColor();
        grids[i][j].display();
      }
    }
  }

  boolean full() {
    for (int i=0; i<rows; i++) {
      for (int j=0; j<cols; j++) {
        if (grids[i][j].num == 0) {
          return false;
        }
      }
    }
    return true;
  }

  void initialspawn() {
    int i=int(random(rows));
    int j=int(random(rows));
    int i1=int(random(cols));
    int j1=int(random(cols));
    if (i == i1 && j == j1) {
      initialspawn();
    } else {
      grids[i][j].num=2;
      grids[i][j].combined = false;
      grids[i1][j1].num=2;
      grids[i1][j1].combined = false;
      setDir();
    }
  }

  void spawn() {
    if (full() == false) {
      int i=int(random(rows));
      int j=int(random(cols));
      int randNum = int(random(0, 100));
      if (grids[i][j].num == 0) {
        if (randNum <= 10) {
          grids[i][j].combined = false;
          grids[i][j].num = 4;
          setDir();
        } else {
          grids[i][j].combined = false;
          grids[i][j].num = 2;
          setDir();
        }
      } else {
        spawn();
      }
    } else {
    }
  }

  void shift(int dir) {
    if (dir == right) {
      for (int i=0; i<rows; i++) {
        for (int j=2; j>-1; j--) {
          if (grids[i][j].right.num != 0) {
            if (grids[i][j].right.num == grids[i][j].num) {
              if (grids[i][j].combined == false) {
                grids[i][j].right.num = grids[i][j].right.num * 2;
                score+=grids[i][j].right.num;
                grids[i][j].num = 0;
                grids[i][j].right.combined = true;
                shift(right);
              }
            }
          } else {
            int placeholder = grids[i][j].num;
            boolean p = grids[i][j].combined;
            grids[i][j].num = grids[i][j].right.num;
            grids[i][j].combined = grids[i][j].right.combined;
            grids[i][j].right.num = placeholder;
            grids[i][j].right.combined = p;
          }
        }
      }

      boolean a = false;
      for (int i=0; i < rows; i++) {
        for (int j=0; j < cols-1; j++) {
          if (grids[i][j].num != 0 && grids[i][j].right.num == 0) {
            a = true;
          }
          if (grids[i][j].num != 0 && grids[i][j].num == grids[i][j].right.num && grids[i][j].combined == false && grids[i][j].right.combined == false) {
            a = true;
          }
        }
      }
      if (a == true) {
        shift(right);
      }
    }
    if (dir == down) {
      for (int i=2; i>-1; i--) {
        for (int j=0; j<rows; j++) {
          if (grids[i][j].down.num != 0) {
            if (grids[i][j].down.num == grids[i][j].num) {
              if (grids[i][j].combined == false) {
                grids[i][j].down.num = grids[i][j].num * 2;
                grids[i][j].num = 0;
                score+=grids[i][j].down.num;
                grids[i+1][j].combined = true;
                shift(down);
              }
            }
          } else {
            int placeholder = grids[i][j].num;
            boolean p = grids[i][j].combined;
            grids[i][j].num = grids[i][j].down.num;
            grids[i][j].combined = grids[i][j].down.combined;
            grids[i][j].down.num = placeholder;
            grids[i][j].down.combined = p;
          }
        }
      }
      boolean a = false;
      for (int i=0; i < rows-1; i++) {
        for (int j=0; j < cols; j++) {
          if (grids[i][j].num != 0 && grids[i][j].down.num == 0) {
            a = true;
          }
          if (grids[i][j].num != 0 && grids[i][j].num == grids[i][j].down.num && grids[i][j].combined == false && grids[i][j].down.combined == false) {
            a = true;
          }
        }
      }
      if (a == true) {
        shift(down);
      }
    }
    if (dir == left) {
      for (int i=0; i <rows; i++) {
        for (int j=1; j<cols; j++) {
          if (grids[i][j].left.num != 0) {
            if (grids[i][j].left.num == grids[i][j].num) {
              if (grids[i][j].combined == false) {
                grids[i][j].left.num = grids[i][j].num * 2;
                grids[i][j].num = 0;
                grids[i][j-1].combined = true;
                score+=grids[i][j].left.num;
                shift(left);
                
              }
            }
          } else {
            int placeholder = grids[i][j].num;
            boolean p = grids[i][j].combined;
            grids[i][j].num = grids[i][j].left.num;
            grids[i][j].combined = grids[i][j].left.combined;
            grids[i][j].left.num = placeholder;
            grids[i][j].left.combined = p;
          }
        }
      }
      boolean a = false;
      for (int i=0; i < rows; i++) {
        for (int j=1; j < cols; j++) {
          if (grids[i][j].num != 0 && grids[i][j].left.num == 0) {
            a = true;
          }
          if (grids[i][j].num != 0 && grids[i][j].num == grids[i][j].left.num && grids[i][j].combined == false && grids[i][j].left.combined == false) {
            a = true;
          }
        }
      }
      if (a == true) {
        shift(left);
      }
    }
    if (dir == up) {
      for (int i=1; i <rows; i++) {
        for (int j=0; j<cols; j++) {
          if (grids[i][j].up.num != 0) {
            if (grids[i][j].up.num == grids[i][j].num) {
              if (grids[i][j].combined == false) {
                grids[i][j].up.num = grids[i][j].num * 2;
                grids[i][j].num = 0;
                score+=grids[i][j].up.num;
                grids[i-1][j].combined = true;
                shift(up);
              }
            }
          } else {
            int placeholder = grids[i][j].num;
            boolean p = grids[i][j].combined;
            grids[i][j].num = grids[i][j].up.num;
            grids[i][j].combined = grids[i][j].up.combined;
            grids[i][j].up.num = placeholder;
            grids[i][j].up.combined = p;
          }
        }
      }
      boolean a = false;
      for (int i=1; i < rows; i++) {
        for (int j=0; j < cols; j++) {
          if (grids[i][j].num != 0 && grids[i][j].up.num == 0) {
            a = true;
          }
          if (grids[i][j].num != 0 && grids[i][j].num == grids[i][j].up.num && grids[i][j].combined == false && grids[i][j].up.combined == false) {
            a = true;
          }
        }
      }
      if (a == true) {
        shift(up);
      }
    }
  }

  void setDir() {
    for (int i=0; i<rows; i++) {
      for (int j=0; j<cols; j++) {
        if (i == 3) {
          grids[i][j].down = null;
        } else {
          grids[i][j].down = grids[i+1][j];
        }
      }
    }
    for (int i=0; i<rows; i++) {
      for (int j=0; j<cols; j++) {
        if (i == 0) {
          grids[i][j].up = null;
        } else {
          grids[i][j].up = grids[i-1][j];
        }
      }
    }
    for (int i=0; i<rows; i++) {
      for (int j=0; j<cols; j++) {
        if (j == 0) {
          grids[i][j].left = null;
        } else {
          grids[i][j].left = grids[i][j-1];
        }
      }
    }
    for (int i=0; i<rows; i++) {
      for (int j=0; j<cols; j++) {
        if (j == 3) {
          grids[i][j].right = null;
        } else {
          grids[i][j].right = grids[i][j+1];
        }
      }
    }
  }
  
  void reset() {
    for (int i=0; i<rows; i++) {
      for (int j=0; j<cols; j++) {
        grids[i][j].num = 0;
      }
    }
    initialspawn();
    setDir();
  }
}
