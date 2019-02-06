//ChladniFigure90

int ch90yspacing = 1; //How far apart each vertical position should be

float ch90theta = 0.0; //Start angle at zero
float ch90period; //How many pixels before the wave repeats
float ch90dy; //Value for incrementing Y, as a function of period and yspacing
float[] ch90xvalues; //Using an array to store horizontal values for the wave

float ch90xoff = 0.0; //noise for the amplitude of the wave
float ch90maxAmplitude = 100; //max height for the wave

float ch90dist = 100; //pixels from the center line

float ch90colNoise = 0.1;

void ch90Setup () {
  ch90period = height*2;
  ch90dy = (TWO_PI / ch90period) * ch90yspacing;
  ch90xvalues = new float[height/ch90yspacing];
}

void ch90Draw () {
  pg.beginDraw();
  ch90CalcWave();
  ch90RenderWave();
  pg.endDraw();
}

void ch90CalcWave() {
  //ch90theta += 0.02; //angular velocity
  ch90theta = 0.0; //no movement
  
  float f = map(noise(ch90xoff), 0, 1, 0, ch90maxAmplitude);
  
  ch90xoff += 0.01; //Try different values for speed at which the amplitude changes
  
  float y = ch90theta;
  for (int i = 0; i < ch90xvalues.length; i++) {
    ch90xvalues[i] = sin(y)*f;
    y+=ch90dy;
  }
}

void ch90RenderWave() {
  pg.colorMode(HSB,360,100,100);
  float col = map(noise(ch90colNoise), 0, 1, 0, 360);
  
  pg.background(col, 100, 100);
  pg.noStroke();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int y = 0; y < ch90xvalues.length; y++) {
    pg.vertex((width/2)+(ch90dist)+ch90xvalues[y],y*ch90yspacing);
  }
  pg.vertex(width/2,height);
  pg.vertex(width/2,0);
  pg.endShape();
  
  pg.beginShape();
  for (int y = 0; y < ch90xvalues.length; y++) {
    pg.vertex((width/2)-(ch90dist)-ch90xvalues[y],y*ch90yspacing);
  }
  pg.vertex(width/2,height);
  pg.vertex(width/2,0);
  pg.endShape();
  
  ch90colNoise += 0.01;
}
