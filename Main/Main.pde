int x;
int y;
int size;
ArrayList<Body>birdList;
ArrayList<Body>removed;
int maxBird;
int birdCount;
ArrayList<Dirt>obstacle;
Dirt test;
int time = 0;

void setup(){
  size(400,400);
  birdList = new ArrayList<Body>();
  obstacle = new ArrayList<Dirt>();
  removed=new ArrayList<Body>();
  //temp numbers
  x = 100;
  size = 20;
  y = height-2*size;
  maxBird = 20;
  test = new Dirt(80,size,width,height/2);
}

void draw(){
  time++;
  background(135,206,235);
  for(int i=0; i<birdList.size(); i++){
    Body b=birdList.get(i);
    b.display();
    if (b.touch(test)) {
      removed.add(b);
      birdCount--;
      birdList.remove(i);
    }
  }
  for (int i=0; i<removed.size(); i++) {
    
  }
  if(time%200==0){
    Dirt x = new Dirt(80,size,width,height-2*size);
    obstacle.add(x);
  }
  for(int i=0; i<obstacle.size();i++){
    obstacle.get(i).display();
    if(obstacle.get(i).getx()<0){
      obstacle.remove(i);
      i--;
    }
  }
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
