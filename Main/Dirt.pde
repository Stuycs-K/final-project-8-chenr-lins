class Dirt{ //<>// //<>//
  int h,size,x,y,speed;
  
  public Dirt(int hh, int xx,int yy){
    size=60*(int)random(1,4);
    x=xx;
    y=yy;
    speed=-10;
    h = hh;
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
  void setspeed(){ speed=0; }
  
}
