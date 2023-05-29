class Body {
  int x, y;
  double xspeed, yspeed;
  int size;
  
  public Body(int xx, int yy, int s) {
    x=xx;
    y=yy;
    size=s;
    xspeed=0;
    yspeed=2;
  }
  
  int getx(){
    return x;
  }
  
  int gety(){
    return y;
  }
  
  int getsize(){
    return size;
  }
  
  void setyspeed(int num){
    yspeed=num;
  }
  void display(){
    square(x,y,size);
  }
  
  void apply(int pos,Dirt s){
    if(x> (-2*size)){
      x+=xspeed;
    }
    if(x<100){
      yspeed=2;
    }
    if(y+s.getsize()<=height){
      y+=yspeed;
    }
  }
  
  void apply(Body other){
    x+=xspeed;
    if(y<other.y-size){
      y+=yspeed;
    }
  }
  
  boolean touch(Dirt sv){
    if(x+size==sv.getx() && y>=sv.gety() && y<sv.gety()+sv.getsize()){
      xspeed=-2;
      apply(0,sv);
      return true;
    }
    return false;
  }
}
