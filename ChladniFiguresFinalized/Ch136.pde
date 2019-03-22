//ChladniFigure136

int ch136xspacing = 1; //How far apart each vertical position should be

float ch136period; //How many pixels before the wave repeats
float ch136dx; //Value for incrementing Y, as a function of period and yspacing
float[] ch136yvalues; //Using an array to store horizontal values for the wave

float ch136maxAmplitude; //max height for the wave

float ch136x1,ch136x2,ch136y1,ch136y2;
float ch136maxDisplacement; //max number of pixels for shifting lines positive and negative, and width of the ellipses

void ch136Setup () {
  ch136period = widthVar*0.667;
  ch136dx = (TWO_PI / ch136period) * ch136xspacing;
  ch136yvalues = new float[widthVar/ch136xspacing];
  
  ch136maxAmplitude = heightVar*0.15;
  
  ch136maxDisplacement = widthVar * 0.15;
  
  ch136x1 = widthVar*0.25;
  ch136x2 = widthVar*0.75;
  ch136y1 = heightVar*0.25;
  ch136y2 = heightVar*0.75;
}

void ch136Draw () {
  pg.beginDraw();
  ch136CalcWave();
  ch136RenderWave();
  pg.endDraw();
}

void ch136DrawOutlines () {
  pg.beginDraw();
  ch136CalcWave();
  ch136RenderOutlines();
  pg.endDraw();
}

void ch136CalcWave() {
  float f = map(ampNoise1, min1, max1, 0, ch136maxAmplitude);
  
  float x = staticTheta;
  for (int i = 0; i < ch136yvalues.length; i++) {
    ch136yvalues[i] = sin(x)*f;
    x+=ch136dx;
  }
}

