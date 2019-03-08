//ChladniFigure50

float[] ch50xvalues1 = new float[360]; //An array to store the horizontal values for the wave
float[] ch50yvalues1 = new float[360]; //An array to store the height values for the wave

float[] ch50xvalues2 = new float[360]; //An array to store the horizontal values for the wave
float[] ch50yvalues2 = new float[360]; //An array to store the height values for the wave

float[] ch50xvalues3 = new float[360]; //An array to store the horizontal values for the wave
float[] ch50yvalues3 = new float[360]; //An array to store the height values for the wave

float ch50maxAmplitude1; //max height for the wave
float ch50radius1;
int ch50numOfSins1;

float ch50maxAmplitude2; //max height for the wave
float ch50radius2;
int ch50numOfSins2;

float ch50maxAmplitude3; //max height for the wave
float ch50radius3;
int ch50numOfSins3;

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
  float f1 = map(ampNoise1, min1, max1, 0, ch50maxAmplitude1);
    
  for (int i = 0; i < 360; i++) {
    ch50xvalues1[i] = (ch50radius1+(f1*(-cos(ch50numOfSins1*radians(i)))))*cos(radians(i));
    ch50yvalues1[i] = (ch50radius1+(f1*(-cos(ch50numOfSins1*radians(i)))))*sin(radians(i));
  }
  
  float f2 = map(ampNoise2, min2, max2, 0, ch50maxAmplitude2);
    
  for (int i = 0; i < 360; i++) {
    ch50xvalues2[i] = (ch50radius2+(f2*(cos(ch50numOfSins2*radians(i)))))*cos(radians(i));
    ch50yvalues2[i] = (ch50radius2+(f2*(cos(ch50numOfSins2*radians(i)))))*sin(radians(i));
  }
  
  float f3 = map(ampNoise3, min3, max3, 0, ch50maxAmplitude3);
    
  for (int i = 0; i < 360; i++) {
    ch50xvalues3[i] = (ch50radius3+(f3*(-cos(ch50numOfSins3*radians(i)))))*cos(radians(i));
    ch50yvalues3[i] = (ch50radius3+(f3*(-cos(ch50numOfSins3*radians(i)))))*sin(radians(i));
  }
}

void ch50RenderWave() {
  pg.background(col, 100, 100);
  pg.noStroke();
  
  pg.pushMatrix();
  pg.translate(width/2,height/2);
  pg.rotate(radians(rot*1.5));
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch50yvalues1.length; x++) {
    pg.curveVertex(ch50xvalues1[x],ch50yvalues1[x]);
  }
  pg.curveVertex(ch50xvalues1[0], ch50yvalues1[0]);
  pg.endShape();
  
  pg.popMatrix();
  
  pg.pushMatrix();
  pg.translate(width/2,height/2);
  pg.rotate(radians(-rot));
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch50yvalues2.length; x++) {
    pg.curveVertex(ch50xvalues2[x],ch50yvalues2[x]);
  }
  pg.curveVertex(ch50xvalues2[0], ch50yvalues2[0]);
  pg.endShape();
  
  pg.popMatrix();
  
  pg.pushMatrix();
  pg.translate(width/2,height/2);
  pg.rotate(radians(rot*0.5));
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch50yvalues3.length; x++) {
    pg.curveVertex(ch50xvalues3[x],ch50yvalues3[x]);
  }
  pg.curveVertex(ch50xvalues3[0], ch50yvalues3[0]);
  pg.endShape();
  
  pg.popMatrix();
  
  float xoff = map(xNoise, min6, max6, -ch50maxDisplacement, ch50maxDisplacement);
  float yoff = map(yNoise, min7, max7, -ch50maxDisplacement, ch50maxDisplacement);
  
  pg.fill(col, 100, 100);
  pg.ellipse(width/2,height/2,(width*0.333)+xoff,(height*0.333)+yoff);
  
  //circle.disableStyle(); //circlular surroundings
  //pg.fill(col, 70, 75);
  //pg.shape(circle,0,0,width,height);
}
