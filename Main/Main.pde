int x = 100;
int y;
int size = 60;
ArrayList<Body>birdList = new ArrayList<Body>();
ArrayList<Body>removed = new ArrayList<Body>();
ArrayList<Dirt>dirtList = new ArrayList<Dirt>();
Body down;
Dirt test, test2;
boolean dirts = true;
int maxBird = 10;
int birdCount = 0;
Bird head, tempBird;
int mode=0;
int score = 0;

void restart() {
  background(135,206,235);
  y=height;
  down = new Body(x,y,size);
  y-=size;
  birdList.add(down);
  head = new Bird(x,y,size);
  y-=size;
  tempBird=new Bird(x,y,size);
  fill(0,255,0);
  rect(-5,height-size,width+5,size);
  fill(0);
}

void setup(){
  noStroke();
  size(800,700);
  restart();
}

void keyPressed(){
  if (mode==0) {
    test = new Dirt(width,height-2*(((int)random(2,3))*size));
    test2 = new Dirt(width,height-2*(((int)random(2,3))*size));
    mode=1;
    Dirt dirt = new Dirt(width,height-2*(((int)random(2,3))*size));
    dirtList.add(dirt);
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
  if (mode==2) {
    mode=0;
    restart();
  }
}

void draw(){
  background(135,206,235);
  /*
  int testheight=height;
  for(int i=0;i<12;i++){
    stroke(0);
    fill(135,206,235);
    square(100,testheight,size);
    testheight-=size;
  }
  noStroke();
  */
  fill(255);
  if (mode==0) {
    textSize(100);
    tempBird.display1();
    text("Press Key To Start", 0+10, height/2);
    fill(0);
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
    textSize(30);
    text("Blocks Evaded " + score, width-250,50);
    for(int i=1; i<birdList.size(); i++){
      Body b=birdList.get(i);
      b.display();
      if (b.touch(test) || b.touch(test2)) {
        score++;
        birdList.remove(b);
        removed.add(b);
        y+=size;
        birdCount--;
        i--;
      }
      else{
        if (!(b.toptouch(test) || b.toptouch(test2))){
        b.apply(birdList.get(i-1));
        }
      }
      if (!(head.toptouch(test) || head.toptouch(test2))){
        head.apply(birdList.get(birdList.size()-1));
      }
    }
    if (mode!=2){
      for (int i=0; i<removed.size(); i++) {
        Body b=removed.get(i);
        if(i==0){
          b.apply();
          if(b.gety()<height-2*size){
            b.sety(5);
          }
        }
        if (i>=1){
          b.apply(removed.get(i-1));
        }
        b.display();
        if(b.getx()+size<-1){
          removed.remove(b);
        }
      }
    }
    for(int i=0; i<dirtList.size();i++){
      Dirt d = dirtList.get(i);
      d.display();
      if(d.getx()+d.getsize()<-1){
        dirtList.remove(i);
        i--;
        Dirt newdirt = new Dirt(width,height-2*(((int)random(2,3))*size));
        dirtList.add(newdirt);
      }
    }
    test.display();
    test2.display();
  }
  fill(0,255,0);
  rect(-5,height-size,width+5,size);
}
