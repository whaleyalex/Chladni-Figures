//ChladniFigure67

int ch67xspacing = 1; //How far apart each vertical position should be

float ch67theta = 0.0; //Start angle at zero
float ch67period; //How many pixels before the wave repeats
float ch67dx; //Value for incrementing Y, as a function of period and yspacing
float[] ch67yvalues; //Using an array to store horizontal values for the wave

float ch67yoff = 0.0; //noise for the amplitude of the wave
float ch67maxAmplitude; //max height for the wave

float ch67colNoise = 0.1;

PShape ch67s;

void ch67Setup () {
  ch67period = width*2;
  ch67dx = (TWO_PI / ch67period) * ch67xspacing;
  ch67yvalues = new float[width/ch67xspacing];
  
  ch67maxAmplitude = height/2;
  
  ch67s = loadShape("CircleHole.svg");
}

void ch67Draw () {
  pg.beginDraw();
  ch67CalcWave();
  ch67RenderWave();
  pg.endDraw();
}

void ch67CalcWave() {
  //ch67theta += 0.02; //angular velocity
  ch67theta = 0.0; //no movement
  
  float f = map(noise(ch67yoff), 0, 1, 0, ch67maxAmplitude);
  
  ch67yoff += 0.01; //Try different values for speed at which the amplitude changes
  
  float x = ch67theta;
  for (int i = 0; i < ch67yvalues.length; i++) {
    ch67yvalues[i] = sin(x)*f;
    x+=ch67dx;
  }
}

void ch67RenderWave() {  
  pg.colorMode(HSB,360,100,100);
  float col = map(noise(ch67colNoise), 0, 1, 240, 360);
  float oppCol = (360-col) + 240;
  
  //pg.background(col, 70, 75);
  pg.noStroke();
  
  pg.fill(oppCol, 70, 75);
  pg.ellipse(width/2,height/2,width,height);
  
  pg.fill(col, 70, 75);
  pg.beginShape();
  for (int x = 0; x < ch67yvalues.length; x++) {
    pg.vertex(x*ch67xspacing,(height)-ch67yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0,height);
  pg.endShape();
  
  ch67s.disableStyle();
  pg.fill(col, 70, 50);
  pg.shape(ch67s,0,0,width,height);
  
  
  ch67colNoise += 0.01;
}
