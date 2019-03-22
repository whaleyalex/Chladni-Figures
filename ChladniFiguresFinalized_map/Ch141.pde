//ChladniFigure141

int ch141xspacing = 1; //How far apart each vertical position should be

float ch141period; //How many pixels before the wave repeats
float ch141dx; //Value for incrementing Y, as a function of period and yspacing
float[] ch141yvalues; //Using an array to store horizontal values for the wave

float ch141maxAmplitude; //max height for the wave

float ch141x1,ch141x2;
float ch141maxDisplacement; //max number of pixels for shifting lines positive and negative, and width of the ellipses

void ch141Setup () {
  ch141period = widthVar*0.667;
  ch141dx = (TWO_PI / ch141period) * ch141xspacing;
  ch141yvalues = new float[widthVar/ch141xspacing];
  
  ch141maxAmplitude = heightVar*0.1;
  
  ch141maxDisplacement = widthVar * 0.1;
  
  ch141x1 = widthVar*0.25;
  ch141x2 = widthVar*0.75;
}

void ch141Draw () {
  pg.beginDraw();
  ch141CalcWave();
  ch141RenderWave();
  pg.endDraw();
}

void ch141DrawOutlines () {
  pg.beginDraw();
  ch141CalcWave();
  ch141RenderOutlines();
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
  
  pg.fill(col, 100, 100);
  pg.rect(0,0,ch141x1+xOffset,(heightVar/2)+yOffset);
  
  pg.fill(oppCol, 100, 100);
  pg.ellipse(0+xOffset, (heightVar/4)+yOffset, (heightVar/4)+wOffset, heightVar/4);
  
  pg.fill(oppCol, 100, 100);
  pg.rect(ch141x1+xOffset,0,ch141x2-ch141x1,(heightVar/2)+yOffset);
  
  pg.fill(col, 100, 100);
  pg.ellipse((widthVar/2)+xOffset, (heightVar/4)+yOffset, (heightVar/4)+wOffset, heightVar/4);
  
  pg.fill(col, 100, 100);
  pg.rect(ch141x2+xOffset,0,widthVar-(ch141x2+xOffset),(heightVar/2)+yOffset);
  
  pg.fill(oppCol, 100, 100);
  pg.ellipse(widthVar+xOffset, (heightVar/4)+yOffset, (heightVar/4)+wOffset, heightVar/4);
  
   
  pg.fill(oppCol, 100, 100);
  pg.rect(0,heightVar/2+yOffset,ch141x1+xOffset,(heightVar/2)-yOffset);
  
  pg.fill(col, 100, 100);
  pg.ellipse(0+xOffset, (heightVar*0.75)+yOffset, (heightVar/4)+wOffset, heightVar/4);
  
  pg.fill(col, 100, 100);
  pg.rect(ch141x1+xOffset,heightVar/2+yOffset,ch141x2-ch141x1,(heightVar/2)-yOffset);
  
  pg.fill(oppCol, 100, 100);
  pg.ellipse((widthVar/2)+xOffset, (heightVar*0.75)+yOffset, (heightVar/4)+wOffset, heightVar/4);
  
  pg.fill(oppCol, 100, 100);
  pg.rect(ch141x2+xOffset,heightVar/2+yOffset,widthVar-(ch141x2+xOffset),(heightVar/2)-yOffset);
  
  pg.fill(col, 100, 100);
  pg.ellipse(widthVar+xOffset, (heightVar*0.75)+yOffset, (heightVar/4)+wOffset, heightVar/4);
  
  
  pg.fill(col, 70, 70);
  pg.beginShape();
  for (int x = 0; x < ch141yvalues.length; x++) {
    pg.vertex(x*ch141xspacing,(heightVar*0.1)+ch141yvalues[x]);
  }
  pg.vertex(widthVar,0);
  pg.vertex(0,0);
  pg.endShape();
  
  pg.fill(oppCol, 70, 70);
  pg.beginShape();
  for (int x = 0; x < ch141yvalues.length; x++) {
    pg.vertex(x*ch141xspacing,(heightVar*0.9)-ch141yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0,heightVar);
  pg.endShape();
  
  
  /*
  pg.fill(oppCol, 70, 75);
  pg.ellipse(widthVar/2,height/2,widthVar,heightVar);
  
  pg.fill(col, 70, 75);
  pg.beginShape();
  for (int x = 0; x < ch141yvalues.length; x++) {
    pg.vertex(x*ch141xspacing,(heightVar)-ch141yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0,heightVar);
  pg.endShape();
  */
}

void ch141RenderOutlines() {
  float xOffset = map(xNoise, min6, max6, -ch141maxDisplacement, ch141maxDisplacement);
  float yOffset = map(yNoise, min7, max7, -ch141maxDisplacement, ch141maxDisplacement);
  float wOffset = map(wNoise, min8, max8, -ch141maxDisplacement, ch141maxDisplacement);
  
  pg.stroke(col, 100, 100);
  pg.strokeWeight(widthVar/100);
  pg.noFill();
  
  pg.stroke(col, 70, 75);
  pg.rect(0,0,ch141x1+xOffset,(heightVar/2)+yOffset);
  
  pg.stroke(oppCol, 70, 75);
  pg.ellipse(0+xOffset, (heightVar/4)+yOffset, (heightVar/4)+wOffset, heightVar/4);
  
  pg.stroke(oppCol, 70, 75);
  pg.rect(ch141x1+xOffset,0,ch141x2-ch141x1,(heightVar/2)+yOffset);
  
  pg.stroke(col, 70, 75);
  pg.ellipse((widthVar/2)+xOffset, (heightVar/4)+yOffset, (heightVar/4)+wOffset, heightVar/4);
  
  pg.stroke(col, 70, 75);
  pg.rect(ch141x2+xOffset,0,widthVar-(ch141x2+xOffset),(heightVar/2)+yOffset);
  
  pg.stroke(oppCol, 70, 75);
  pg.ellipse(widthVar+xOffset, (heightVar/4)+yOffset, (heightVar/4)+wOffset, heightVar/4);
  
   
  pg.stroke(oppCol, 70, 75);
  pg.rect(0,heightVar/2+yOffset,ch141x1+xOffset,(heightVar/2)+yOffset);
  
  pg.stroke(col, 70, 75);
  pg.ellipse(0+xOffset, (heightVar*0.75)+yOffset, (heightVar/4)+wOffset, heightVar/4);
  
  pg.stroke(col, 70, 75);
  pg.rect(ch141x1+xOffset,heightVar/2+yOffset,ch141x2-ch141x1,(heightVar/2)+yOffset);
  
  pg.stroke(oppCol, 70, 75);
  pg.ellipse((widthVar/2)+xOffset, (heightVar*0.75)+yOffset, (heightVar/4)+wOffset, heightVar/4);
  
  pg.stroke(oppCol, 70, 75);
  pg.rect(ch141x2+xOffset,heightVar/2+yOffset,widthVar-(ch141x2+xOffset),(heightVar/2)+yOffset);
  
  pg.stroke(col, 70, 75);
  pg.ellipse(widthVar+xOffset, (heightVar*0.75)+yOffset, (heightVar/4)+wOffset, heightVar/4);
  
  
  pg.stroke(col, 70, 50);
  pg.beginShape();
  for (int x = 0; x < ch141yvalues.length; x++) {
    pg.vertex(x*ch141xspacing,(heightVar*0.1)+ch141yvalues[x]);
  }
  //pg.vertex(widthVar,0);
  //pg.vertex(0,0);
  pg.endShape();
  
  pg.stroke(oppCol, 70, 50);
  pg.beginShape();
  for (int x = 0; x < ch141yvalues.length; x++) {
    pg.vertex(x*ch141xspacing,(heightVar*0.9)-ch141yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar);
  //pg.vertex(0,heightVar);
  pg.endShape();
  
}