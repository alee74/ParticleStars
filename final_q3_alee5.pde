/* * * * * * * * * * * * * * * * * * *
 *                                   *
 *  Austin James Lee                 *
 *                                   *
 *  "Twinkle Twinkle Particle Star"  *
 *                                   *
 *               OR                  *
 *                                   *
 *         "Binary Cubed"            *
 *                                   *
 *  Dr. Matthew Hibbs                *
 *  CSCI-3353 - Graphics             *
 *  Final Exam, Q3                   *
 *                                   *
 * * * * * * * * * * * * * * * * * * */

// Does "Binary Cubed" register?
//
// The rotations got wonky after adding the second star.
// I would recommend toggling comment on lines marked with
//    // TOGGLE
// in this file and Star's display function and then playing
// with the number of particles/shells and radius. The stars
// are really cool! They look better when the points of the
// concentric spheres don't share planes.
//
// On my personal machine, I have been able to run with
// ~2500 particles! Try it out!
//
// Playing with the random ranges in the Particle's constructor
// also produces interesting effects!

PImage[] redSprites;
PImage[] whiteSprites;
Star sun;
Star whiteDwarf;

void setup() {
  size(800,800,P3D);
  
  redSprites = new PImage[6];
  redSprites[0] = loadImage("fire2.png");
  redSprites[1] = loadImage("orange1.png");
  redSprites[2] = loadImage("orange2.png");
  redSprites[3] = loadImage("yellow1.jpg");
  redSprites[4] = loadImage("yellow2.png");
  redSprites[5] = loadImage("yellow3.png");
  //redSprites[6] = loadImage("spark1.png");
  //redSprites[7] = loadImage("fire1.png");
  //redSprites[8] = loadImage("red1.png");
  //redSprites[9] = loadImage("red2.png");
  //redSprites[10] = loadImage("red3.png");
  whiteSprites = new PImage[9];
  whiteSprites[0] = loadImage("blue1.png");
  whiteSprites[1] = loadImage("blue2.png");
  whiteSprites[2] = loadImage("blue3.png");
  whiteSprites[3] = loadImage("blue4.png");
  whiteSprites[4] = loadImage("blue5.png");
  whiteSprites[5] = loadImage("white1.png");
  whiteSprites[6] = loadImage("white2.png");
  whiteSprites[7] = loadImage("white3.png");
  whiteSprites[8] = loadImage("white4.png");
  //whiteSprites[9] = loadImage("green1.png");
  //whiteSprites[10] = loadImage("green2.png");
  
  sun = new Star(new PVector(0,0,0), 400,2500,5, redSprites);
  
  //sun = new Star(new PVector(-300,0,300), 400,1250,3, redSprites);  // TOGGLE
  //whiteDwarf = new Star(new PVector(300,0,-300), 200,800,2, whiteSprites);  // TOGGLE
}


void draw() {
  background(0);
  translate(width/2,height/2, -1000);
  sun.display();
  //whiteDwarf.display();
}