void ch136RenderWave() {  
  float xOffset = map(xNoise, min6, max6, -ch136maxDisplacement, ch136maxDisplacement);
  float yOffset = map(yNoise, min7, max7, -ch136maxDisplacement, ch136maxDisplacement);
  float wOffset = map(wNoise, min8, max8, -ch136maxDisplacement, ch136maxDisplacement);
  
  //pg.background(col, 70, 75);
  pg.noStroke();
  
  pg.fill(col, 100, 100);
  pg.rect(0,0,ch136x1+xOffset,ch136y1+yOffset);
  
  pg.fill(oppCol, 100, 100);
  pg.rect(ch136x1+xOffset,0,ch136x2-ch136x1,ch136y1+yOffset);
  
  pg.fill(col, 100, 100);
  pg.rect(ch136x2+xOffset,0,widthVar-(ch136x2+xOffset),ch136y1+yOffset);
  
  
  
  pg.fill(oppCol, 100, 100);
  pg.rect(0,ch136y1+yOffset,ch136x1+xOffset,ch136y2-ch136y1);
  
  pg.fill(col, 100, 100);
  pg.ellipse(0+xOffset, (heightVar/2)+yOffset, (heightVar/4)+wOffset, heightVar/4);
  
  pg.fill(col, 100, 100);
  pg.rect(ch136x1+xOffset,ch136y1+yOffset,ch136x2-ch136x1,ch136y2-ch136y1);
  
  pg.fill(oppCol, 100, 100);
  pg.ellipse((widthVar/2)+xOffset, (heightVar/2)+yOffset, (heightVar/4)+wOffset, heightVar/4);
  
  pg.fill(oppCol, 100, 100);
  pg.rect(ch136x2+xOffset,ch136y1+yOffset,widthVar-(ch136x2+xOffset), ch136y2-ch136y1);
  
  pg.fill(col, 100, 100);
  pg.ellipse(widthVar+xOffset, (heightVar/2)+yOffset, (heightVar/4)+wOffset, heightVar/4);
  
  
  
  pg.fill(col, 100, 100);
  pg.rect(0,ch136y2+yOffset,ch136x1+xOffset,heightVar-(ch136x2+yOffset));
  
  pg.fill(oppCol, 100, 100);
  pg.rect(ch136x1+xOffset,ch136y2+yOffset,ch136x2-ch136x1,heightVar-(ch136x2+yOffset));
   
  pg.fill(col, 100, 100);
  pg.rect(ch136x2+xOffset,ch136y2+yOffset,widthVar-(ch136x2+xOffset),heightVar-(ch136x2+yOffset));
    
  
  pg.fill(col, 70, 70);
  pg.beginShape();
  for (int x = 0; x < ch136yvalues.length; x++) {
    pg.vertex(x*ch136xspacing,(heightVar*0.125)-ch136yvalues[x]);
  }
  pg.vertex(widthVar,0);
  pg.vertex(0,0);
  pg.endShape();
  
  pg.fill(oppCol, 70, 70);
  pg.beginShape();
  for (int x = 0; x < ch136yvalues.length; x++) {
    pg.vertex(x*ch136xspacing,(heightVar*0.875)+ch136yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0,heightVar);
  pg.endShape();
  
  
  /*
  pg.fill(oppCol, 70, 75);
  pg.ellipse(widthVar/2,heightVar/2,widthVar,heightVar);
  
  pg.fill(col, 70, 75);
  pg.beginShape();
  for (int x = 0; x < ch136yvalues.length; x++) {
    pg.vertex(x*ch136xspacing,(heightVar)-ch136yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0,heightVar);
  pg.endShape();
  */
}

void ch136RenderOutlines() {
  float xOffset = map(xNoise, min6, max6, -ch136maxDisplacement, ch136maxDisplacement);
  float yOffset = map(yNoise, min7, max7, -ch136maxDisplacement, ch136maxDisplacement);
  float wOffset = map(wNoise, min8, max8, -ch136maxDisplacement, ch136maxDisplacement);
  
  pg.stroke(col, 100, 100);
  pg.strokeWeight(widthVar/100);
  pg.noFill();
   
  pg.stroke(col, 70, 75);
  pg.rect(0,0,ch136x1+xOffset,ch136y1+yOffset);
  
  pg.stroke(oppCol, 70, 75);
  pg.rect(ch136x1+xOffset,0,ch136x2-ch136x1,ch136y1+yOffset);
  
  pg.stroke(col, 70, 75);
  pg.rect(ch136x2+xOffset,0,widthVar-(ch136x2+xOffset),ch136y1+yOffset);
  
  
  
  pg.stroke(oppCol, 70, 75);
  pg.rect(0,ch136y1+yOffset,ch136x1+xOffset,ch136y2-ch136y1);
  
  pg.stroke(col, 70, 75);
  pg.ellipse(0+xOffset, (heightVar/2)+yOffset, (heightVar/4)+wOffset, heightVar/4);
  
  pg.stroke(col, 70, 75);
  pg.rect(ch136x1+xOffset,ch136y1+yOffset,ch136x2-ch136x1,ch136y2-ch136y1);
  
  pg.stroke(oppCol, 70, 75);
  pg.ellipse((widthVar/2)+xOffset, (heightVar/2)+yOffset, (heightVar/4)+wOffset, heightVar/4);
  
  pg.stroke(oppCol, 70, 75);
  pg.rect(ch136x2+xOffset,ch136y1+yOffset,widthVar-(ch136x2+xOffset), ch136y2-ch136y1);
  
  pg.stroke(col, 70, 75);
  pg.ellipse(widthVar+xOffset, (heightVar/2)+yOffset, (heightVar/4)+wOffset, heightVar/4);
  
  
  
  pg.stroke(col, 70, 75);
  pg.rect(0,ch136y2+yOffset,ch136x1+xOffset,heightVar-(ch136x2+yOffset));
  
  pg.stroke(oppCol, 70, 75);
  pg.rect(ch136x1+xOffset,ch136y2+yOffset,ch136x2-ch136x1,heightVar-(ch136x2+yOffset));
   
  pg.stroke(col, 70, 75);
  pg.rect(ch136x2+xOffset,ch136y2+yOffset,widthVar-(ch136x2+xOffset),heightVar-(ch136x2+yOffset));
    
  
  pg.stroke(col, 70, 50);
  pg.beginShape();
  for (int x = 0; x < ch136yvalues.length; x++) {
    pg.vertex(x*ch136xspacing,(heightVar*0.125)-ch136yvalues[x]);
  }
  //pg.vertex(widthVar,0);
  //pg.vertex(0,0);
  pg.endShape();
  
  pg.stroke(oppCol, 70, 50);
  pg.beginShape();
  for (int x = 0; x < ch136yvalues.length; x++) {
    pg.vertex(x*ch136xspacing,(heightVar*0.875)+ch136yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar);
  //pg.vertex(0,heightVar);
  pg.endShape();
}
