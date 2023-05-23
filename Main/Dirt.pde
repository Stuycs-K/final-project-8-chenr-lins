class Dirt{
  int size,x,y,speed;
  
  public Dirt(int sizes,int xx,int yy,int speeds){
    size=sizes;
    x=xx;
    y=yy;
    speed=speeds;
  }
  
  void display(){
    square(x,y,size);
    x+=speed;();
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
}
