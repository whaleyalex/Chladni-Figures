//ChladniFigure115

int ch115xspacing = 2; //how far apart for horizontal locations (wave fidelity)
int ch115w; //width of the wave
float ch115theta = 0.0; //start angle at 0
float ch115period; //pixels before wave repeats
float ch115dx; //Value for incrementing X, a function of period and xspacing
float[] ch115yvalues; //An array to store the height values for the wave

float ch115yoff = 0.0; //noise for the amplitude of the wave
float ch115maxAmplitude = 50; //max height for the wave

int ch115spacing = 105; //pixel spacing value for wave placement

float ch115colNoise = 0.1; //color noise

void ch115Setup () {
  ch115period = width * 0.4;
  
  ch115dx = (TWO_PI / ch115period) * ch115xspacing;
  ch115yvalues = new float[width/ch115xspacing];
}

void ch115Draw () {
  pg.beginDraw();
  ch115CalcWave();
  ch115RenderWave();
  pg.endDraw();
}

void ch115CalcWave() {
  //ch113theta += 0.02; //incrememnt theta for different values of 'angular velocity'
  ch115theta = 0.0; //noMovement\
  
  float f = map(noise(ch115yoff), 0, 1, 0, ch115maxAmplitude);
  
  ch115yoff += 0.01; //Try different values for speed at which the amplitude changes
  
  //For every x value, calculate a y value with a sine function
  float x = ch115theta;
  for (int i = 0; i < ch115yvalues.length; i++) {
    ch115yvalues[i] = sin(x)*f;
    x+=ch115dx;
  }
}

void ch115RenderWave() {
  pg.colorMode(HSB,360,100,100);
  float col = map(noise(ch115colNoise), 0, 1, 0, 360);
  
  pg.background(col, 100, 100);
  pg.noStroke();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch115yvalues.length; x++) {
    pg.vertex(x*ch115xspacing, ((height/2)-(2*ch115spacing))+ch115yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch115yvalues.length; x++) {
    pg.vertex(x*ch115xspacing, ((height/2)-(ch115spacing))-ch115yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch115yvalues.length; x++) {
    pg.vertex(x*ch115xspacing, (height/2)+ch115yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch115yvalues.length; x++) {
    pg.vertex(x*ch115xspacing, ((height/2)+ch115spacing)-ch115yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch115yvalues.length; x++) {
    pg.vertex(x*ch115xspacing, ((height/2)+(2*ch115spacing))+ch115yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  ch115colNoise += 0.01;
}
