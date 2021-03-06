//ChladniFigure94

int ch94xspacing = 2; //how far apart for horizontal locations (wave fidelity)
int ch94w; //width of the wave
float ch94theta = 0.0; //start angle at 0
float ch94period; //pixels before wave repeats
float ch94dx; //Value for incrementing X, a function of period and xspacing
float[] ch94yvalues; //An array to store the height values for the wave

float ch94yoff = 0.0; //noise for the amplitude of the wave
float ch94maxAmplitude; //max height for the wave

float ch94spacing; //pixel spacing value for wave placement

float ch94colNoise = 0.1; //color noise

void ch94Setup () {
  ch94period = width;
  ch94spacing = height*0.333;
  ch94maxAmplitude = height*0.15;
  
  ch94dx = (TWO_PI / ch94period) * ch94xspacing;
  ch94yvalues = new float[width/ch94xspacing];
}

void ch94Draw () {
  pg.beginDraw();
  ch94CalcWave();
  ch94RenderWave();
  pg.endDraw();
}

void ch94CalcWave() {
  ch94theta = 0.0; //noMovement
  
  float f = map(noise(ch94yoff), 0, 1, 0, ch94maxAmplitude);
  
  ch94yoff += 0.01; //Try different values for speed at which the amplitude changes
  
  //For every x value, calculate a y value with a sine function
  float x = ch94theta;
  for (int i = 0; i < ch94yvalues.length; i++) {
    ch94yvalues[i] = sin(x)*f;
    x+=ch94dx;
  }
}

void ch94RenderWave() {
  pg.colorMode(HSB,360,100,100);
  float col = map(noise(ch94colNoise), 0, 1, 0, 360);
  
  pg.background(col, 100, 100);
  pg.noStroke();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch94yvalues.length; x++) {
    pg.curveVertex(x*ch94xspacing, ((height/2)-ch94spacing)-ch94yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch94yvalues.length; x++) {
    pg.vertex(x*ch94xspacing, ((height/2))+ch94yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch94yvalues.length; x++) {
    pg.vertex(x*ch94xspacing, ((height/2)+ch94spacing)-ch94yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  ch94colNoise += 0.01;
}
