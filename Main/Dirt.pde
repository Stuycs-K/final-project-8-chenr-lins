class Dirt{ //<>// //<>//
  int h,size,x,y,speed;
  
  public Dirt(int hh, int ss,int xx, int yy){
    size=ss;
    x=xx;
    y=yy;
    speed=-10;
    h = hh;
  }
  
  void display(){
    fill(150,75,0);
    rect(x,y,size,h,10);
    x+=speed;
  }
  
  int getx(){ return x; }
  int gety(){ return y; }
  int geth(){ return h; }
  void setspeed(){ speed=0; }
}
