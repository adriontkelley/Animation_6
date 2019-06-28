/**
* Display of Character Like Electronic Signboard
*
* @author aa_debdeb
* @date 2015/11/14
*/


////Modified by Adrion T. Kelley

int count  = 0;
int numFrames = 11;  // The number of frames in the animation
int currentFrame = 0;
PImage[] images = new PImage[numFrames];
String imageName;





PImage img;

void setup(){
  size(568, 320);
  smooth();
  background(0);
  frameRate(10);
 
 for (int i = 1; i < numFrames; i++) {
        imageName = "Art_" + nf(i, 4) + ".png";
        images[i] = loadImage(imageName);

          println(imageName);
        //delay(1000);
       }

  
  
  
  img = new PImage(568,320);
  
  
}

void draw(){
  
  background(0);
  fill(255);
  
  
  
  
 count++;
       if(count == images.length) count = 1;
    img.copy(images[count], 0, 0, images[count].width, images[count].height, 
        0, 0, img.width, img.height);
  
  
  boolean[][] dots = new boolean[56][32];
  
  //images[count].loadPixels();
  for(int x = 0; x < 56; x++){
    for(int y = 0; y < 32; y++){
     
      color c = img.pixels[y * 10 * width + x * 10];
      dots[x][y] = red(c) > 127 ? true: false;
    }
  }
  //images[count].updatePixels();
  background(0);
  stroke(0);
  for(int x = 0; x < 56; x++){
    for(int y = 0; y < 32; y++){
      if(dots[x][y]){
        fill(0);  
      } else {
        fill(255, 140, 0);
      }
      ellipse(x * 10, y* 10, 10, 10);        
    }
  }
  
//saveFrame("output/Art_####.png");
}