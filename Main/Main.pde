int x;
int y;
int size;
ArrayList<Body>birdList;
ArrayList<Body>removed;
int maxBird;
int birdCount;
ArrayList<Dirt>obstacle;
ArrayList<Body>temp;
Dirt test;
int time = 0;
int timenow = 0;

void setup(){
  size(400,400);
  birdList = new ArrayList<Body>();
  obstacle = new ArrayList<Dirt>();
  removed=new ArrayList<Body>();
  Body down=new Body(x-size,y,0);
  temp = new ArrayList<Body>();
  birdList.add(down);
  //temp numbers
  x = 100;
  size = 20;
  y = height-2*size;
  maxBird = 10;
  test = new Dirt(80,size,width,height-size*2);
}

void draw(){
  time++;
  timenow++;
  background(135,206,235);
  for(int i=1; i<birdList.size(); i++){
    Body b=birdList.get(i);
    b.display();
    //if(obstacle.size()>0){
      if (b.touch(test)) {
        birdList.remove(i);
        removed.add(b);
        y+=size;
        birdCount--;
        if(test.gettype()==0){
          timenow=100000;
          temp.add(birdList.remove(i+1));
          birdCount--;
        }
      }
    //}
    b.apply(birdList.get(i-1));
  }
  if(timenow==100000+size){
    removed.add(temp.remove(0));
  }
  for(int i=0; i<temp.size();i++){
    temp.get(i).display();
  }
  for (int i=0; i<removed.size(); i++) {
    Body b=removed.get(i);
    b.display();
    b.apply(x);
    if(removed.get(i).getx()<-removed.get(i).getsize()){
    removed.remove(i);
    i--;
    }  
  }
  test.display();
  /*
  if(time%200==0){
    Dirt x = new Dirt(80,size,wid  th,height-2*size);
    obstacle.add(x);
  }
  for(int i=0; i<obstacle.size();i++){
    obstacle.get(i).display();
    if(obstacle.get(i).getx()<-obstacle.get(i).getwidth()){
      obstacle.remove(i);
      i--;
    }
  }
  */
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
