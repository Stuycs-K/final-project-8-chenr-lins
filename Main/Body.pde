class Body {
  int x, y, size;
  int xspeed, yspeed;
  boolean doomed,passed;
  int time;
  
  public Body(int xx, int yy, int s) {
    x=xx;
    y=yy;
    size=s;
    xspeed=0;
    yspeed=5;
    int num = (int)random(0,2);
    if(num==0){
      doomed = true;
    }
    else{
      doomed = false;
    }
    passed=false;
    time = 0;
  }
  
  int getx(){ return x; }
  int gety(){ return y; }
  int getsize(){ return size; }
  boolean getpassed() { return passed; }
  boolean getdoomed() { return doomed; }
  int gettime(){ return time; }

  void setx(int xx){ x+=xx; }
  void sety(int yy){ y+=yy; }
  void setpassed(){ passed=true; }
  void settime(){ time++; }
  
  void display(){ rect(x,y,size,size,10); }
  void displayred(){
    fill(255,0,0);
    rect(x,y,size,size,10);
    fill(255);
  }
  
  void apply(){
    x+=xspeed;
  }
  
  void apply(Body other){
    x+=xspeed;
    if(y<other.y-size){
      y+=yspeed;
    }
  }
  
  boolean touch(Dirt sv){
    if(x+size==sv.getx() && y>=sv.gety() && y<sv.gety()+sv.geth()){
      xspeed=-10;
      return true;
    }
    return false;
  }
  
  boolean toptouch(Dirt sv){
    return y+size>sv.gety() && (x+size)>sv.getx() && x<(sv.getx()+sv.geth());
  }
  
  boolean touchDoom(Doom d){
    return y==d.gety() && x+size==d.getx();
  }
}

class Bird extends Body {
  public Bird(int xx, int yy, int s) {
    super(xx, yy, s);
  }

  void display1(){
    rect(x,y,size,size,10);
    fill(0);
    circle(x+3*size/4,y+size/2,size/4);
    fill(255,165,0);
    triangle(x+size,y+size/5,x+size,y+size-size/5,x+size+size/2,y+size/2);
    fill(255);
  }
  
  void display2(){
    rect(x,y,size,size,10);
    stroke(0);
    circle(x+3*size/4,y+size/2,size/4);
    noStroke();
  }
  
  boolean touch (Dirt sv){
    if(x+size==sv.getx() && y>=sv.gety() && y<sv.gety()+sv.geth()){
      display2();
      return true;
    }
    return false;
  }
  
  boolean bottomtouch(Dirt sv){
    return sv.gety()+sv.geth()==y && (x+size)>sv.getx() && x<(sv.getx()+sv.geth());
  }
}
