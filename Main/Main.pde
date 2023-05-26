int x = 100; //<>// //<>//
int y;
int size = 20;
ArrayList<Body>birdList;
ArrayList<Body>removed;
Body down;
Dirt test;
Dirt test2;
boolean dirts = true;
int time = 0;
int maxBird = 10;
int birdCount = 0;

void setup(){
  size(400,400);
  y = height;
  birdList = new ArrayList<Body>();
  removed=new ArrayList<Body>();
  down=new Body(x-size,y,0);
  birdList.add(down);
  y-=size;
  test = new Dirt(width,(int)random(300,500)/100*100);
  test2 = new Dirt(width,(int)random(300,500)/100*100);
}

void keyPressed(){
  if(birdCount<maxBird){
    Body b = new Body(x,y,size);
    birdList.add(b);
    y-=size;
    birdCount++;
  }
}

void draw(){
  time++;
  background(135,206,235);
  fill(255);
  if(test.getx()<width/2 && dirts){
    test2 = new Dirt(width,(int)random(300,500)/100*100);
    dirts = false;
  }
  if(test2.getx()<width/2 && dirts==false){
    test = new Dirt(width,(int)random(300,500)/100*100);
    dirts = true;
  }
  for(int i=1; i<birdList.size(); i++){
    Body b=birdList.get(i);
    b.display();
    if (b.touch(test) || b.touch(test2)) {
      birdList.remove(b);
      removed.add(b);
      y+=size;
      birdCount--;
      i--;
    }
    b.apply(birdList.get(i-1));
  }
  for (int i=0; i<removed.size(); i++) {
    Body b=removed.get(i);
    b.display();
    b.apply(x);
  }
  test.display();
  test2.display();
  fill(0,255,0);
  rect(0,height-size,width,size);
}
