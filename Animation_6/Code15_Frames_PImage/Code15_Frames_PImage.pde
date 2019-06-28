///modified by Adrion T. Kelley 2018
////This sketch only runs in Processing 3


int fc, num = 20000;
ArrayList ballCollection; 
boolean save = false;
float scal, theta;



 
int count  = 0;
int numFrames = 11;  // The number of frames in the animation
int currentFrame = 0;
PImage[] images = new PImage[numFrames];
String imageName;





PImage img;


void setup() {
 // background(0);
  size(1280, 720, P3D);
  frameRate(1);
  
  
  
  for (int i = 1; i < numFrames; i++) {
        imageName = "Art_" + nf(i, 4) + ".png";
        images[i] = loadImage(imageName);

          println(imageName);
        //delay(1000);
       }

  
  
  
  img = new PImage(1280, 720);
  
  
  ballCollection = new ArrayList();
  
  
}

void draw() {
  background(0);
  
   count++;
       if(count == images.length) count = 1;
    img.copy(images[count], 0, 0, images[count].width, images[count].height, 
        0, 0, img.width, img.height);
  
 
  for (int i=0; i<ballCollection.size (); i++) {
    Ball mb = (Ball) ballCollection.get(i);
    mb.run();
  } 
  
 

  theta += .0523;

 
 
        
        createStuff();
        
        saveFrame("output/Art_####.png");

}





void createStuff() {
  ballCollection.clear();
 
  
 

  for (int i=0; i<num; i++) {
    int x = (int)random(width);
    int y = (int)random(height);
    
    
    
    int c = img.pixels[x+y*width];
    if (brightness(c)<255) {
      PVector org = new PVector(x, y);
      float radius = random(1,6);
      PVector loc = new PVector(org.x+radius, org.y);
      float offSet = random(TWO_PI);
      int dir = 10;
      float r = random(10);
      if (r>.1) dir =-1;
      Ball myBall = new Ball(org, loc, radius, dir, offSet);
      ballCollection.add(myBall);
    }
  }
}

class Ball {

  PVector org, loc;
  float sz = 1;
  float radius, offSet, a;
  int s, dir, countC, d = 20;
  boolean[] connection = new boolean[num];

  Ball(PVector _org, PVector _loc, float _radius, int _dir, float _offSet) {
    org = _org;
    loc = _loc;
    radius = _radius;
    dir = _dir;
    offSet = _offSet;
  }

  void run() {
    
    
    display();
    move();
    lineBetween();
    }
  

  void move() {
    
    loc.x = org.x + sin(theta*dir+offSet)*radius;
    loc.y = org.y + cos(theta*dir+offSet)*radius;
    
  }

  void lineBetween() {
    
    countC = 1;
  
    for (int i=0; i<ballCollection.size(); i++) {
      Ball other = (Ball) ballCollection.get(i);
      float distance = loc.dist(other.loc);
      if (distance >0 && distance < d) {
        a = map(countC,0,10,10,255);
        stroke(random(255),random(255),random(255), a);
        line(loc.x, loc.y, other.loc.x, other.loc.y);
        connection[i] = true;
      } 
      else {
        connection[i] = false;
      }
    }
    for (int i=0; i<ballCollection.size(); i++) {
      if (connection[i]) countC++;
    }
  }
  

  void display() {
     
    noStroke();
    fill(random(255),random(255),random(255), 200);
    ellipse(loc.x, loc.y, sz, sz);
  }
  
}