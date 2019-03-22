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

float[] ch62xvalues6 = new float[360]; //An array to store the horizontal values for the wave
float[] ch62yvalues6 = new float[360]; //An array to store the height values for the wave

float[] ch62xvalues7 = new float[360]; //An array to store the horizontal values for the wave
float[] ch62yvalues7 = new float[360]; //An array to store the height values for the wave

float[] ch62xvalues8 = new float[360]; //An array to store the horizontal values for the wave
float[] ch62yvalues8 = new float[360]; //An array to store the height values for the wave

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

float ch62maxAmplitude6; //max height for the wave
float ch62radius6;
int ch62numOfSins6;

float ch62maxAmplitude7; //max height for the wave
float ch62radius7;
int ch62numOfSins7;

float ch62maxAmplitude8; //max height for the wave
float ch62radius8;
int ch62numOfSins8;

float ch62maxDisplacement; //maxDisplacement for dimensions of ellipse in the center of the figure

void ch62Setup () {
  ch62maxAmplitude1 = height*0.04;
  ch62radius1 = height*0.46;
  ch62numOfSins1 = 18;
  
  ch62maxAmplitude2 = height*0.04;
  ch62radius2 = height*0.4;
  ch62numOfSins2 = 18;
  
  ch62maxAmplitude3 = height*0.04;
  ch62radius3 = height*0.34;
  ch62numOfSins3 = 8;
  
  ch62maxAmplitude4 = height*0.04;
  ch62radius4 = height*0.28;
  ch62numOfSins4 = 7;
  
  ch62maxAmplitude5 = height*0.04;
  ch62radius5 = height*0.22;
  ch62numOfSins5 = 7;
  
  ch62maxAmplitude6 = height*0.04;
  ch62radius6 = height*0.52;
  ch62numOfSins6 = 24;
  
  ch62maxAmplitude7 = height*0.04;
  ch62radius7 = height*0.58;
  ch62numOfSins7 = 26;
  
  ch62maxAmplitude8 = height*0.04;
  ch62radius8 = height*0.64;
  ch62numOfSins8 = 28;
  
  ch62maxDisplacement = width*0.08;
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

void ch62DrawPurple () {
  pg.beginDraw();
  ch62CalcWave();
  ch62RenderPurple();
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
  
  float f6 = map(ampNoise1, min1, max1, 0, ch62maxAmplitude6);
    
  for (int i = 0; i < 360; i++) {
    ch62xvalues6[i] = (ch62radius6+(f6*(-sin(ch62numOfSins6*radians(i)))))*cos(radians(i));
    ch62yvalues6[i] = (ch62radius6+(f6*(-sin(ch62numOfSins6*radians(i)))))*sin(radians(i));
  }
  
  float f7 = map(ampNoise2, min2, max2, 0, ch62maxAmplitude7);
    
  for (int i = 0; i < 360; i++) {
    ch62xvalues7[i] = (ch62radius7+(f7*(-sin(ch62numOfSins7*radians(i)))))*cos(radians(i));
    ch62yvalues7[i] = (ch62radius7+(f7*(-sin(ch62numOfSins7*radians(i)))))*sin(radians(i));
  }
  
  float f8 = map(ampNoise3, min3, max3, 0, ch62maxAmplitude8);
    
  for (int i = 0; i < 360; i++) {
    ch62xvalues8[i] = (ch62radius8+(f8*(-sin(ch62numOfSins8*radians(i)))))*cos(radians(i));
    ch62yvalues8[i] = (ch62radius8+(f8*(-sin(ch62numOfSins8*radians(i)))))*sin(radians(i));
  }
}

void ch62RenderWave() {
  pg.fill(oppCol, 100, 100);
  pg.noStroke();
  
  pg.rect(0,0,width,height);
  
  pg.pushMatrix();
  pg.translate(width/2,height/2);
  pg.rotate(radians(rot*0.5));
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch62yvalues8.length; x++) {
    pg.curveVertex(ch62xvalues8[x],ch62yvalues8[x]);
  }
  pg.curveVertex(ch62xvalues8[0], ch62yvalues8[0]);
  pg.endShape();
  
  pg.popMatrix();
  
  pg.pushMatrix();
  pg.translate(width/2,height/2);
  pg.rotate(radians(rot*0.8));
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch62yvalues7.length; x++) {
    pg.curveVertex(ch62xvalues7[x],ch62yvalues7[x]);
  }
  pg.curveVertex(ch62xvalues7[0], ch62yvalues7[0]);
  pg.endShape();
  
  pg.popMatrix();
  
  pg.pushMatrix();
  pg.translate(width/2,height/2);
  pg.rotate(radians(rot*1.1));
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch62yvalues6.length; x++) {
    pg.curveVertex(ch62xvalues6[x],ch62yvalues6[x]);
  }
  pg.curveVertex(ch62xvalues6[0], ch62yvalues6[0]);
  pg.endShape();
  
  pg.popMatrix();
  
  pg.pushMatrix();
  pg.translate(width/2,height/2);
  pg.rotate(radians(rot*1.4));
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch62yvalues1.length; x++) {
    pg.curveVertex(ch62xvalues1[x],ch62yvalues1[x]);
  }
  pg.curveVertex(ch62xvalues1[0], ch62yvalues1[0]);
  pg.endShape();

  pg.popMatrix();
  
  pg.pushMatrix();
  pg.translate(width/2,height/2);
  pg.rotate(radians(rot*1.7));
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch62yvalues2.length; x++) {
    pg.curveVertex(ch62xvalues2[x],ch62yvalues2[x]);
  }
  pg.curveVertex(ch62xvalues2[0], ch62yvalues2[0]);
  pg.endShape();
  
  pg.popMatrix();
  
  pg.pushMatrix();
  pg.translate(width/2,height/2);
  pg.rotate(radians(rot*2));
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch62yvalues3.length; x++) {
    pg.curveVertex(ch62xvalues3[x],ch62yvalues3[x]);
  }
  pg.curveVertex(ch62xvalues3[0], ch62yvalues3[0]);
  pg.endShape();
  
  pg.popMatrix();
  
  pg.pushMatrix();
  pg.translate(width/2,height/2);
  pg.rotate(radians(rot*2.3));
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch62yvalues4.length; x++) {
    pg.curveVertex(ch62xvalues4[x],ch62yvalues4[x]);
  }
  pg.curveVertex(ch62xvalues4[0], ch62yvalues4[0]);
  pg.endShape();
  
  pg.popMatrix();
  
  pg.pushMatrix();
  pg.translate(width/2,height/2);
  pg.rotate(radians(rot*2.6));
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch62yvalues5.length; x++) {
    pg.curveVertex(ch62xvalues5[x],ch62yvalues5[x]);
  }
  pg.curveVertex(ch62xvalues5[0], ch62yvalues5[0]);
  pg.endShape();
  
  pg.popMatrix();
  
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

