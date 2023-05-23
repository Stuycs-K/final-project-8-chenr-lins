class Body {
  double x, y, xspeed, yspeed;
  int size;
  
  pubic Body(double xx, double yy, int s) {
    x=xx;
    y=yy;
    size=s;
    xspeed=0;
    yspeed=1;
  }
  
  int getx(){
    return x;
  }
  
  int gety(){
    return y;
  }
  
  void display(){
    square(x,y,size);
  }
  
  
}
