class Doom {
  int x, y, size, xspeed, yspeed;
  
  public Doom(int xx, int yy){
    x=xx;
    y=yy;
    size = 60;
    yspeed=-4;
    xspeed=-4;
  }
  
  void display(){
    fill(255,0,0);
    rect(x,y,size,size,10);
  }
  
  void apply(){
    if(y+size>height-size){
      y+=yspeed;
    }
    else if(x>100+60){
      x+=xspeed;
    }
  }
  int getx(){ return x; }
  int gety(){ return y; }
}
