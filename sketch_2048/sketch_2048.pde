Grid grid;

void setup(){
  size(645,743);
  grid= new Grid(4,4);
  grid.spawn();
}

void draw(){
  grid.display();
}

void keyPressed() {
  if (key == 'w') {
    grid.shift(2);
  }
  if (key == 'a') {
    grid.shift(0);
  }
  if (key == 's') {
    grid.shift(3);
  }
  if (key == 'd') {
    grid.shift(1);
  }
  
  if (key == CODED) {
    if (keyCode == UP) {
      
    } 
    if (keyCode == DOWN) {
      
    }
    } 
}
