int x;
int y;
int size;
ArrayList<Body>birdList;
ArrayList<Body>removed;
int maxBird;
int birdCount;
Dirt test;

void setup(){
  size(400,400);
  birdList = new ArrayList<Body>();
  //temp numbers
  x = 100;
  size = 20;
  y = height-size;
  maxBird = 20;
  test = new Dirt(40,size,width,height/2);
}

void draw(){
  background(135,206,235);
  for(int i=0; i<birdList.size(); i++){
    Body b=birdList.get(i);
    b.display();
  }
  test.display();
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
