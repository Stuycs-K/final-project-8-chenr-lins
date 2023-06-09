class Doom {
  int x, y, size, xspeed, yspeed;
  
  public Doom(int xx, int yy){
    x=xx;
    y=yy;
    size = 60;
    yspeed=-4;
    xspeed=-5;
  }
  
  void display(){
    fill(255,0,0);
    square(x,y,size);
  }
  
  void apply(){
    if(y+size>height-size){
      y+=yspeed;
    }
    else{
      x+=xspeed;
    }
  }
  int getx(){ return x; }
  int gety(){ return y; }
}
