//ChladniFigure50

float[] ch50xvalues = new float[360]; //An array to store the horizontal values for the wave
float[] ch50yvalues = new float[360]; //An array to store the height values for the wave

float ch50yoff = 0.0; //noise for the amplitude of the wave
float ch50maxAmplitude; //max height for the wave
float ch50radius;
int ch50numOfSins;

//float ch50spacing; //pixel spacing value for wave placement

float ch50colNoise = 0.1; //color noise

void ch50Setup () {
  ch50maxAmplitude = height*0.15;
  ch50radius = height/2;
  ch50numOfSins = 5;
}

void ch50Draw () {
  pg.beginDraw();
  ch50CalcWave();
  ch50RenderWave();
  pg.endDraw();
}

void ch50CalcWave() {
  float f = map(noise(ch50yoff), 0, 1, 0, ch50maxAmplitude);
  
  ch50yoff += 0.01; //Try different values for speed at which the amplitude changes
    
  for (int i = 0; i < 360; i++) {
    ch50xvalues[i] = (ch50radius+(f*(sin(ch50numOfSins*radians(i)))))*cos(radians(i));
    ch50yvalues[i] = (ch50radius+(f*(sin(ch50numOfSins*radians(i)))))*sin(radians(i));
  }
}

void ch50RenderWave() {
  pg.colorMode(HSB,360,100,100);
  float col = map(noise(ch50colNoise), 0, 1, 0, 360);
  
  pg.background(col, 100, 100);
  pg.noStroke();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch50yvalues.length; x++) {
    pg.curveVertex(ch50xvalues[x]+(width/2),ch50yvalues[x]+(height/2));
  }
  pg.curveVertex(ch50xvalues[0]+(width/2), ch50yvalues[0]+(height/2));
  pg.endShape();
  
  ch50colNoise += 0.01;
}
