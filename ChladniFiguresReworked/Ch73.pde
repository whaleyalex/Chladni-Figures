//ChladniFigure73

int ch73xspacing = 1; //How far apart each vertical position should be

float ch73theta = 0.0; //Start angle at zero
float ch73theta1 = 0.0; //Start angle at zero
float ch73theta2 = 0.0; //Start angle at zero
float ch73theta3 = 0.0; //Start angle at zero
float ch73theta4 = 0.0; //Start angle at zero

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

float ch73yoff = 0.0; //noise for the amplitude of the wave
float ch73colNoise = 0.1;

PShape ch73s;

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
  
  
  ch73s = loadShape("CircleHole.svg");
}

void ch73Draw () {
  pg.beginDraw();
  ch73CalcWave();
  ch73RenderWave();
  pg.endDraw();
}

void ch73CalcWave() {
  //ch73theta1 += 0.02; //angular velocity
  ch73theta1 = 0.0; //no movement
  
  float f1 = map(noise(ch73yoff), 0, 1, 0, ch73maxAmplitude1);
  
  float x1 = ch73theta1;
  for (int i = 0; i < ch73yvalues1.length; i++) {
    ch73yvalues1[i] = sin(x1)*f1;
    x1+=ch73dx1;
  }
  
  //ch73theta2 += 0.02; //angular velocity
  ch73theta2 = 0.0; //no movement
  
  float f2 = map(noise(ch73yoff), 0, 1, 0, ch73maxAmplitude2);
  
  float x2 = ch73theta2;
  for (int i = 0; i < ch73yvalues2.length; i++) {
    ch73yvalues2[i] = sin(x2)*f2;
    x2+=ch73dx2;
  }
  
  //ch73theta1 += 0.02; //angular velocity
  ch73theta3 = 0.0; //no movement
  
  float f3 = map(noise(ch73yoff), 0, 1, 0, ch73maxAmplitude3);
  
  float x3 = ch73theta3;
  for (int i = 0; i < ch73yvalues3.length; i++) {
    ch73yvalues3[i] = sin(x3)*f3;
    x3+=ch73dx3;
  }
  
  //ch73theta1 += 0.02; //angular velocity
  ch73theta4 = 0.0; //no movement
  
  float f4 = map(noise(ch73yoff), 0, 1, 0, ch73maxAmplitude4);
  
  float x4 = ch73theta4;
  for (int i = 0; i < ch73yvalues4.length; i++) {
    ch73yvalues4[i] = sin(x4)*f4;
    x4+=ch73dx4;
  }
  
  ch73yoff += 0.01; //Try different values for speed at which the amplitude changes
}

void ch73RenderWave() {  
  pg.colorMode(HSB,360,100,100);
  float col = map(noise(ch73colNoise), 0, 1, 240, 360);
  float oppCol = (360-col) + 240;
  
  pg.background(col, 70, 75);
  pg.noStroke();
  
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
  
  
  
  ch73s.disableStyle();
  pg.fill(col, 70, 50);
  pg.shape(ch73s,0,0,width,height);
  
  
  ch73colNoise += 0.01;
}
