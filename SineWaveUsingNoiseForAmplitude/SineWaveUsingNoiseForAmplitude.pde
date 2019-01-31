int xspacing = 2;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float period = 512;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave

PGraphics pg;
int dim = 512; //dimensions

float xoff = 0.0;

void setup() {
  size(512, 512, P3D);
  pg = createGraphics(dim,dim);
  textureMode(NORMAL);
  
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[width/xspacing];
  
  //frameRate(24);
}

void draw() {
  pg.beginDraw();
  
  pg.background(0);
  calcWave();
  renderWave();
  
  pg.endDraw();
  
  beginShape();
  texture(pg);
  vertex(0,0,0,0);
  vertex(width,0,1,0);
  vertex(width,height,1,1);
  vertex(0,height,0,1);
  vertex(0,height,0,1);
  endShape(CLOSE);
}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  //theta += 0.02;
  theta = 0.0; //no movement
  
  float f = map(noise(xoff), 0, 1, 0,height/2); //less responsive
  
 
  xoff += 0.01;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*f;
    x+=dx;
  }
}

void renderWave() {
  pg.stroke(255);
  pg.noFill();
  
  pg.beginShape();
  for (int x = 0; x < yvalues.length; x++) {
    pg.curveVertex(x*xspacing, height/2+yvalues[x]);
  }
  pg.endShape();
  
}
