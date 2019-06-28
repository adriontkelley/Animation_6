/**
 * Zoom. 
 * 
 * Move the cursor over the image to alter its position. Click and press
 * the mouse to zoom. This program displays a series of lines with their 
 * heights corresponding to a color value read from an image. 
 */
 
 
 ////Modified by Adrion T. Kelley
 
 int count  = 0;
int numFrames = 11;  // The number of frames in the animation
int currentFrame = 0;
PImage[] images = new PImage[numFrames];
String imageName;
 
 

PImage img;
int[][] imgPixels;
float sval = 1.0;
float nmx, nmy;
int res = 5;

void setup() {
  size(1000, 700, P3D);
  
  smooth();
    frameRate(5);
  noFill();
  stroke(255);
  //img = loadImage("ystone08.jpg");
  
  for (int i = 1; i < numFrames; i++) {
        imageName = "Art_" + nf(i, 4) + ".png";
        images[i] = loadImage(imageName);

          println(imageName);
        //delay(1000);
       }

  
  
  
  img = new PImage(568,320);
  
  
}

void draw() {
  background(0);
  count++;
       if(count == images.length) count = 1;
    img.copy(images[count], 0, 0, images[count].width, images[count].height, 
        0, 0, img.width, img.height);
  
  
  
  imgPixels = new int[img.width][img.height];
  for (int i = 0; i < img.height; i++) {
    for (int j = 0; j < img.width; j++) {
      imgPixels[j][i] = img.get(j, i);
    }
  }
  
  

  nmx += (mouseX-nmx)/20; 
  nmy += (mouseY-nmy)/20; 

  if(mousePressed) { 
    sval += 0.005; 
  } 
  else {
    sval -= 0.01; 
  }

  sval = constrain(sval, 1.0, 2.0);

  translate(width/2 + nmx * sval-100, height/2 + nmy*sval - 100, -50);
  scale(sval);
  rotateZ(PI/2 - sval + 1.0);
  rotateX(map(mouseX, 0, width, -PI, PI));
  //rotateY(sval/8 - 0.125);

  translate(-width/2, -height/2, 0);

  for (int i = 0; i < img.height; i += res) {
    for (int j = 0; j < img.width; j += res) {
      float rr = red(imgPixels[j][i]); 
      float gg = green(imgPixels[j][i]);
      float bb = blue(imgPixels[j][i]);
      float tt = rr+gg+bb;
      stroke(rr, gg, gg);
      line(i, j, tt/10-20, i, j, tt/10 );
    }
  }
  
  //saveFrame("output/Art_####.png");
}