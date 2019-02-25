//ChladniFigure50

float[] ch50xvalues1 = new float[360]; //An array to store the horizontal values for the wave
float[] ch50yvalues1 = new float[360]; //An array to store the height values for the wave

float[] ch50xvalues2 = new float[360]; //An array to store the horizontal values for the wave
float[] ch50yvalues2 = new float[360]; //An array to store the height values for the wave

float[] ch50xvalues3 = new float[360]; //An array to store the horizontal values for the wave
float[] ch50yvalues3 = new float[360]; //An array to store the height values for the wave

float ch50yoff1 = 0.0; //noise for the amplitude of the wave
float ch50maxAmplitude1; //max height for the wave
float ch50radius1;
int ch50numOfSins1;

float ch50yoff2 = 0.1; //noise for the amplitude of the wave
float ch50maxAmplitude2; //max height for the wave
float ch50radius2;
int ch50numOfSins2;

float ch50yoff3 = 0.2; //noise for the amplitude of the wave
float ch50maxAmplitude3; //max height for the wave
float ch50radius3;
int ch50numOfSins3;

float ch50xoffCirc = 0.3; //noise for the x dimension of the ellipse
float ch50yoffCirc = 0.4; //noise for the y dimension of the ellipse
float ch50maxDisplacement; //maxDisplacement for dimensions of ellipse in the center of the figure

void ch50Setup () {
  ch50maxAmplitude1 = height*0.03;
  ch50radius1 = height*0.45;
  ch50numOfSins1 = 12;
  
  ch50maxAmplitude2 = height*0.025;
  ch50radius2 = height*0.35;
  ch50numOfSins2 = 12;
  
  ch50maxAmplitude3 = height*0.02;
  ch50radius3 = height*0.25;
  ch50numOfSins3 = 12;
  
  ch50maxDisplacement = width*0.05;
}

void ch50Draw () {
  pg.beginDraw();
  ch50CalcWave();
  ch50RenderWave();
  pg.endDraw();
}

void ch50CalcWave() {
  float f1 = map(noise(ch50yoff1), 0, 1, 0, ch50maxAmplitude1);
  
  ch50yoff1 += 0.01; //Try different values for speed at which the amplitude changes
    
  for (int i = 0; i < 360; i++) {
    ch50xvalues1[i] = (ch50radius1+(f1*(-cos(ch50numOfSins1*radians(i)))))*cos(radians(i));
    ch50yvalues1[i] = (ch50radius1+(f1*(-cos(ch50numOfSins1*radians(i)))))*sin(radians(i));
  }
  
  float f2 = map(noise(ch50yoff2), 0, 1, 0, ch50maxAmplitude2);
  
  ch50yoff2 += 0.01; //Try different values for speed at which the amplitude changes
    
  for (int i = 0; i < 360; i++) {
    ch50xvalues2[i] = (ch50radius2+(f2*(cos(ch50numOfSins2*radians(i)))))*cos(radians(i));
    ch50yvalues2[i] = (ch50radius2+(f2*(cos(ch50numOfSins2*radians(i)))))*sin(radians(i));
  }
  
  float f3 = map(noise(ch50yoff3), 0, 1, 0, ch50maxAmplitude3);
  
  ch50yoff3 += 0.01; //Try different values for speed at which the amplitude changes
    
  for (int i = 0; i < 360; i++) {
    ch50xvalues3[i] = (ch50radius3+(f3*(-cos(ch50numOfSins3*radians(i)))))*cos(radians(i));
    ch50yvalues3[i] = (ch50radius3+(f3*(-cos(ch50numOfSins3*radians(i)))))*sin(radians(i));
  }
}

void ch50RenderWave() {
  float col = map(noise(colNoise), 0, 1, 0, 360);
  
  pg.background(col, 100, 100);
  pg.noStroke();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch50yvalues1.length; x++) {
    pg.curveVertex(ch50xvalues1[x]+(width/2),ch50yvalues1[x]+(height/2));
  }
  pg.curveVertex(ch50xvalues1[0]+(width/2), ch50yvalues1[0]+(height/2));
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch50yvalues2.length; x++) {
    pg.curveVertex(ch50xvalues2[x]+(width/2),ch50yvalues2[x]+(height/2));
  }
  pg.curveVertex(ch50xvalues2[0]+(width/2), ch50yvalues2[0]+(height/2));
  pg.endShape();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch50yvalues3.length; x++) {
    pg.curveVertex(ch50xvalues3[x]+(width/2),ch50yvalues3[x]+(height/2));
  }
  pg.curveVertex(ch50xvalues3[0]+(width/2), ch50yvalues3[0]+(height/2));
  pg.endShape();
  
  float xoff = map(noise(ch50xoffCirc), 0, 1, -ch50maxDisplacement, ch50maxDisplacement);
  float yoff = map(noise(ch50yoffCirc), 0, 1, -ch50maxDisplacement, ch50maxDisplacement);
  
  pg.fill(col, 100, 100);
  pg.ellipse(width/2,height/2,(width*0.333)+xoff,(height*0.333)+yoff);
  
  circle.disableStyle();
  pg.fill(col, 70, 75);
  pg.shape(circle,0,0,width,height);
  
  ch50xoffCirc += 0.01;
  ch50yoffCirc += 0.01;
}
