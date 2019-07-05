

class Particle {

  private PVector point;
  private PShader shader;
  private float weight;
  
  private PVector deltaPoint;
  private PVector maxPoint;
  private PVector minPoint;

  Particle(PVector p, PImage i, float scalar) {
    point = p;
    shader = loadShader("particlefrag.glsl", "particlevert.glsl");
    shader.set("sprite", i);
    weight = random(20, 45) / scalar;
    shader.set("weight", weight);
    PVector normal = point.copy().normalize();
    deltaPoint = PVector.mult(normal, random(1,5));
    maxPoint = PVector.add(point, PVector.mult(normal,random(10,50)));
    minPoint = PVector.sub(point, PVector.mult(normal,random(10,50)));
  }

  void display() {
    
    update();
    shader(shader, POINTS);
    strokeWeight(weight);
    stroke(255);
    point(point.x, point.y, point.z);
  }
  
  void update() {
    PVector newPoint = PVector.add(point, deltaPoint);
    if (newPoint.mag() > maxPoint.mag()) {
      point = maxPoint;
      deltaPoint.mult(-1);
    } else if (newPoint.mag() < minPoint.mag()) {
      point = minPoint;
      deltaPoint.mult(-1);
    } else
      point = newPoint;
  }
  
}
