//ChladniFigure62

float[] ch62xvalues1 = new float[360]; //An array to store the horizontal values for the wave
float[] ch62yvalues1 = new float[360]; //An array to store the height values for the wave

float[] ch62xvalues2 = new float[360]; //An array to store the horizontal values for the wave
float[] ch62yvalues2 = new float[360]; //An array to store the height values for the wave

float[] ch62xvalues3 = new float[360]; //An array to store the horizontal values for the wave
float[] ch62yvalues3 = new float[360]; //An array to store the height values for the wave

float[] ch62xvalues4 = new float[360]; //An array to store the horizontal values for the wave
float[] ch62yvalues4 = new float[360]; //An array to store the height values for the wave

float[] ch62xvalues5 = new float[360]; //An array to store the horizontal values for the wave
float[] ch62yvalues5 = new float[360]; //An array to store the height values for the wave

float ch62maxAmplitude1; //max height for the wave
float ch62radius1;
int ch62numOfSins1;

float ch62maxAmplitude2; //max height for the wave
float ch62radius2;
int ch62numOfSins2;

float ch62maxAmplitude3; //max height for the wave
float ch62radius3;
int ch62numOfSins3;

float ch62maxAmplitude4; //max height for the wave
float ch62radius4;
int ch62numOfSins4;

float ch62maxAmplitude5; //max height for the wave
float ch62radius5;
int ch62numOfSins5;

float ch62maxDisplacement; //maxDisplacement for dimensions of ellipse in the center of the figure

void ch62Setup () {
  ch62maxAmplitude1 = height*0.03;
  ch62radius1 = height*0.46;
  ch62numOfSins1 = 18;
  
  ch62maxAmplitude2 = height*0.025;
  ch62radius2 = height*0.4;
  ch62numOfSins2 = 18;
  
  ch62maxAmplitude3 = height*0.02;
  ch62radius3 = height*0.34;
  ch62numOfSins3 = 8;
  
  ch62maxAmplitude4 = height*0.015;
  ch62radius4 = height*0.28;
  ch62numOfSins4 = 7;
  
  ch62maxAmplitude5 = height*0.015;
  ch62radius5 = height*0.22;
  ch62numOfSins5 = 7;
  
  ch62maxDisplacement = width*0.05;
}

void ch62Draw () {
  pg.beginDraw();
  ch62CalcWave();
  ch62RenderWave();
  pg.endDraw();
}

void ch62DrawOutlines () {
  pg.beginDraw();
  ch62CalcWave();
  ch62RenderOutlines();
  pg.endDraw();
}

void ch62CalcWave() {
  float f1 = map(ampNoise1, min1, max1, 0, ch62maxAmplitude1);
    
  for (int i = 0; i < 360; i++) {
    ch62xvalues1[i] = (ch62radius1+(f1*(-cos(ch62numOfSins1*radians(i)))))*cos(radians(i));
    ch62yvalues1[i] = (ch62radius1+(f1*(-cos(ch62numOfSins1*radians(i)))))*sin(radians(i));
  }
  
  float f2 = map(ampNoise2, min2, max2, 0, ch62maxAmplitude2);
    
  for (int i = 0; i < 360; i++) {
    ch62xvalues2[i] = (ch62radius2+(f2*(cos(ch62numOfSins2*radians(i)))))*cos(radians(i));
    ch62yvalues2[i] = (ch62radius2+(f2*(cos(ch62numOfSins2*radians(i)))))*sin(radians(i));
  }
  
  float f3 = map(ampNoise3, min3, max3, 0, ch62maxAmplitude3);
    
  for (int i = 0; i < 360; i++) {
    ch62xvalues3[i] = (ch62radius3+(f3*(-cos(ch62numOfSins3*radians(i)))))*cos(radians(i));
    ch62yvalues3[i] = (ch62radius3+(f3*(-cos(ch62numOfSins3*radians(i)))))*sin(radians(i));
  }
  
  float f4 = map(ampNoise4, min4, max4, 0, ch62maxAmplitude4);
    
  for (int i = 0; i < 360; i++) {
    ch62xvalues4[i] = (ch62radius4+(f4*(sin(ch62numOfSins4*radians(i)))))*cos(radians(i));
    ch62yvalues4[i] = (ch62radius4+(f4*(sin(ch62numOfSins4*radians(i)))))*sin(radians(i));
  }
  
  float f5 = map(ampNoise5, min5, max5, 0, ch62maxAmplitude5);
    
  for (int i = 0; i < 360; i++) {
    ch62xvalues5[i] = (ch62radius5+(f5*(-sin(ch62numOfSins5*radians(i)))))*cos(radians(i));
    ch62yvalues5[i] = (ch62radius5+(f5*(-sin(ch62numOfSins5*radians(i)))))*sin(radians(i));
  }
}

