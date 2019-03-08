//ChladniFigure141

int ch141xspacing = 1; //How far apart each vertical position should be

float ch141period; //How many pixels before the wave repeats
float ch141dx; //Value for incrementing Y, as a function of period and yspacing
float[] ch141yvalues; //Using an array to store horizontal values for the wave

float ch141maxAmplitude; //max height for the wave

float ch141x1,ch141x2;
float ch141maxDisplacement; //max number of pixels for shifting lines positive and negative, and width of the ellipses

void ch141Setup () {
  ch141period = width*0.667;
  ch141dx = (TWO_PI / ch141period) * ch141xspacing;
  ch141yvalues = new float[width/ch141xspacing];
  
  ch141maxAmplitude = height*0.05;
  
  ch141maxDisplacement = width * 0.1;
  
  ch141x1 = width*0.25;
  ch141x2 = width*0.75;
}

void ch141Draw () {
  pg.beginDraw();
  ch141CalcWave();
  ch141RenderWave();
  pg.endDraw();
}

void ch141CalcWave() {  
  float f = map(ampNoise1, min1, max1, 0, ch141maxAmplitude);
  
  float x = negativeTheta;
  for (int i = 0; i < ch141yvalues.length; i++) {
    ch141yvalues[i] = sin(x)*f;
    x+=ch141dx;
  }
  
  negativeTheta -= 0.02;
}

void ch141RenderWave() {
  float xOffset = map(xNoise, min6, max6, -ch141maxDisplacement, ch141maxDisplacement);
  float yOffset = map(yNoise, min7, max7, -ch141maxDisplacement, ch141maxDisplacement);
  float wOffset = map(wNoise, min8, max8, -ch141maxDisplacement, ch141maxDisplacement);
  
  //pg.background(col, 70, 75);
  pg.noStroke();
  
  pg.fill(col, 70, 75);
  pg.rect(0,0,ch141x1+xOffset,(height/2)+yOffset);
  
  pg.fill(oppCol, 70, 75);
  pg.ellipse(0+xOffset, (height/4)+yOffset, (height/4)+wOffset, height/4);
  
  pg.fill(oppCol, 70, 75);
  pg.rect(ch141x1+xOffset,0,ch141x2-ch141x1,(height/2)+yOffset);
  
  pg.fill(col, 70, 75);
  pg.ellipse((width/2)+xOffset, (height/4)+yOffset, (height/4)+wOffset, height/4);
  
  pg.fill(col, 70, 75);
  pg.rect(ch141x2+xOffset,0,width-(ch141x2+xOffset),(height/2)+yOffset);
  
  pg.fill(oppCol, 70, 75);
  pg.ellipse(width+xOffset, (height/4)+yOffset, (height/4)+wOffset, height/4);
  
   
  pg.fill(oppCol, 70, 75);
  pg.rect(0,height/2+yOffset,ch141x1+xOffset,(height/2)+yOffset);
  
  pg.fill(col, 70, 75);
  pg.ellipse(0+xOffset, (height*0.75)+yOffset, (height/4)+wOffset, height/4);
  
  pg.fill(col, 70, 75);
  pg.rect(ch141x1+xOffset,height/2+yOffset,ch141x2-ch141x1,(height/2)+yOffset);
  
  pg.fill(oppCol, 70, 75);
  pg.ellipse((width/2)+xOffset, (height*0.75)+yOffset, (height/4)+wOffset, height/4);
  
  pg.fill(oppCol, 70, 75);
  pg.rect(ch141x2+xOffset,height/2+yOffset,width-(ch141x2+xOffset),(height/2)+yOffset);
  
  pg.fill(col, 70, 75);
  pg.ellipse(width+xOffset, (height*0.75)+yOffset, (height/4)+wOffset, height/4);
  
  
  pg.fill(col, 70, 50);
  pg.beginShape();
  for (int x = 0; x < ch141yvalues.length; x++) {
    pg.vertex(x*ch141xspacing,(height*0.1)+ch141yvalues[x]);
  }
  pg.vertex(width,0);
  pg.vertex(0,0);
  pg.endShape();
  
  pg.fill(oppCol, 70, 50);
  pg.beginShape();
  for (int x = 0; x < ch141yvalues.length; x++) {
    pg.vertex(x*ch141xspacing,(height*0.9)-ch141yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0,height);
  pg.endShape();
  
  
  /*
  pg.fill(oppCol, 70, 75);
  pg.ellipse(width/2,height/2,width,height);
  
  pg.fill(col, 70, 75);
  pg.beginShape();
  for (int x = 0; x < ch141yvalues.length; x++) {
    pg.vertex(x*ch141xspacing,(height)-ch141yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0,height);
  pg.endShape();
  */
}
