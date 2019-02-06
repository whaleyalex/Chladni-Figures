//ChladniFigure106

int ch106xspacing = 2; //how far apart for horizontal locations (wave fidelity)
int ch106w; //width of the wave
float ch106theta = 0.0; //start angle at 0
float ch106period; //pixels before wave repeats
float ch106dx; //Value for incrementing X, a function of period and xspacing
float[] ch106yvalues; //An array to store the height values for the wave

float ch106yoff = 0.0; //noise for the amplitude of the wave
float ch106maxAmplitude = 50; //max height for the wave

int ch106spacing = 60; //pixel spacing value for wave placement

float ch106colNoise = 0.1; //color noise

void ch106Setup () {
  ch106period = width * 0.6667;
  
  ch106dx = (TWO_PI / ch106period) * ch106xspacing;
  ch106yvalues = new float[width/ch106xspacing];
}

void ch106Draw () {
  pg.beginDraw();
  ch106CalcWave();
  ch106RenderWave();
  pg.endDraw();
}

void ch106CalcWave() {
  ch106theta += 0.02; //incrememnt theta for different values of 'angular velocity'
  //ch106theta = 0.0; //noMovement\
  
  float f = map(noise(ch106yoff), 0, 1, 0, ch106maxAmplitude);
  
  ch106yoff += 0.01; //Try different values for speed at which the amplitude changes
  
  //For every x value, calculate a y value with a sine function
  float x = ch106theta;
  for (int i = 0; i < ch106yvalues.length; i++) {
    ch106yvalues[i] = sin(x)*f;
    x+=ch106dx;
  }
}

void ch106RenderWave() {
  pg.colorMode(HSB,360,100,100);
  float col = map(noise(ch106colNoise), 0, 1, 0, 360);
  
  pg.background(col, 100, 100);
  pg.noStroke();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch106yvalues.length; x++) {
    pg.vertex(x*ch106xspacing, ((height/2)-(3*ch106spacing))+ch106yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch106yvalues.length; x++) {
    pg.vertex(x*ch106xspacing, ((height/2)-ch106spacing)-ch106yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch106yvalues.length; x++) {
    pg.vertex(x*ch106xspacing, ((height/2)+ch106spacing)+ch106yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch106yvalues.length; x++) {
    pg.vertex(x*ch106xspacing, ((height/2)+(3*ch106spacing))-ch106yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
    
  ch106colNoise += 0.01;
}
