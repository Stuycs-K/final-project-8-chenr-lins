class Dirt{
  int widths,size,x,y,speed;
  
  public Dirt(int wid, int hei, int xx,int yy){
    widths=wid;
    size=hei;
    x=xx;
    y=yy;
    speed=-1;
  }
  
  void stairs(){
    rect(x,y,widths,size);
    x+=size;
    y-=size;
    widths-=size;
    rect(x,y,widths,size);
  }
  /*
  void stackedrect(){
  }
  
  void wall(){
  }
  */
  
  void display(){
    int choose = (int)random(0,3);
    if(choose==0){
      stairs();
    }
    stairs();
    /*
    else if(choose==1){
      stackedrect();
    }
    else{
      wall();
    }
    */
    x+=speed;
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
