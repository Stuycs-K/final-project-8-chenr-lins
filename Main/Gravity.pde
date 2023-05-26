class Gravity {
  PVector position, velocity, acceleration;
  float radius;
  float mass;
  
  void move() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration=new PVector(0,0);
  }
  
  PVector attractTo(Orb other) {
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
  
  
}
