// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

// A rectangular box
class Box  {

Body body;         //몸을 만들어 줍니다.
  float w,h;

  // Constructor
  Box(float x, float y) {
    w = 30;
    h = 30;
    
     BodyDef bd = new BodyDef();
     bd.type = BodyType.DYNAMIC;
     bd.position.set(box2d.coordPixelsToWorld(x,y));
     body = box2d.createBody(bd);
     
     PolygonShape ps = new PolygonShape();
     float box2dW = box2d.scalarPixelsToWorld(w/2);
     float box2dH = box2d.scalarPixelsToWorld(h/2);
     
     ps.setAsBox(box2dW, box2dH);
     
     FixtureDef fd = new FixtureDef();
     fd.shape = ps;
     fd.density = 1;
     fd.friction = 0.3;
     fd.restitution = 0.5;
     
     body.createFixture(fd);
  }
  boolean done() {
    // Let's find the screen position of the particle
     
    // Is it off the bottom of the screen?
    if (mode==2) {
      killBody();
      return true;
    }
    return false;
  }

  // Drawing the box
  void display() {
      Vec2 pos = box2d.getBodyPixelCoord(body);
       float a = body.getAngle(); 
     
      pushMatrix();
      translate(pos.x,pos.y);
      rotate(-a);
      
    fill(220);
    stroke(0);
    strokeWeight(2);
    rectMode(CENTER);
    rect(0,0,w,h);
    
     popMatrix();
  }
  
  void killBody(){
    
   box2d.destroyBody(body);
    
  }
}