void ch62RenderPurple() {
  pg.noStroke();
  
  pg.pushMatrix();
  pg.translate(width/2,height/2);
  pg.rotate(radians(rot*0.5));
  
  pg.fill(purple);
  pg.beginShape();
  for (int x = 0; x < ch62yvalues8.length; x++) {
    pg.curveVertex(ch62xvalues8[x],ch62yvalues8[x]);
  }
  pg.curveVertex(ch62xvalues8[0], ch62yvalues8[0]);
  pg.endShape();
  
  pg.popMatrix();
  
  pg.pushMatrix();
  pg.translate(width/2,height/2);
  pg.rotate(radians(rot*0.8));
  
  pg.fill(purple);
  pg.beginShape();
  for (int x = 0; x < ch62yvalues7.length; x++) {
    pg.curveVertex(ch62xvalues7[x],ch62yvalues7[x]);
  }
  pg.curveVertex(ch62xvalues7[0], ch62yvalues7[0]);
  pg.endShape();
  
  pg.popMatrix();
  
  pg.pushMatrix();
  pg.translate(width/2,height/2);
  pg.rotate(radians(rot*1.1));
  
  pg.fill(purple);
  pg.beginShape();
  for (int x = 0; x < ch62yvalues6.length; x++) {
    pg.curveVertex(ch62xvalues6[x],ch62yvalues6[x]);
  }
  pg.curveVertex(ch62xvalues6[0], ch62yvalues6[0]);
  pg.endShape();
  
  pg.popMatrix();
  
  pg.pushMatrix();
  pg.translate(width/2,height/2);
  pg.rotate(radians(rot*1.4));
  
  pg.fill(purple);
  pg.beginShape();
  for (int x = 0; x < ch62yvalues1.length; x++) {
    pg.curveVertex(ch62xvalues1[x],ch62yvalues1[x]);
  }
  pg.curveVertex(ch62xvalues1[0], ch62yvalues1[0]);
  pg.endShape();

  pg.popMatrix();
  
  pg.pushMatrix();
  pg.translate(width/2,height/2);
  pg.rotate(radians(rot*1.7));
  
  pg.fill(280, 100, 45, 20);
  pg.beginShape();
  for (int x = 0; x < ch62yvalues2.length; x++) {
    pg.curveVertex(ch62xvalues2[x],ch62yvalues2[x]);
  }
  pg.curveVertex(ch62xvalues2[0], ch62yvalues2[0]);
  pg.endShape();
  
  pg.popMatrix();
  
  pg.pushMatrix();
  pg.translate(width/2,height/2);
  pg.rotate(radians(rot*2));
  
  pg.fill(purple);
  pg.beginShape();
  for (int x = 0; x < ch62yvalues3.length; x++) {
    pg.curveVertex(ch62xvalues3[x],ch62yvalues3[x]);
  }
  pg.curveVertex(ch62xvalues3[0], ch62yvalues3[0]);
  pg.endShape();
  
  pg.popMatrix();
  
  pg.pushMatrix();
  pg.translate(width/2,height/2);
  pg.rotate(radians(rot*2.3));
  
  pg.fill(280, 100, 45, 20);
  pg.beginShape();
  for (int x = 0; x < ch62yvalues4.length; x++) {
    pg.curveVertex(ch62xvalues4[x],ch62yvalues4[x]);
  }
  pg.curveVertex(ch62xvalues4[0], ch62yvalues4[0]);
  pg.endShape();
  
  pg.popMatrix();
  
  pg.pushMatrix();
  pg.translate(width/2,height/2);
  pg.rotate(radians(rot*2.6));
  
  pg.fill(purple);
  pg.beginShape();
  for (int x = 0; x < ch62yvalues5.length; x++) {
    pg.curveVertex(ch62xvalues5[x],ch62yvalues5[x]);
  }
  pg.curveVertex(ch62xvalues5[0], ch62yvalues5[0]);
  pg.endShape();
  
  pg.popMatrix();
  
  float xoff = map(xNoise, min6, max6, -ch62maxDisplacement, ch62maxDisplacement);
  float yoff = map(yNoise, min7, max7, -ch62maxDisplacement, ch62maxDisplacement);
  
  pg.fill(purple);
  pg.ellipse(width/2,height/2,(width*0.28)+xoff,(height*0.28)+yoff);
  
  //circle.disableStyle();
  //pg.fill(oppCol, 70, 75);
  //pg.shape(circle,0,0,width,height);
}
