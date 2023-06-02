class Dirt{ //<>//
  int size,x,y,speed;
  
  public Dirt(int xx,int yy){
    size=60*(int)random(1,4);
    x=xx;
    y=yy;
    speed=-10;
  }
  /*
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
  */
  
  void display(){
    fill(150,75,0);
<<<<<<< HEAD
    square(x,y,size);
=======
    rect(x,y,size,size,5);
>>>>>>> Stephanie
    x+=speed;
  }
  
  int getx(){ return x; }
  int gety(){ return y; }
  int getsize(){ return size; }
  
}
