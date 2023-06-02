class Body {
  int x, y;
  double xspeed, yspeed;
  int size;

  public Body(int xx, int yy, int s) {
    x=xx;
    y=yy;
    size=s;
    xspeed=0;
    yspeed=4;
  }
  
  int getx(){
    return x;
  }
  
  int gety(){
    return y;
  }
  
  void setx(int xx){
    x=xx;
  }
  
  void sety(int yy){
    y+=yy;
  }
  int getsize(){
    return size;
  }

  void display(){
    rect(x,y,size,size,5);
  }
  
  void apply(int pos){
    if(x+size>pos){
      yspeed=0;
    }
    else{
      yspeed=10;
    }
    if(x>-2*size){
      x+=xspeed;
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
      xspeed=-5;
      return true;
    }
    return false;
  }
  
  boolean toptouch(Dirt sv){
    return y+size>sv.gety() && x-sv.getsize()<sv.getx();
  }
  
}
class Bird extends Body {
  public Bird(int xx, int yy, int s) {
    super(xx, yy, s);
  }

  void display1(){
    rect(x,y,size,size,5);
    fill(0);
    circle(x+3*size/4,y+size/2,size/4);
    fill(255,165,0);
    triangle(x+size,y+size/5,x+size,y+size-size/5,x+size+size/2,y+size/2);
  }
  
  void display2(){
    rect(x,y,size,size,5);
    stroke(0);
    circle(x+3*size/4,y+size/2,size/4);
    noStroke();
  }
  
  boolean touch (Dirt sv){
    if(x+size==sv.getx() && y>=sv.gety() && y<sv.gety()+sv.getsize()){
      display2();
      return true;
    }
    return false;
  }
}
