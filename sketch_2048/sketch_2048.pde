Grid grid;
int counter = 0;
int counter1 = 0;
boolean alrwon = false;
boolean won = false;
boolean lost = false;
void setup() {
  size(645, 743);
  background(250, 248, 239);
  grid= new Grid(4, 4);
  grid.initialspawn();
}

void draw() {
  if (won() == true) {
    won = true;
    if (alrwon == false) {
      if (counter == 0) {
        grid.display();
        fill(237, 200, 100, 150);
        rect(0, 0, width, height);
        counter++;
      } else {
        wonScreen();
      }
    }
  } else if (lost() == true) {
    lost = true;
    if (counter1 == 0) {
      grid.display();
      fill(200, 150);
      rect(0, 0, width, height);
      counter1++;
      lost = true;
    } else {
      lostScreen();
    }
  } else {
    if (!won && !lost) {
      fill(100);
      textAlign(CENTER);
      textSize(60);
      text("2048", 125, 125);
      grid.display();
    }
  }
}

void keyPressed() {
  if (!won && !lost) {
    if (key == 'w' || key == 'W') {
      set();
      makeBefore();
      grid.shift(2);
      makeAfter();
      if (compare(grid.before, grid.after) == true) {
      } else {
        grid.spawn();
      }
    }
    if (key == 'a' || key == 'A') {
      set();
      makeBefore();
      grid.shift(0);
      makeAfter();
      if (compare(grid.before, grid.after) == true) {
      } else {
        grid.spawn();
      }
    }
    if (key == 's' || key == 'S') {
      set();
      makeBefore();
      grid.shift(3);
      makeAfter();
      if (compare(grid.before, grid.after) == true) {
      } else {
        grid.spawn();
      }
    }
    if (key == 'd' || key == 'D') {
      set();
      makeBefore();
      grid.shift(1);
      makeAfter();
      if (compare(grid.before, grid.after) == true) {
      } else {
        grid.spawn();
      }
    }
    if (key == 'k' || key == 'K') {
      grid.grids[0][0].num = 2048;
    }
    if (key == 'l' || key == 'L') {
      lose();
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
}

void mousePressed() {
  if (won == true) {
    if (mouseX >= width/2 - 150 && mouseX <= width/2-10 && mouseY >= height/2 + 20 && mouseY < height/2 + 60) {
      background(250, 248, 239);
      alrwon = true;
      won = false;
      counter = 0;
    }
    if (mouseX >= width/2 + 10 && mouseX <= width/2 + 150 && mouseY >= height/2 + 20 && mouseY < height/2 + 60) {
      won = false;
      background(250, 248, 239);
      grid.reset();
      counter = 0;
    }
  }
  if (lost == true) {
    if (mouseX >= width/2 - 70 && mouseX <= width/2+70 && mouseY >= height/2 + 20 && mouseY < height/2 + 60) {
      lost = false;
      alrwon = false;
      background(250, 248, 239);
      grid.reset();
      counter1 = 0;
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
      if (alrwon == false) {
        if (grid.grids[i][j].num == 2048) {
          return true;
        }
      }
    }
  }
  return false;
}

boolean lost() {
  if (grid.full() == true) {
    for (int i=0; i<4; i++) {
      for (int j=0; j<4; j++) {
        if (i == 3) {
        } else {
          if (grid.grids[i][j].down.num == grid.grids[i][j].num) {
            return false;
          }
        }
      }
    }
    for (int i=0; i<4; i++) {
      for (int j=0; j<4; j++) {
        if (i == 0) {
        } else {
          if (grid.grids[i][j].up.num == grid.grids[i][j].num) {
            return false;
          }
        }
      }
    }
    for (int i=0; i<4; i++) {
      for (int j=0; j<4; j++) {
        if (j == 0) {
        } else {
          if (grid.grids[i][j].left.num == grid.grids[i][j].num) {
            return false;
          }
        }
      }
    }
    for (int i=0; i<4; i++) {
      for (int j=0; j<4; j++) {
        if (j == 3) {
        } else {
          if (grid.grids[i][j].right.num == grid.grids[i][j].num) {
            return false;
          }
        }
      }
    }
    return true;
  } else {
    return false;
  }
}

void wonScreen() {
  textSize(50);
  fill(255);
  textAlign(CENTER);
  text("You won!", width/2, height/2);
  noStroke();
  fill(125);
  rect(width/2-150, height/2+20, 140, 40, 7);
  fill(255);
  textSize(20);
  text("Keep going", width/2-80, height/2+45);
  fill(125);
  rect(width/2+10, height/2+20, 140, 40, 7);
  fill(255);
  text("New game", width/2+80, height/2+45);
}

void lostScreen() {
  noStroke();
  textSize(50);
  fill(100);
  textAlign(CENTER);
  text("Game over!", width/2, height/2);
  fill(125);
  rect(width/2-70, height/2+20, 140, 40, 7);
  fill(255);
  textSize(20);
  text("New game", width/2, height/2+45);
}

void lose() {
    grid.grids[0][0].num = 2;
    grid.grids[0][2].num = 2;
    grid.grids[1][1].num = 2;
    grid.grids[1][3].num = 2;
    grid.grids[2][0].num = 2;
    grid.grids[2][2].num = 2;
    grid.grids[3][1].num = 2;
    grid.grids[3][3].num = 2;
    grid.grids[0][1].num = 4;
    grid.grids[0][3].num = 4;
    grid.grids[1][0].num = 4;
    grid.grids[1][2].num = 4;
    grid.grids[2][1].num = 4;
    grid.grids[2][3].num = 4;
    grid.grids[3][0].num = 4;
    grid.grids[3][2].num = 4;
  }
