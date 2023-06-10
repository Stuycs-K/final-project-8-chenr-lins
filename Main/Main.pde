int x;
int y;
int size;
ArrayList<Body>birdList;
ArrayList<Body>removed;
Body down;
Dirt test, test2;
boolean dirts;
int maxBird = 9;
int birdCount;
Bird head, tempBird;
int mode;
int score;
int maxscore=0;
boolean mode2;
ArrayList<Dirt> dirtlist;

void restart() {
  background(135,206,235);
  birdList = new ArrayList<Body>();
  removed = new ArrayList<Body>();
  dirts = true;
  birdCount = 0;
  mode=0;
  score=0;
  x=150;
  size = 60;
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
    test = new Dirt(size,width,height-size-(((int)random(1,10))*size));
    test2 = new Dirt(size,width,height-size-(((int)random(1,10))*size));
    mode=1;
  }
  if (mode==1) {
    if(birdCount<maxBird){
      if(!test.downtouch(head)  && !test2.downtouch(head)){
        Body b = new Body(x,y+size,size);
        birdList.add(b);
        y-=size;
        birdCount++;
        head.sety(-size);
      }
    }
  }
  if (mode2==true) {
    mode2=false;
    mode=0;
    if (score>maxscore) maxscore=score;
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
  fill(150,75,0);
  rect(-5,-1, width+5,height-maxBird*size-size);
  fill(255);
  textSize(30);
  text("Highest Score: " + maxscore, width-265, 45);
  text("Score: " + score, width-265,75);
  if (mode==0) {
    textSize(100);
    tempBird.display1();
    text("Press Key To Start", 20, height/2);
    fill(0);
  }
  if (mode==1) {
    if(test.getx()<test.geth()*-1 && dirts){
      test2 = new Dirt(size,width,height-size-(((int)random(1,10))*size));
      dirts = false;
    }
    else if(test2.getx()<test.geth()*-1 && dirts==false){
      test = new Dirt(size,width,height-size-(((int)random(1,10))*size));
      dirts = true;
    }
    if(head.touch(test)||head.touch(test2)){
      head.display2();
      mode2=true;
    }
    else{
      head.display1();
    }
    if (!mode2){
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
    }else {
      for(int i=1; i<birdList.size(); i++){
        Body b=birdList.get(i);
        b.display();
      }
      textSize(60);
      text("You Lose!",100,67);
      test.setspeed();
      test2.setspeed();
    }
    test.display();
    test2.display();
  }
  fill(0,255,0);
  rect(-5,height-size,width+5,size);
}

void stair() {
  dirtlist=new ArrayList<Dirt>();
  Dirt d=new Dirt(size,width,height-size-(((int)random(1,10))*size));
  dirtlist.add(d);
  if (d.getsize()/60>1) {
    for (int i=d.getsize()/60-1; i>0; i--) {
      dirtlist.add(new Dirt(size,width,height-size-((int)random(1,10))*size));
    }
  }
}
