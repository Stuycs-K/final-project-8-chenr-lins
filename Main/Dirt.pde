class Dirt{
  int size,x,y,speed;
  new Dirt(int sizes,int xx,int yy,int speeds){
    size=sizes;
    x=xx;
    y=yy;
    speed=speeds;
  }
  
  void display(){
    square(x,y,size);
  }
  
  int getx(){
    return x;
  }
  
  int gety(){
    return y;
  }
  
  void apply(){
    x+=speed;
  }
}
