//ChladniFigure113

float[] ch113xvalues1 = new float[360]; //An array to store the horizontal values for the wave
float[] ch113yvalues1 = new float[360]; //An array to store the height values for the wave

float[] ch113xvalues2 = new float[360]; //An array to store the horizontal values for the wave
float[] ch113yvalues2 = new float[360]; //An array to store the height values for the wave

float[] ch113xvalues3 = new float[360]; //An array to store the horizontal values for the wave
float[] ch113yvalues3 = new float[360]; //An array to store the height values for the wave

float ch113maxAmplitude1; //max height for the wave
float ch113radius1;
int ch113numOfSins1;

float ch113maxAmplitude2; //max height for the wave
float ch113radius2;
int ch113numOfSins2;

float ch113maxAmplitude3; //max height for the wave
float ch113radius3;
int ch113numOfSins3;

void ch113Setup () {
  ch113maxAmplitude1 = heightVar*0.3;
  ch113radius1 = heightVar*0.6;
  ch113numOfSins1 = 4;
  
  ch113maxAmplitude2 = heightVar*0.2;
  ch113radius2 = heightVar*0.42;
  ch113numOfSins2 = 4;
  
  ch113maxAmplitude3 = heightVar*0.04;
  ch113radius3 = heightVar*0.16;
  ch113numOfSins3 = 4;
}

void ch113Draw () {
  pg.beginDraw();
  ch113CalcWave();
  ch113RenderWave();
  pg.endDraw();
}

void ch113DrawOutlines () {
  pg.beginDraw();
  ch113CalcWave();
  ch113RenderOutlines();
  pg.endDraw();
}

void ch113DrawRed () {
  pg.beginDraw();
  ch113CalcWave();
  ch113RenderRed();
  pg.endDraw();
}

void ch113CalcWave() {
  float f1 = map(ampNoise1, min1, max1, 0, ch113maxAmplitude1);
    
  for (int i = 0; i < 360; i++) {
    ch113xvalues1[i] = (ch113radius1+(f1*(cos(ch113numOfSins1*radians(i)))))*cos(radians(i));
    ch113yvalues1[i] = (ch113radius1+(f1*(cos(ch113numOfSins1*radians(i)))))*sin(radians(i));
  }
  
  float f2 = map(ampNoise2, min2, max2, 0, ch113maxAmplitude2);
    
  for (int i = 0; i < 360; i++) {
    ch113xvalues2[i] = (ch113radius2+(f2*(cos(ch113numOfSins2*radians(i)))))*cos(radians(i));
    ch113yvalues2[i] = (ch113radius2+(f2*(cos(ch113numOfSins2*radians(i)))))*sin(radians(i));
  }
  
  float f3 = map(ampNoise3, min3, max3, 0, ch113maxAmplitude3);
    
  for (int i = 0; i < 360; i++) {
    ch113xvalues3[i] = (ch113radius3+(f3*(-cos(ch113numOfSins3*radians(i)))))*cos(radians(i));
    ch113yvalues3[i] = (ch113radius3+(f3*(-cos(ch113numOfSins3*radians(i)))))*sin(radians(i));
  }
}

void ch113RenderWave() {
  pg.fill(col, 100, 100);
  pg.noStroke();
  
  pg.rect(0,0,widthVar,heightVar);
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch113yvalues1.length; x++) {
    pg.curveVertex(ch113xvalues1[x]+(widthVar/2),ch113yvalues1[x]+(heightVar/2));
  }
  pg.curveVertex(ch113xvalues1[0]+(widthVar/2), ch113yvalues1[0]+(heightVar/2));
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch113yvalues2.length; x++) {
    pg.curveVertex(ch113xvalues2[x]+(widthVar/2),ch113yvalues2[x]+(heightVar/2));
  }
  pg.curveVertex(ch113xvalues2[0]+(widthVar/2), ch113yvalues2[0]+(heightVar/2));
  pg.endShape();
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch113yvalues3.length; x++) {
    pg.curveVertex(ch113xvalues3[x]+(widthVar/2),ch113yvalues3[x]+(heightVar/2));
  }
  pg.curveVertex(ch113xvalues3[0]+(widthVar/2), ch113yvalues3[0]+(heightVar/2));
  pg.endShape();  
}

void ch113RenderOutlines() {
  pg.stroke(col, 100, 100);
  pg.strokeWeight(widthVar/100);
  pg.noFill();
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch113yvalues1.length; x++) {
    pg.curveVertex(ch113xvalues1[x]+(widthVar/2),ch113yvalues1[x]+(heightVar/2));
  }
  pg.curveVertex(ch113xvalues1[0]+(widthVar/2), ch113yvalues1[0]+(heightVar/2));
  pg.endShape();
  
  pg.stroke(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch113yvalues2.length; x++) {
    pg.curveVertex(ch113xvalues2[x]+(widthVar/2),ch113yvalues2[x]+(heightVar/2));
  }
  pg.curveVertex(ch113xvalues2[0]+(widthVar/2), ch113yvalues2[0]+(heightVar/2));
  pg.endShape();
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch113yvalues3.length; x++) {
    pg.curveVertex(ch113xvalues3[x]+(widthVar/2),ch113yvalues3[x]+(heightVar/2));
  }
  pg.curveVertex(ch113xvalues3[0]+(widthVar/2), ch113yvalues3[0]+(heightVar/2));
  pg.endShape();  
}

void ch113RenderRed() {
  pg.fill(360, 85, 70, 40);
  pg.noStroke();
  
  pg.rect(0,0,widthVar,heightVar);
  
  pg.fill(360, 85, 70, 40);
  pg.beginShape();
  for (int x = 0; x < ch113yvalues1.length; x++) {
    pg.curveVertex(ch113xvalues1[x]+(widthVar/2),ch113yvalues1[x]+(heightVar/2));
  }
  pg.curveVertex(ch113xvalues1[0]+(widthVar/2), ch113yvalues1[0]+(heightVar/2));
  pg.endShape();
  
  pg.fill(360, 85, 70, 40);
  pg.beginShape();
  for (int x = 0; x < ch113yvalues2.length; x++) {
    pg.curveVertex(ch113xvalues2[x]+(widthVar/2),ch113yvalues2[x]+(heightVar/2));
  }
  pg.curveVertex(ch113xvalues2[0]+(widthVar/2), ch113yvalues2[0]+(heightVar/2));
  pg.endShape();
  
  pg.fill(360, 85, 70, 40);
  pg.beginShape();
  for (int x = 0; x < ch113yvalues3.length; x++) {
    pg.curveVertex(ch113xvalues3[x]+(widthVar/2),ch113yvalues3[x]+(heightVar/2));
  }
  pg.curveVertex(ch113xvalues3[0]+(widthVar/2), ch113yvalues3[0]+(heightVar/2));
  pg.endShape();  
}
