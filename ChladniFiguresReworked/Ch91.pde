//ChladniFigure91

int ch91yspacing = 1; //How far apart each vertical position should be

float ch91theta = 0.0; //Start angle at zero
float ch91period; //How many pixels before the wave repeats
float ch91dy; //Value for incrementing Y, as a function of period and yspacing
float[] ch91xvalues; //Using an array to store horizontal values for the wave

float ch91xoff = 0.0; //noise for the amplitude of the wave
float ch91maxAmplitude = 40; //max height for the wave

float ch91colNoise = 0.1;

PShape ch91s;

void ch91Setup () {
  ch91period = height*2;
  ch91dy = (TWO_PI / ch91period) * ch91yspacing;
  ch91xvalues = new float[height/ch91yspacing];
  
  ch91s = loadShape("CircleHole.svg");
}

void ch91Draw () {
  pg.beginDraw();
  ch91CalcWave();
  ch91RenderWave();
  pg.endDraw();
}

void ch91CalcWave() {
  //ch91theta += 0.02; //angular velocity
  ch91theta = 0.0; //no movement
  
  float f = map(noise(ch91xoff), 0, 1, 0, ch91maxAmplitude);
  
  ch91xoff += 0.01; //Try different values for speed at which the amplitude changes
  
  float y = ch91theta;
  for (int i = 0; i < ch91xvalues.length; i++) {
    ch91xvalues[i] = sin(y)*f;
    y+=ch91dy;
  }
}

void ch91RenderWave() {  
  pg.colorMode(HSB,360,100,100);
  float col = map(noise(ch91colNoise), 0, 1, 240, 360);
  float oppCol = (360-col) + 240;
  
  //pg.background(col, 70, 75);
  pg.noStroke();
  
  pg.fill(oppCol, 70, 75);
  pg.ellipse(width/2,height/2,width,height);
  
  pg.fill(col, 70, 75);
  pg.beginShape();
  for (int y = 0; y < ch91xvalues.length; y++) {
    pg.vertex((width/2)+ch91xvalues[y],y*ch91yspacing);
  }
  pg.vertex(width/2,height);
  pg.vertex(width/2,0);
  pg.endShape();
  
  pg.beginShape();
  for (int y = 0; y < ch91xvalues.length; y++) {
    pg.vertex((width/2)-ch91xvalues[y],y*ch91yspacing);
  }
  pg.vertex(width/2,height);
  pg.vertex(width/2,0);
  pg.endShape();
  
  ch91s.disableStyle();
  pg.fill(col, 70, 75);
  pg.shape(ch91s,0,0,width,height);
  
  ch91colNoise += 0.01;
}
