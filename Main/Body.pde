class Body {
  int x, y;
  double xspeed, yspeed;
  int size;
  //PVector position, velocity, acceleration;
  //float radius;
  //float mass;
  //double G = 20;
  
  public Body(int xx, int yy, int s) {
    x=xx;
    y=yy;
    size=s;
    xspeed=0;
    yspeed=2;
    /*
    position = new PVector(x, y);
    velocity = new PVector((int)xspeed, (int)yspeed);
    acceleration = new PVector(0, 0);
    mass = mass_;
    */
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
    square(x,y,size);
  }
  
  void apply(int pos){
    if(x+size>pos){
      yspeed=0;
    }
    else{
      yspeed=2;
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
      xspeed=-2;
      return true;
    }
    return false;
  }
  
  boolean toptouch(Dirt sv){
    return y+size>sv.gety() && x-sv.getsize()<sv.getx();
  }
  
  /*
  void move() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration=new PVector(0,0);
  }
  
  PVector attractTo(Body other) {
    float distance = dist(position.x, position.y, other.position.x, other.position.y);
    distance = max(15.0, distance);
    float mag = (float)(G*mass*other.mass)/(distance*distance);
    PVector force = PVector.sub(other.position, position);
    force.normalize();
    force.setMag(mag);
    return force;
  }
  
  void applyForce(PVector f) {
    acceleration=f.div(mass);
  }
  */
}
*/
}
class Bird extends Body {
<<<<<<< HEAD
  public Bird(int xx, int yy, int s) {
    super(xx, yy, s);
  }
  
  void display(){
    fill(0);
    square(x,y,size);
=======
  public Bird(int xx, int yy, int s, float mass_){
    super(xx, yy, s, mass_);
>>>>>>> 527095e8778da8bfaaace046c895b17a63b1fc86
  }
}