void ch62RenderWave() {
  pg.fill(col, 100, 100);
  pg.noStroke();
  
  pg.rect(0,0,width,height);
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch62yvalues1.length; x++) {
    pg.curveVertex(ch62xvalues1[x]+(width/2),ch62yvalues1[x]+(height/2));
  }
  pg.curveVertex(ch62xvalues1[0]+(width/2), ch62yvalues1[0]+(height/2));
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch62yvalues2.length; x++) {
    pg.curveVertex(ch62xvalues2[x]+(width/2),ch62yvalues2[x]+(height/2));
  }
  pg.curveVertex(ch62xvalues2[0]+(width/2), ch62yvalues2[0]+(height/2));
  pg.endShape();
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch62yvalues3.length; x++) {
    pg.curveVertex(ch62xvalues3[x]+(width/2),ch62yvalues3[x]+(height/2));
  }
  pg.curveVertex(ch62xvalues3[0]+(width/2), ch62yvalues3[0]+(height/2));
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch62yvalues4.length; x++) {
    pg.curveVertex(ch62xvalues4[x]+(width/2),ch62yvalues4[x]+(height/2));
  }
  pg.curveVertex(ch62xvalues4[0]+(width/2), ch62yvalues4[0]+(height/2));
  pg.endShape();
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch62yvalues5.length; x++) {
    pg.curveVertex(ch62xvalues5[x]+(width/2),ch62yvalues5[x]+(height/2));
  }
  pg.curveVertex(ch62xvalues5[0]+(width/2), ch62yvalues5[0]+(height/2));
  pg.endShape();
  
  float xoff = map(xNoise, min6, max6, -ch62maxDisplacement, ch62maxDisplacement);
  float yoff = map(yNoise, min7, max7, -ch62maxDisplacement, ch62maxDisplacement);
  
  pg.fill(col, 100, 100);
  pg.ellipse(width/2,height/2,(width*0.28)+xoff,(height*0.28)+yoff);
  
  //circle.disableStyle();
  //pg.fill(oppCol, 70, 75);
  //pg.shape(circle,0,0,width,height);
}

void ch62RenderOutlines() {
  pg.stroke(col, 100, 100);
  pg.strokeWeight(width/100);
  pg.noFill();
  //pg.rect(0,0,width,height); 
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch62yvalues1.length; x++) {
    pg.curveVertex(ch62xvalues1[x]+(width/2),ch62yvalues1[x]+(height/2));
  }
  pg.curveVertex(ch62xvalues1[0]+(width/2), ch62yvalues1[0]+(height/2));
  pg.endShape();
  
  pg.stroke(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch62yvalues2.length; x++) {
    pg.curveVertex(ch62xvalues2[x]+(width/2),ch62yvalues2[x]+(height/2));
  }
  pg.curveVertex(ch62xvalues2[0]+(width/2), ch62yvalues2[0]+(height/2));
  pg.endShape();
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch62yvalues3.length; x++) {
    pg.curveVertex(ch62xvalues3[x]+(width/2),ch62yvalues3[x]+(height/2));
  }
  pg.curveVertex(ch62xvalues3[0]+(width/2), ch62yvalues3[0]+(height/2));
  pg.endShape();
  
  pg.stroke(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch62yvalues4.length; x++) {
    pg.curveVertex(ch62xvalues4[x]+(width/2),ch62yvalues4[x]+(height/2));
  }
  pg.curveVertex(ch62xvalues4[0]+(width/2), ch62yvalues4[0]+(height/2));
  pg.endShape();
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch62yvalues5.length; x++) {
    pg.curveVertex(ch62xvalues5[x]+(width/2),ch62yvalues5[x]+(height/2));
  }
  pg.curveVertex(ch62xvalues5[0]+(width/2), ch62yvalues5[0]+(height/2));
  pg.endShape();
  
  float xoff = map(xNoise, min6, max6, -ch62maxDisplacement, ch62maxDisplacement);
  float yoff = map(yNoise, min7, max7, -ch62maxDisplacement, ch62maxDisplacement);
  
  pg.stroke(col, 100, 100);
  pg.ellipse(width/2,height/2,(width*0.28)+xoff,(height*0.28)+yoff);
}
