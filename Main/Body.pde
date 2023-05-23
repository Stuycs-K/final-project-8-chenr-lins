class Body {
  int x, y;
  double xspeed, yspeed;
  int size;
  
  public Body(int xx, int yy, int s) {
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
