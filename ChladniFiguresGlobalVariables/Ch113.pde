//ChladniFigure113

float[] ch113xvalues1 = new float[360]; //An array to store the horizontal values for the wave
float[] ch113yvalues1 = new float[360]; //An array to store the height values for the wave

float[] ch113xvalues2 = new float[360]; //An array to store the horizontal values for the wave
float[] ch113yvalues2 = new float[360]; //An array to store the height values for the wave

float[] ch113xvalues3 = new float[360]; //An array to store the horizontal values for the wave
float[] ch113yvalues3 = new float[360]; //An array to store the height values for the wave

float ch113yoff1 = 0.0; //noise for the amplitude of the wave
float ch113maxAmplitude1; //max height for the wave
float ch113radius1;
int ch113numOfSins1;

float ch113yoff2 = 0.1; //noise for the amplitude of the wave
float ch113maxAmplitude2; //max height for the wave
float ch113radius2;
int ch113numOfSins2;

float ch113yoff3 = 0.2; //noise for the amplitude of the wave
float ch113maxAmplitude3; //max height for the wave
float ch113radius3;
int ch113numOfSins3;

void ch113Setup () {
  ch113maxAmplitude1 = height*0.2;
  ch113radius1 = height*0.6;
  ch113numOfSins1 = 4;
  
  ch113maxAmplitude2 = height*0.15;
  ch113radius2 = height*0.42;
  ch113numOfSins2 = 4;
  
  ch113maxAmplitude3 = height*0.02;
  ch113radius3 = height*0.16;
  ch113numOfSins3 = 4;
}

void ch113Draw () {
  pg.beginDraw();
  ch113CalcWave();
  ch113RenderWave();
  pg.endDraw();
}

void ch113CalcWave() {
  float f1 = map(noise(ch113yoff1), 0, 1, 0, ch113maxAmplitude1);
  
  ch113yoff1 += 0.01; //Try different values for speed at which the amplitude changes
    
  for (int i = 0; i < 360; i++) {
    ch113xvalues1[i] = (ch113radius1+(f1*(cos(ch113numOfSins1*radians(i)))))*cos(radians(i));
    ch113yvalues1[i] = (ch113radius1+(f1*(cos(ch113numOfSins1*radians(i)))))*sin(radians(i));
  }
  
  float f2 = map(noise(ch113yoff2), 0, 1, 0, ch113maxAmplitude2);
  
  ch113yoff2 += 0.01; //Try different values for speed at which the amplitude changes
    
  for (int i = 0; i < 360; i++) {
    ch113xvalues2[i] = (ch113radius2+(f2*(cos(ch113numOfSins2*radians(i)))))*cos(radians(i));
    ch113yvalues2[i] = (ch113radius2+(f2*(cos(ch113numOfSins2*radians(i)))))*sin(radians(i));
  }
  
  float f3 = map(noise(ch113yoff3), 0, 1, 0, ch113maxAmplitude3);
  
  ch113yoff3 += 0.01; //Try different values for speed at which the amplitude changes
    
  for (int i = 0; i < 360; i++) {
    ch113xvalues3[i] = (ch113radius3+(f3*(-cos(ch113numOfSins3*radians(i)))))*cos(radians(i));
    ch113yvalues3[i] = (ch113radius3+(f3*(-cos(ch113numOfSins3*radians(i)))))*sin(radians(i));
  }
}

void ch113RenderWave() {
  float col = map(noise(colNoise), 0, 1, 0, 360);
  
  pg.background(col, 100, 100);
  pg.noStroke();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch113yvalues1.length; x++) {
    pg.curveVertex(ch113xvalues1[x]+(width/2),ch113yvalues1[x]+(height/2));
  }
  pg.curveVertex(ch113xvalues1[0]+(width/2), ch113yvalues1[0]+(height/2));
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch113yvalues2.length; x++) {
    pg.curveVertex(ch113xvalues2[x]+(width/2),ch113yvalues2[x]+(height/2));
  }
  pg.curveVertex(ch113xvalues2[0]+(width/2), ch113yvalues2[0]+(height/2));
  pg.endShape();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch113yvalues3.length; x++) {
    pg.curveVertex(ch113xvalues3[x]+(width/2),ch113yvalues3[x]+(height/2));
  }
  pg.curveVertex(ch113xvalues3[0]+(width/2), ch113yvalues3[0]+(height/2));
  pg.endShape();  
}
