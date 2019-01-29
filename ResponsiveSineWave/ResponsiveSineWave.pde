import processing.sound.*;
FFT fft;
AudioIn in;
int bands = 512;
float[] spectrum = new float[bands];


int xspacing = 1;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 512;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

void setup() {
  size(512, 512);
  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
  
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
  float f = avg*500*height; //less responsive

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*f;
    x+=dx;
  }
}

void renderWave() {
  stroke(255);
  noFill();
  
  beginShape();
  for (int x = 0; x < yvalues.length; x++) {
    curveVertex(x*xspacing, height/2+yvalues[x]);
  }
  endShape();
  
}
