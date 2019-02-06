//ChladniFigure139

int ch139xspacing = 2; //how far apart for horizontal locations (wave fidelity)
int ch139w; //width of the wave
float ch139theta = 0.0; //start angle at 0
float ch139period; //pixels before wave repeats
float ch139dx; //Value for incrementing X, a function of period and xspacing
float[] ch139yvalues; //An array to store the height values for the wave

float ch139yoff = 0.0; //noise for the amplitude of the wave
float ch139maxAmplitude = 50; //max height for the wave

int ch139spacing = 60; //pixel spacing value for wave placement

float ch139colNoise = 0.1; //color noise

float ch139maxPix = 30; //max num pixels line moves up and down
float ch139heightNoise = 0.0; // noise variable for height up and down curve moves

void ch139Setup () {
  ch139period = width * 0.6667;
  
  ch139dx = (TWO_PI / ch139period) * ch139xspacing;
  ch139yvalues = new float[width/ch139xspacing];
}

void ch139Draw () {
  pg.beginDraw();
  ch139CalcWave();
  ch139RenderWave();
  pg.endDraw();
}

void ch139CalcWave() {
  //ch139theta += 0.02; //incrememnt theta for different values of 'angular velocity'
  ch139theta = 0.0; //noMovement\
  
  float f = map(noise(ch139yoff), 0, 1, 0, ch139maxAmplitude);
  
  ch139yoff += 0.01; //Try different values for speed at which the amplitude changes
  
  //For every x value, calculate a y value with a sine function
  float x = ch139theta;
  for (int i = 0; i < ch139yvalues.length; i++) {
    ch139yvalues[i] = sin(x)*f;
    x+=ch139dx;
  }
}

void ch139RenderWave() {
  pg.colorMode(HSB,360,100,100);
  float col = map(noise(ch139colNoise), 0, 1, 0, 360);
  
  pg.background(col, 100, 100);
  pg.noStroke();
  
  float var = map(noise(ch139heightNoise), 0, 1, -ch139maxPix, ch139maxPix);
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch139yvalues.length; x++) {
    pg.vertex(x*ch139xspacing, ((height/2)-(3*ch139spacing))-ch139yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  pg.vertex(0, (((height/2)-(2*ch139spacing))+var));
  pg.vertex(width, (((height/2)-(2*ch139spacing))+var));
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch139yvalues.length; x++) {
    pg.vertex(x*ch139xspacing, ((height/2)-ch139spacing)+ch139yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  pg.vertex(0, ((height/2)+var));
  pg.vertex(width, ((height/2)+var));
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch139yvalues.length; x++) {
    pg.vertex(x*ch139xspacing, ((height/2)+ch139spacing)-ch139yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  pg.vertex(0, (((height/2)+(2*ch139spacing))+var));
  pg.vertex(width, (((height/2)+(2*ch139spacing))+var));
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch139yvalues.length; x++) {
    pg.vertex(x*ch139xspacing, ((height/2)+(3*ch139spacing))+ch139yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  ch139colNoise += 0.01;
  ch139heightNoise += 0.01;
}
