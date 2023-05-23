int x;
int y;
int size;
ArrayList<Body>birdList;
int maxBird;
int birdCount;

void setup(){
  size(400,400);
  background(135,206,235);
  birdList = new ArrayList<Body>();
  //temp numbers
  x = 100;
  y = height-10;
  size = 10;
  maxBird = 20;
}

void draw(){
  
}

void keyPressed(){
  if(birdCount<maxBird){
    Body b = new Body(x,y,size);
    birdList.add(b);
    y-=size;
    birdCount++;
    b.display();
  }
}
