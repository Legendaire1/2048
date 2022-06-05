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
    grid.shift(2);
    grid.spawn();
  }
  if (key == 'a') {
    grid.shift(0);
    grid.spawn();
  }
  if (key == 's') {
    grid.shift(3);
    grid.spawn();
  }
  if (key == 'd') {
    grid.shift(1);
    grid.spawn();
  }
  
  if (key == CODED) {
    if (keyCode == UP) {
      grid.shift(2);
      grid.spawn();
    } 
    if (keyCode == DOWN) {
      grid.shift(3);
      grid.spawn();
    }
   if (keyCode == RIGHT) {
      grid.shift(1);
      grid.spawn();
    } 
    if (keyCode == LEFT) {
      grid.shift(0);
      grid.spawn();
    } 
    } 
}
