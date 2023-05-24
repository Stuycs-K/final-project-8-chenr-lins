class Dirt{
  int widths,size,x,y,speed;
  int choose;
  
  public Dirt(int wid, int sizes, int xx,int yy){
    widths=wid;
    size=sizes*(int)random(1,5);
    x=xx;
    y=yy;
    speed=-1;
    choose = (int)random(0,3);
  }
  
  void stairs(){
    rect(x,y,widths,size);
    rect(x+size,y-size,widths-size,size);
    rect(x+2*size,y-2*size,widths-2*size,size); 
  }
  void stackedrect(){
    rect(x,y,widths,size);
    rect(x,y-2*size,widths,size);
    rect(x,y-4*size,widths,size);
  }
  
  void wall(){
    rect(x,y,widths,size);
  }
  
  void display(){
    if(choose==0){
      stairs();
    }
    else if(choose==1){
      stackedrect();
    }
    else{
      wall();
    }
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
