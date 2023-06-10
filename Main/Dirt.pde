class Dirt{ //<>// //<>// //<>//
  int h,size,x,y,speed;
  
  public Dirt(int hh,int xx,int yy){
    size=60*(int)random(1,8);
    h=hh;
    x=xx;
    y=yy;
    speed=-10;
  }
  
  public Dirt(int ss, int hh,int xx,int yy){
    size=60*ss;
    h=hh;
    x=xx;
    y=yy;
    speed=-10;
  }
  /*
  void stairs(){
    rect(x,y,widths,size);
    rect(x+size,y-size,widths-size,size);
    rect(x+2*size,y-2*size,widths-2*size,size); 
  }
  void stackedrect(){
    rect(x,y,widths,size);
    rect(x,y-2*size,widths,size);
    rect(x,y-4*size,widths,size);
  }
  */
  
  void display(){
    fill(150,75,0);
    rect(x,y,size,h,10);
    x+=speed;
  }
  
  int getx(){ return x; }
  int gety(){ return y; }
  int geth(){ return h; }
  int getsize() {return size; }
  void setspeed(){ speed=0; }
  
  boolean downtouch(Body sv){
    return y+h>sv.gety() && x+size>sv.getx() && x<(sv.getx()+sv.getsize());
  }
}
