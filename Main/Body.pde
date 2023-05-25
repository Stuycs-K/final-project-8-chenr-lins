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
  
  int getsize(){
    return size;
  }
  
  void display(){
    square(x,y,size);
  }
  
  void apply(int pos){
    if(x+size>pos){
      yspeed=0;
    }
    else{
      yspeed=1;
    }
    if(x>-1*size){
      x+=xspeed;
    }
    if(y<height-size){
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
      xspeed=-1;
      apply(0);
      return true;
    }
    return false;
  }
}
