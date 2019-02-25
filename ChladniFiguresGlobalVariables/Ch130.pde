//ChladniFigure130

int ch130xspacing = 2; //how far apart for horizontal locations (wave fidelity)
int ch130w; //width of the wave
float ch130period; //pixels before wave repeats
float ch130dx; //Value for incrementing X, a function of period and xspacing
float[] ch130yvalues; //An array to store the height values for the wave

float ch130yoff = 0.0; //noise for the amplitude of the wave
float ch130maxAmplitude; //max height for the wave

float ch130spacing; //pixel spacing value for wave placement

void ch130Setup () {
  ch130period = width * 0.4;
  ch130spacing = height*0.09;
  ch130maxAmplitude = height*0.045;
  
  ch130dx = (TWO_PI / ch130period) * ch130xspacing;
  ch130yvalues = new float[width/ch130xspacing];
}

void ch130Draw () {
  pg.beginDraw();
  ch130CalcWave();
  ch130RenderWave();
  pg.endDraw();
}

void ch130CalcWave() {
  
  float f = map(noise(ch130yoff), 0, 1, 0, ch130maxAmplitude);
  
  ch130yoff += 0.01; //Try different values for speed at which the amplitude changes
  
  //For every x value, calculate a y value with a sine function
  float x = staticTheta;
  for (int i = 0; i < ch130yvalues.length; i++) {
    ch130yvalues[i] = sin(x)*f;
    x+=ch130dx;
  }
}

void ch130RenderWave() {
  float col = map(noise(colNoise), 0, 1, 0, 360);
  
  pg.background(col, 100, 100);
  pg.noStroke();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch130yvalues.length; x++) {
    pg.vertex(x*ch130xspacing, ((height/2)-(5*ch130spacing))+ch130yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch130yvalues.length; x++) {
    pg.vertex(x*ch130xspacing, ((height/2)-(3*ch130spacing))-ch130yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch130yvalues.length; x++) {
    pg.vertex(x*ch130xspacing, ((height/2)-(ch130spacing))+ch130yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch130yvalues.length; x++) {
    pg.vertex(x*ch130xspacing, ((height/2)+ch130spacing)-ch130yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch130yvalues.length; x++) {
    pg.vertex(x*ch130xspacing, ((height/2)+(3*ch130spacing))+ch130yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch130yvalues.length; x++) {
    pg.vertex(x*ch130xspacing, ((height/2)+(5*ch130spacing))-ch130yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
}