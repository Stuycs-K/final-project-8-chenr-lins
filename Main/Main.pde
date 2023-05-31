int x = 100; //<>// //<>//
int y;
int size = 20;
ArrayList<Body>birdList = new ArrayList<Body>();
ArrayList<Body>removed = new ArrayList<Body>();
Body down;
Dirt test = new Dirt(width,(int)random(300,500)/100*100);
Dirt test2 = new Dirt(width,(int)random(300,500)/100*100);
boolean dirts = true;
int maxBird = 10;
int birdCount = 0;
Bird head;
//Body earth = new Body(0, height*500, size, 500000000);
int mode=0;

void setup(){
  size(400,400);
  background(135,206,235);
  y=height-size;
  //earth.display();
  down = new Body(x,y,size);
  y-=size;
  birdList.add(down);
  head = new Bird(x,y,size);
  head.display();
  y-=size;
  //birdCount++;
  fill(0,255,0);
  rect(-5,height-size,width+5,size);
  fill(0);
  text("Press Key To Start", 180, 200);
}

void keyPressed(){
  if (mode==0) {
    mode=1;
  }
  if (mode==1) {
    if(birdCount<maxBird){
      Body b = new Body(x,y+size,size);
      birdList.add(b);
      y-=size;
      birdCount++;
      head.sety(-size);
    }
  }
}

void draw(){
  background(135,206,235);
  fill(255);
  if (mode==0) {
  }
  if (mode==1) {
    if(test.getx()<test.getsize()*-1 && dirts){
      test2 = new Dirt(width,(int)random(300,500)/100*100);
      dirts = false;
    }
    if(test2.getx()<test.getsize()*-1 && dirts==false){
      test = new Dirt(width,(int)random(300,500)/100*100);
      dirts = true;
    }
    if(head.touch(test)||head.touch(test2)){
      head.display2();
      mode=2;
    }
    else{
      head.display1();
    }
    if (mode==2) {
      noLoop();
    }
    fill(255);
    //birdList.get(0).display();
    for(int i=1; i<birdList.size(); i++){
      Body b=birdList.get(i);
      b.display();
      if (b.touch(test) || b.touch(test2)) {
        birdList.remove(b);
        removed.add(b);
        //b.applyForce(b.attractTo(earth));
        y+=size;
        birdCount--;
        i--;
      }
      if (!(b.toptouch(test) || b.toptouch(test2))){
        b.apply(birdList.get(i-1));
        head.apply(birdList.get(birdList.size()-1));
      }
    }
    for (int i=0; i<removed.size(); i++) {
      Body b=removed.get(i);
      b.apply(x);
      if(i==0){
        if(b.gety()<height-2*size){
          b.sety(1);
        }
      }
      if (i>=1){
        b.apply(removed.get(i-1));
        b.setx(b.getx()+2);
      }
      b.display();
      if(b.getx()+size<-1){
        removed.remove(b);
      }
    }  
    test.display();
    test2.display();
  }
  fill(0,255,0);
  rect(-5,height-size,width+5,size);
}
