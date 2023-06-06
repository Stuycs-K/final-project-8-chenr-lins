int x = 100;
int y;
int size = 60;
ArrayList<Body>birdList = new ArrayList<Body>();
ArrayList<Body>removed = new ArrayList<Body>();
ArrayList<Dirt>dirtList = new ArrayList<Dirt>();
Body down;
int maxBird = 10;
int birdCount = 0;
Bird head, tempBird;
int mode;
int score;
boolean mode2;
int num = 0;

void restart() {
  background(135,206,235);
  birdCount = 0;
  mode=0;
  score=0;
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
    mode=1;
    Dirt dirt = new Dirt(width,height-2*(((int)random(2,3))*size),size);
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
  if (mode2==true) {
    mode2=false;
    mode=0;
    restart();
  }
}

boolean makeDirt(ArrayList<Dirt>list){
  if (num==0){
    //square
    Dirt dirts = new Dirt(width,height-2*(((int)random(2,3))*size),size);
    list.add(dirts);
    num=1;
    return true;
  }
  if (num==1){
    //stairs
    int ypos = height-2*(((int)random(2,3))*size);
    Dirt nDirt = new Dirt(width,ypos,2*size);
    dirtList.add(nDirt);
    nDirt = new Dirt(width+size,ypos-size,1*size);
    dirtList.add(nDirt);
    num=0;
    return true;
  }
  return true;
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
    text("Press Key To Start", 20, height/2);
    fill(0);
  }
  if (mode==1) {
    for(int i=0; i<dirtList.size();i++){
      if(head.touch(dirtList.get(0))){
        head.display2();
        mode2=true;
      }
      else{
      head.display1();
    }
    }
    fill(255);
    textSize(30);
    text("Blocks Evaded " + score, width-250,50);
    if (!mode2){
      for(int i=1; i<birdList.size(); i++){
        Body b=birdList.get(i);
        b.display();
        //for(int j=0; i<dirtList.size();j++){
          if (!(head.toptouch(dirtList.get(0)))){
            head.apply(birdList.get(birdList.size()-1));
          }
          if (b.touch(dirtList.get(0))){
            score++;
            birdList.remove(b);
            removed.add(b);
            y+=size;
            birdCount--;
            i--;
            continue;
          }
          else{
            if (!(b.toptouch(dirtList.get(0)))) {
              b.apply(birdList.get(i-1));
            }
          }
        //}
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
      text("You Lose!", 300, height/4);
      dirtList.get(0).setspeed();
    }
    for(int i=0; i<dirtList.size();i++){
      Dirt d = dirtList.get(i);
      d.display();
      if(d.getx()+d.getsize()<-1){
        dirtList.remove(i);
        makeDirt(dirtList);
        i--;
      }
    }
  }
  fill(0,255,0);
  rect(-5,height-size,width+5,size);
}
