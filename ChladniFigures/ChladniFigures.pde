PGraphics pg;
int dim = 512; //dimension for width and height

//Chladni Figure 1
///*
int yspacing = 1; //How far apart each vertical position should be
int h; // height of the entire wave

float theta = 0.0; //Start angle at zero
float period; //How many pixels before the wave repeats
float dy; //Value for incrementing Y, as a function of period and yspacing
float[] xvalues; //Using an array to store horizontal values for the wave

float xoff = 0.0; //noise for the amplitude of the wave
float maxAmplitude = 40; //max height for the wave

float colNoise = 0.1;
//*/

//Chladni Figure 89
/* 
float lowerLimit; //minDimension for the ellipse
float upperLimit; //max dimension for the ellipse

float colNoise = 0.1;
float dimNoise = 0.0;
*/

//Chladni Figure 94
/*
int xspacing = 2; //how far apart for horizontal locations (wave fidelity)
int w; //width of the wave
float theta = 0.0; //start angle at 0
//float amplitude = 75.0; //for a static amplitude
float period; //pixels before wave repeats
float dx; //Value for incrementing X, a function of period and xspacing
float[] yvalues; //An array to store the height values for the wave

float yoff = 0.0; //noise for the amplitude of the wave
float maxAmplitude = 75; //max height for the wave

int spacing = 150; //pixel spacing value for wave placement

float colNoise = 0.1; //color noise
*/

//Chladni Figure 106
/*
int xspacing = 2; //how far apart for horizontal locations (wave fidelity)
int w; //width of the wave
float theta = 0.0; //start angle at 0
//float amplitude = 75.0; //for a static amplitude
float period; //pixels before wave repeats
float dx; //Value for incrementing X, a function of period and xspacing
float[] yvalues; //An array to store the height values for the wave

float yoff = 0.0; //noise for the amplitude of the wave
float maxAmplitude = 50; //max height for the wave

int spacing = 60; //pixel spacing value for wave placement
*/

void setup() {
  size(512, 512, P3D);
  pg = createGraphics(dim,dim);
  textureMode(NORMAL);
  
  //Chladni Figure 1
  ///*
  h = height;
  period = height*2;
  dy = (TWO_PI / period) * yspacing;
  xvalues = new float[h/yspacing];
  //*/
  
  //Chladni Figure 89
  /*
  lowerLimit = width-200;
  upperLimit = width-100;
  */
  
  //Chladni Figure 94
  /*
  period = width;
  
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[width/xspacing];
  */
  
  //Chladni Figure 106
  /*
  period = width * 0.6667;
  
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[width/xspacing];
  */
  
  //frameRate(24);
}

void draw() {
  pg.beginDraw();
  
  //Chladni Figure 1
  ///*
  calcWave();
  renderWave();
  //*/
  
  //Chladni Figure 89
  /*
  pg.colorMode(HSB, 360, 100, 100);
  
  float col = map(noise(colNoise), 0, 1, 0, 360);
  float dim = map(noise(dimNoise), 0, 1, lowerLimit, upperLimit);
 
  pg.background(col, 100, 100);
  pg.noStroke();
  pg.fill(360-col, 100, 100);
  pg.ellipse(width/2, height/2, dim, dim);
  
  colNoise += 0.02;
  dimNoise += 0.01;
  */
  
  //Chladni Figure 94
  /*  
  calcWave();
  renderWave();
  */
  
  //Chladni Figure 106
  /*
  pg.background(0);
  calcWave();
  renderWave();
  */
  
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
  //Chladni Figure 1
  ///*
  //theta += 0.02; //angular velocity
  theta = 0.0; //no movement
  
  float f = map(noise(xoff), 0, 1, 0, maxAmplitude);
  
  xoff += 0.01; //Try different values for speed at which the amplitude changes
  
  float y = theta;
  for (int i = 0; i < xvalues.length; i++) {
    xvalues[i] = sin(y)*f;
    y+=dy;
  }
  //*/
  
  //Chladni Figure 94
  /*
  theta = 0.0; //noMovement\
  
  float f = map(noise(yoff), 0, 1, 0, maxAmplitude);
  
  yoff += 0.01; //Try different values for speed at which the amplitude changes
  
  //For every x value, calculate a y value with a sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*f;
    x+=dx;
  }
  */
  
  //Chladni Figure 106
  /*
  //theta += 0.02; //incrememnt theta for different values of 'angular velocity'
  theta = 0.0; //noMovement\
  
  float f = map(noise(yoff), 0, 1, 0, maxAmplitude);
  
  yoff += 0.01; //Try different values for speed at which the amplitude changes
  
  //For every x value, calculate a y value with a sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*f;
    x+=dx;
  }
  */
}

void renderWave() {
  //Chladni Figure 1
  ///*
  pg.colorMode(HSB,360,100,100);
  float col = map(noise(colNoise), 0, 1, 0, 360);
  
  pg.background(col, 100, 100);
  pg.noStroke();
  
  pg.fill(360-col, 100, 100);
  pg.ellipse(width/2,height/2,width,height);
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int y = 0; y < xvalues.length; y++) {
    pg.vertex((width/2)+xvalues[y],y*yspacing);
  }
  pg.vertex(width/2,height);
  pg.vertex(width/2,0);
  pg.endShape();
  
  pg.beginShape();
  for (int y = 0; y < xvalues.length; y++) {
    pg.vertex((width/2)-xvalues[y],y*yspacing);
  }
  pg.vertex(width/2,height);
  pg.vertex(width/2,0);
  pg.endShape();
  
  colNoise += 0.01;
  //*/
  
  //Chladni Figure 94
  /*
  pg.colorMode(HSB,360,100,100);
  float col = map(noise(colNoise), 0, 1, 0, 360);
  
  pg.background(col, 100, 100);
  pg.noStroke();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < yvalues.length; x++) {
    pg.curveVertex(x*xspacing, ((height/2)-spacing)-yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < yvalues.length; x++) {
    pg.vertex(x*xspacing, ((height/2))+yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < yvalues.length; x++) {
    pg.curveVertex(x*xspacing, ((height/2)+spacing)-yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  colNoise += 0.01;
  */
  
  //Chladni Figure 106
  /*
  pg.stroke(255);
  pg.noFill();
  
  pg.beginShape();
  for (int x = 0; x < yvalues.length; x++) {
    pg.curveVertex(x*xspacing, ((height/2)+spacing)+yvalues[x]);
  }
  pg.endShape();
  
  pg.beginShape();
  for (int x = 0; x < yvalues.length; x++) {
    pg.curveVertex(x*xspacing, ((height/2)-spacing)-yvalues[x]);
  }
  pg.endShape();
  
  pg.beginShape();
  for (int x = 0; x < yvalues.length; x++) {
    pg.curveVertex(x*xspacing, ((height/2)+(3*spacing))-yvalues[x]);
  }
  pg.endShape();
  
  pg.beginShape();
  for (int x = 0; x < yvalues.length; x++) {
    pg.curveVertex(x*xspacing, ((height/2)-(3*spacing))+yvalues[x]);
  }
  pg.endShape();
  */
}
