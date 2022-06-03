Grid grid;

void setup(){
  size(645,743);
  grid= new Grid(4,4);
  grid.spawn();
}

void draw(){
  grid.display();
}
