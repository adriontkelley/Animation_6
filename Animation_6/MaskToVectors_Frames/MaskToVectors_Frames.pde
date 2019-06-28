///This sketch was modified by undergrad Adrion T. Kelley for University of Oregon Art & Technology (UOAT) 2017
///adrionk@uoregon.edu

////This sketch requires the dawesometoolkit Processing library


/////This sketch needs a few seconds to load all the png files before it plays




// =====================================
// Dawesome Toolkit ====================
// =====================================

// =====================================
// Example using a black & white image 
// to create a list of PVectors
// =====================================

import java.util.Collections;
import java.util.Random;
import dawesometoolkit.*;



int count  = 0;

ArrayList<PVector> vectors;
DawesomeToolkit dawesome;
ArrayList<Integer> colors;

int numFrames = 11;  // The number of frames in the animation
int currentFrame = 0;
PImage[] images = new PImage[numFrames];
String imageName;



void setup() {
	size(1280, 720);
frameRate(1);



          dawesome = new DawesomeToolkit(this);
          dawesome.enableLazySave('s', ".png");
	  colors = dawesome.colorSpectrum(160, 100, 50);
 
 
        for (int i = 1; i < numFrames; i++) {
        imageName = "Art_" + nf(i, 4) + ".png";
        images[i] = loadImage(imageName);

          println(imageName);
        //delay(1000);
       }
}

void draw() {
	background(0);


        translate(0, 0);
       
       
       count++;
       if(count == images.length) count = 1;
    vectors = dawesome.maskToVectors(images[count]);
    
      
    //vectors = dawesome.centerPVectors(vectors);
        
  long seed = System.nanoTime();
  Collections.shuffle(vectors, new Random(count));
  smooth();
        
         
    
       
   int count = 0;
	for (PVector p: vectors){
		if (count%4==0){
                        noStroke();
			fill(colors.get(count%colors.size()));
			float dotSize = count%30;
			if (count%4==0){
				//rect(p.x, p.y, dotSize, dotSize);
			//} else {
				ellipse(p.x, p.y, dotSize, dotSize);
			}
		}
		count++;
	}
saveFrame("output/Art_####.png");

//println(vectors);
}