//ChladniFigure1

int ch1yspacing = 1; //How far apart each vertical position should be

float ch1theta = 0.0; //Start angle at zero
float ch1period; //How many pixels before the wave repeats
float ch1dy; //Value for incrementing Y, as a function of period and yspacing
float[] ch1xvalues; //Using an array to store horizontal values for the wave

float ch1xoff = 0.0; //noise for the amplitude of the wave
float ch1maxAmplitude; //max height for the wave

float ch1colNoise = 0.1;

PShape ch1s;

void ch1Setup () {
  ch1period = height*2;
  ch1maxAmplitude = height*0.1;
  ch1dy = (TWO_PI / ch1period) * ch1yspacing;
  ch1xvalues = new float[height/ch1yspacing];
  
  ch1s = loadShape("CircleHole.svg");
}

void ch1Draw () {
  pg.beginDraw();
  ch1CalcWave();
  ch1RenderWave();
  pg.endDraw();
}

void ch1CalcWave() {
  //ch1theta += 0.02; //angular velocity
  ch1theta = 0.0; //no movement
  
  float f = map(noise(ch1xoff), 0, 1, 0, ch1maxAmplitude);
  
  ch1xoff += 0.01; //Try different values for speed at which the amplitude changes
  
  float y = ch1theta;
  for (int i = 0; i < ch1xvalues.length; i++) {
    ch1xvalues[i] = sin(y)*f;
    y+=ch1dy;
  }
}

void ch1RenderWave() {  
  pg.colorMode(HSB,360,100,100);
  float col = map(noise(ch1colNoise), 0, 1, 240, 360);
  float oppCol = (360-col) + 240;
  
  //pg.background(col, 70, 75);
  pg.noStroke();
  
  pg.fill(oppCol, 70, 75);
  pg.ellipse(width/2,height/2,width,height);
  
  pg.fill(col, 70, 75);
  pg.beginShape();
  for (int y = 0; y < ch1xvalues.length; y++) {
    pg.vertex((width/2)+ch1xvalues[y],y*ch1yspacing);
  }
  pg.vertex(width/2,height);
  pg.vertex(width/2,0);
  pg.endShape();
  
  pg.beginShape();
  for (int y = 0; y < ch1xvalues.length; y++) {
    pg.vertex((width/2)-ch1xvalues[y],y*ch1yspacing);
  }
  pg.vertex(width/2,height);
  pg.vertex(width/2,0);
  pg.endShape();
  
  ch1s.disableStyle();
  pg.fill(col, 70, 75);
  pg.shape(ch1s,0,0,width,height);
  
  ch1colNoise += 0.01;
}
