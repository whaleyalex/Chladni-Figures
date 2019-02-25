//ChladniFigure108

int ch108xspacing = 2; //how far apart for horizontal locations (wave fidelity)
int ch108w; //width of the wave
float ch108period; //pixels before wave repeats
float ch108dx; //Value for incrementing X, a function of period and xspacing
float[] ch108yvalues; //An array to store the height values for the wave

float ch108yoff = 0.0; //noise for the amplitude of the wave
float ch108maxAmplitude; //max height for the wave

float ch108spacing; //pixel spacing value for wave placement

void ch108Setup () {
  ch108period = width * 0.6667;
  ch108spacing = height * 0.125;
  ch108maxAmplitude = height * 0.12;
  
  ch108dx = (TWO_PI / ch108period) * ch108xspacing;
  ch108yvalues = new float[width/ch108xspacing];
}

void ch108Draw () {
  pg.beginDraw();
  ch108CalcWave();
  ch108RenderWave();
  pg.endDraw();
}

void ch108CalcWave() {
  float f = map(noise(ch108yoff), 0, 1, 0, ch108maxAmplitude);
  
  ch108yoff += 0.01; //Try different values for speed at which the amplitude changes
  
  //For every x value, calculate a y value with a sine function
  float x = negativeTheta;
  for (int i = 0; i < ch108yvalues.length; i++) {
    ch108yvalues[i] = sin(x)*f;
    x+=ch108dx;
  }
  
  negativeTheta -= 0.2;
}

void ch108RenderWave() {
  float col = map(noise(colNoise), 0, 1, 0, 360);
  
  pg.background(col, 100, 100);
  pg.noStroke();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch108yvalues.length; x++) {
    pg.vertex(x*ch108xspacing, ((height/2)-(3*ch108spacing))-ch108yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch108yvalues.length; x++) {
    pg.vertex(x*ch108xspacing, ((height/2)-ch108spacing)+ch108yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch108yvalues.length; x++) {
    pg.vertex(x*ch108xspacing, ((height/2)+ch108spacing)-ch108yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch108yvalues.length; x++) {
    pg.vertex(x*ch108xspacing, ((height/2)+(3*ch108spacing))+ch108yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
 
}
