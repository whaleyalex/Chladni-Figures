import processing.sound.*;
FFT fft;
AudioIn in;
int bands = 512;
float[] spectrum = new float[bands];


int yspacing = 1;   // How far apart should each vertical location be spaced
int h;              // Height of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height (width) of wave but this is only if the wave is static
float period = 1024;  // How many pixels before the wave repeats
float dy;  // Value for incrementing Y, a function of period and yspacing
float[] xvalues;  // Using an array to store height values for the wave

void setup() {
  size(512, 512);
  h = height+16;
  dy = (TWO_PI / period) * yspacing;
  xvalues = new float[h/yspacing];
  
  fft = new FFT(this);
  in = new AudioIn(this,0);
  
  in.start();
  
  fft.input(in);
  
  frameRate(24);
}

void draw() {
  background(0);
  calcWave();
  renderWave();
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  //theta += 0.02;
  theta = 0; //no movement
  
  fft.analyze(spectrum);
  
  float sum = 0;
  float avg = 0;
  for (int i = 0; i < bands; i++) {
    sum += spectrum[i];
  }
  avg = sum/bands;
  
  //float f = (spectrum[0]*100*height); //more responsive
  float f = avg*500*width; //less responsive

  // For every x value, calculate a y value with sine function
  float y = theta;
  for (int i = 0; i < xvalues.length; i++) {
    xvalues[i] = sin(y)*f;
    y+=dy;
  }
}

void renderWave() {
  stroke(255);
  //noFill();
  fill(255);
  
  beginShape();
  for (int y = 0; y < xvalues.length; y++) {
    curveVertex(width/2+xvalues[y], y*yspacing);
  }
  endShape();
  
  beginShape();
  for (int y = 0; y < xvalues.length; y++) {
    curveVertex(width/2-xvalues[y], y*yspacing);
  }
  endShape();
  
  noFill();
  ellipse(256,256,512,512);
}
