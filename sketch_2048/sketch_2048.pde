Grid grid;
int counter = 0;
int counter1 = 0;
void setup() {
  size(645, 743);
  grid= new Grid(4, 4);
  grid.initialspawn();
}

void draw() {
  if (won() == true) {
    if (counter == 0) {
      grid.display();
      fill(237, 200, 100, 150);
      rect(0, 0, width, height);
      counter++;
    } else {
      fill(255);
      textAlign(CENTER);
      text("YOU WON!", width/2, height/2);
    }
  }
   else {
    grid.display();
  }
}

void keyPressed() {
  if (key == 'w') {
    set();
    makeBefore();
    grid.shift(2);
    makeAfter();
    if (compare(grid.before, grid.after) == true) {
    } else {
      grid.spawn();
    }
  }
  if (key == 'a') {
    set();
    makeBefore();
    grid.shift(0);
    makeAfter();
    if (compare(grid.before, grid.after) == true) {
    } else {
      grid.spawn();
    }
  }
  if (key == 's') {
    set();
    makeBefore();
    grid.shift(3);
    makeAfter();
    if (compare(grid.before, grid.after) == true) {
    } else {
      grid.spawn();
    }
  }
  if (key == 'd') {
    set();
    makeBefore();
    grid.shift(1);
    makeAfter();
    if (compare(grid.before, grid.after) == true) {
    } else {
      grid.spawn();
    }
  }
  if (key == 'k') {
    grid.grids[0][0].num = 1024;
    grid.grids[0][1].num = 1024;
  }

  if (key == CODED) {
    if (keyCode == UP) {
      set();
      makeBefore();
      grid.shift(2);
      makeAfter();
      if (compare(grid.before, grid.after) == true) {
      } else {
        grid.spawn();
      }
    }
    if (keyCode == DOWN) {
      set();
      makeBefore();
      grid.shift(3);
      makeAfter();
      if (compare(grid.before, grid.after) == true) {
      } else {
        grid.spawn();
      }
    }
    if (keyCode == RIGHT) {
      set();
      makeBefore();
      grid.shift(1);
      makeAfter();
      if (compare(grid.before, grid.after) == true) {
      } else {
        grid.spawn();
      }
    }
    if (keyCode == LEFT) {
      set();
      makeBefore();
      grid.shift(0);
      makeAfter();
      if (compare(grid.before, grid.after) == true) {
      } else {
        grid.spawn();
      }
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

void set() {
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      grid.grids[i][j].combined = false;
    }
  }
}

boolean won() {
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      if (grid.grids[i][j].num == 2048) {
        return true;
      }
    }
  }
  return false;
}

