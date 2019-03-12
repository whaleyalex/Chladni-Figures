//ChladniFigure73

int ch73xspacing = 1; //How far apart each vertical position should be

float ch73period1; //How many pixels before the wave repeats
float ch73dx1; //Value for incrementing Y, as a function of period and yspacing
float[] ch73yvalues1; //Using an array to store horizontal values for the wave
float ch73maxAmplitude1; //max height for the wave

float ch73period2; //How many pixels before the wave repeats
float ch73dx2; //Value for incrementing Y, as a function of period and yspacing
float[] ch73yvalues2; //Using an array to store horizontal values for the wave
float ch73maxAmplitude2; //max height for the wave

float ch73period3; //How many pixels before the wave repeats
float ch73dx3; //Value for incrementing Y, as a function of period and yspacing
float[] ch73yvalues3; //Using an array to store horizontal values for the wave
float ch73maxAmplitude3; //max height for the wave

float ch73period4; //How many pixels before the wave repeats
float ch73dx4; //Value for incrementing Y, as a function of period and yspacing
float[] ch73yvalues4; //Using an array to store horizontal values for the wave
float ch73maxAmplitude4; //max height for the wave

void ch73Setup () {
  ch73period1 = width*0.6667;
  ch73dx1 = (TWO_PI / ch73period1) * ch73xspacing;
  ch73yvalues1 = new float[width/ch73xspacing];
  ch73maxAmplitude1 = height/4;
  
  ch73period2 = width*0.667;
  ch73dx2 = (TWO_PI / ch73period2) * ch73xspacing;
  ch73yvalues2 = new float[width/ch73xspacing];
  ch73maxAmplitude2 = height/10;
  
  ch73period3 = width*2;
  ch73dx3 = (TWO_PI / ch73period3) * ch73xspacing;
  ch73yvalues3 = new float[width/ch73xspacing];
  ch73maxAmplitude3 = height/3;
  
  ch73period4 = width*2;
  ch73dx4 = (TWO_PI / ch73period4) * ch73xspacing;
  ch73yvalues4 = new float[width/ch73xspacing];
  ch73maxAmplitude4 = height/4;
}

void ch73Draw () {
  pg.beginDraw();
  ch73CalcWave();
  ch73RenderWave();
  pg.endDraw();
}

void ch73DrawOutlines () {
  pg.beginDraw();
  ch73CalcWave();
  ch73RenderOutlines();
  pg.endDraw();
}

void ch73CalcWave() {
  float f1 = map(ampNoise1, min1, max1, 0, ch73maxAmplitude1);
  
  float x1 = staticTheta;
  for (int i = 0; i < ch73yvalues1.length; i++) {
    ch73yvalues1[i] = sin(x1)*f1;
    x1+=ch73dx1;
  }

  float f2 = map(ampNoise1, min1, max1, 0, ch73maxAmplitude2);
  
  float x2 = staticTheta;
  for (int i = 0; i < ch73yvalues2.length; i++) {
    ch73yvalues2[i] = sin(x2)*f2;
    x2+=ch73dx2;
  }

  float f3 = map(ampNoise1, min1, max1, 0, ch73maxAmplitude3);
  
  float x3 = staticTheta;
  for (int i = 0; i < ch73yvalues3.length; i++) {
    ch73yvalues3[i] = sin(x3)*f3;
    x3+=ch73dx3;
  }

  float f4 = map(ampNoise1, min1, max1, 0, ch73maxAmplitude4);
  
  float x4 = staticTheta;
  for (int i = 0; i < ch73yvalues4.length; i++) {
    ch73yvalues4[i] = sin(x4)*f4;
    x4+=ch73dx4;
  }
}

void ch73RenderWave() {
  pg.fill(col, 70, 75);
  pg.noStroke();
  
  pg.rect(0,0,width,height);
  
  //pg.fill(oppCol, 70, 75);
  //pg.ellipse(width/2,height/2,width,height);
  
  pg.fill(oppCol, 70, 75);
  pg.beginShape();
  for (int x = 0; x < ch73yvalues1.length; x++) {
    pg.vertex(x*ch73xspacing,(height*0.18)+ch73yvalues1[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0,height);
  pg.endShape();
  
  pg.fill(col, 70, 75);
  pg.beginShape();
  for (int x = 0; x < ch73yvalues2.length; x++) {
    pg.vertex(x*ch73xspacing,(height*0.45)-ch73yvalues2[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0,height);
  pg.endShape();
  
  pg.fill(oppCol, 70, 75);
  pg.beginShape();
  for (int x = 0; x < ch73yvalues3.length; x++) {
    pg.vertex(x*ch73xspacing,(height*0.75)-ch73yvalues3[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0,height);
  pg.endShape();
  
  pg.fill(col, 70, 75);
  pg.beginShape();
  for (int x = 0; x < ch73yvalues4.length; x++) {
    pg.vertex(x*ch73xspacing,(height)-ch73yvalues4[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0,height);
  pg.endShape();
  
  circle.disableStyle();
  pg.fill(col, 70, 50);
  pg.shape(circle,0,0,width,height);
}

void ch73RenderOutlines() {
  pg.stroke(col, 100, 100);
  pg.strokeWeight(width/100);
  pg.noFill();
  pg.ellipse(width/2,height/2,width,height);
  
  pg.stroke(oppCol, 70, 75);
  pg.beginShape();
  for (int x = 0; x < ch73yvalues1.length; x++) {
    pg.vertex(x*ch73xspacing,(height*0.18)+ch73yvalues1[x]);
  }
  //pg.vertex(width,height);
  //pg.vertex(0,height);
  pg.endShape();
  
  pg.stroke(col, 70, 75);
  pg.beginShape();
  for (int x = 0; x < ch73yvalues2.length; x++) {
    pg.vertex(x*ch73xspacing,(height*0.45)-ch73yvalues2[x]);
  }
  //pg.vertex(width,height);
  //pg.vertex(0,height);
  pg.endShape();
  
  pg.stroke(oppCol, 70, 75);
  pg.beginShape();
  for (int x = 0; x < ch73yvalues3.length; x++) {
    pg.vertex(x*ch73xspacing,(height*0.75)-ch73yvalues3[x]);
  }
  //pg.vertex(width,height);
  //pg.vertex(0,height);
  pg.endShape();
  
  pg.stroke(col, 70, 75);
  pg.beginShape();
  for (int x = 0; x < ch73yvalues4.length; x++) {
    pg.vertex(x*ch73xspacing,(height)-ch73yvalues4[x]);
  }
  //pg.vertex(width,height);
  //pg.vertex(0,height);
  pg.endShape();
}
