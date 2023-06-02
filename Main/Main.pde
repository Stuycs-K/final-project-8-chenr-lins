int x = 100; //<>// //<>//
int y;
int size = 60;
ArrayList<Body>birdList = new ArrayList<Body>();
ArrayList<Body>removed = new ArrayList<Body>();
Body down;
Dirt test;
Dirt test2;
boolean dirts = true;
int maxBird = 10;
int birdCount = 0;
Bird head;
int mode=0;

void setup(){
  noStroke();
  size(800,800);
  background(135,206,235);
  y=height;
  down = new Body(x,y,size);
  y-=size;
  birdList.add(down);
  head = new Bird(x,y,size);
  y-=size;
  fill(0,255,0);
  rect(-5,height-size,width+5,size);
  fill(0);
  textSize(100);
  text("Press Key To Start", 200, 200);
}

void keyPressed(){
  if (mode==0) {
    test = new Dirt(width/2,height-((int)random(2,3))*size);
    test2 = new Dirt(width/2,height-((int)random(2,3))*size);
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
    head.display1();
    text("Press Key To Start", 0+10, height/2);
  }
  if (mode==1) {
    if(test.getx()<test.getsize()*-1 && dirts){
      test2 = new Dirt(width,height-2*(((int)random(2,3))*size));
      dirts = false;
    }
    else if(test2.getx()<test.getsize()*-1 && dirts==false){
      test = new Dirt(width,height-2*(((int)random(2,3))*size));
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
      textSize(60);
      text("You Lose!", 300, height/4);
      noLoop();
    }
    fill(255);
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
      if (!(b.toptouch(test) || b.toptouch(test2))){
        b.apply(birdList.get(i-1));
      }
      if (!(head.toptouch(test) || head.toptouch(test2))){
        head.apply(birdList.get(birdList.size()-1));
      }
    }
    for (int i=0; i<removed.size(); i++) {
      Body b=removed.get(i);
      b.apply(x);
      if(i==0){
        if(b.gety()<height-2*size){
          b.sety(4);
        }
      }
      if (i>=1){
        b.apply(removed.get(i-1));
        b.setx(b.getx()-5);
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
  //rect(-5,height-size,width+5,size);
}
