class Doom {
  int x, y, size, xspeed, yspeed;
  
  public Doom(int xx, int yy){
    x=xx;
    y=yy;
    size = 60;
    yspeed=-4;
    xspeed=-10;
  }
  
  void display(){
    fill(255,0,0);
    rect(x,y,size,size,10);
  }

  void apply(){
    if(y+size>height){
      y+=yspeed;
    }
    else{
      x+=xspeed;
    }
  }
  int getx(){ return x; }
  int gety(){ return y; }
}
