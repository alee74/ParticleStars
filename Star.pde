
// generates particles configured as a Fibonacci sphere
// code to do so taken from an example in Python from:
//
//  https://stackoverflow.com/questions/9600801/evenly-distributing-n-points-on-a-sphere

class Star {

  private float spin = 0;
  private float rotationRate;
  private PVector center;
  private ArrayList<ArrayList<Particle>> shells;


  Star(PVector c, float rad, int numParticles, int numShells, PImage[] imgs) {
    center = c;
    rotationRate = random(PI/200,PI/170);
    shells = new ArrayList<ArrayList<Particle>>();
    int perShell = numParticles / numShells;
    float scalar = 0.9;

    // variables/constants for calculations
    float x, y, z, r, phi;
    float offset = 2.0/perShell;
    float increment = PI * (3.0 - sqrt(5));
    
    // loop to create seperate concentric spheres ("shells")
    for (int j = 0; j < numShells; ++j) {
      ArrayList<Particle> shell = new ArrayList<Particle>();
      
      // loop to generate Particles
      for (int i = 0; i < perShell; ++i) {
       
        // position calculations
        y = ((i * offset) - 1) + (offset/2.0);
        r = sqrt(1 - y*y);
        phi = i * increment;
        x = cos(phi) * r;
        z = sin(phi) * r;
        // create particle
        shell.add(new Particle(new PVector(rad*x, rad*y, rad*z).add(center), 
                                   imgs[int(random(imgs.length))], pow(scalar,j)));
      }
      // adjust radius for next shell
      rad *= scalar;
      // add this shell to shells
      shells.add(shell);
    }
  }


  // after moving the star from the origin, the
  // rotations don't work as they did initially..
  void display() {
    pushMatrix();
    rotateY(spin);
    translate(center.x, center.y, center.z);
    pointLight(255,255,255, 0,0,0);
    for (ArrayList<Particle> shell : shells) {
      for (Particle particle : shell)
        particle.display();
      // arbitrary rotations,to prvent particles
      // in different shells sharingZplanes
      //rotateX(PI/8);          // TOGGLE
      //rotateZ(PI/5);          // TOGGLE
    }
    popMatrix();
    spin += rotationRate;
    spin %= TWO_PI;
  }
  
}
