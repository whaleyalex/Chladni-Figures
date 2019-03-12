//ChladniFigure136

int ch136xspacing = 1; //How far apart each vertical position should be

float ch136period; //How many pixels before the wave repeats
float ch136dx; //Value for incrementing Y, as a function of period and yspacing
float[] ch136yvalues; //Using an array to store horizontal values for the wave

float ch136maxAmplitude; //max height for the wave

float ch136x1,ch136x2,ch136y1,ch136y2;
float ch136maxDisplacement; //max number of pixels for shifting lines positive and negative, and width of the ellipses

void ch136Setup () {
  ch136period = width*0.667;
  ch136dx = (TWO_PI / ch136period) * ch136xspacing;
  ch136yvalues = new float[width/ch136xspacing];
  
  ch136maxAmplitude = height*0.125;
  
  ch136maxDisplacement = width * 0.1;
  
  ch136x1 = width*0.25;
  ch136x2 = width*0.75;
  ch136y1 = height*0.25;
  ch136y2 = height*0.75;
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
  
  pg.fill(col, 70, 75);
  pg.rect(0,0,ch136x1+xOffset,ch136y1+yOffset);
  
  pg.fill(oppCol, 70, 75);
  pg.rect(ch136x1+xOffset,0,ch136x2-ch136x1,ch136y1+yOffset);
  
  pg.fill(col, 70, 75);
  pg.rect(ch136x2+xOffset,0,width-(ch136x2+xOffset),ch136y1+yOffset);
  
  
  
  pg.fill(oppCol, 70, 75);
  pg.rect(0,ch136y1+yOffset,ch136x1+xOffset,ch136y2-ch136y1);
  
  pg.fill(col, 70, 75);
  pg.ellipse(0+xOffset, (height/2)+yOffset, (height/4)+wOffset, height/4);
  
  pg.fill(col, 70, 75);
  pg.rect(ch136x1+xOffset,ch136y1+yOffset,ch136x2-ch136x1,ch136y2-ch136y1);
  
  pg.fill(oppCol, 70, 75);
  pg.ellipse((width/2)+xOffset, (height/2)+yOffset, (height/4)+wOffset, height/4);
  
  pg.fill(oppCol, 70, 75);
  pg.rect(ch136x2+xOffset,ch136y1+yOffset,width-(ch136x2+xOffset), ch136y2-ch136y1);
  
  pg.fill(col, 70, 75);
  pg.ellipse(width+xOffset, (height/2)+yOffset, (height/4)+wOffset, height/4);
  
  
  
  pg.fill(col, 70, 75);
  pg.rect(0,ch136y2+yOffset,ch136x1+xOffset,height-(ch136x2+yOffset));
  
  pg.fill(oppCol, 70, 75);
  pg.rect(ch136x1+xOffset,ch136y2+yOffset,ch136x2-ch136x1,height-(ch136x2+yOffset));
   
  pg.fill(col, 70, 75);
  pg.rect(ch136x2+xOffset,ch136y2+yOffset,width-(ch136x2+xOffset),height-(ch136x2+yOffset));
    
  
  pg.fill(col, 70, 50);
  pg.beginShape();
  for (int x = 0; x < ch136yvalues.length; x++) {
    pg.vertex(x*ch136xspacing,(height*0.125)-ch136yvalues[x]);
  }
  pg.vertex(width,0);
  pg.vertex(0,0);
  pg.endShape();
  
  pg.fill(oppCol, 70, 50);
  pg.beginShape();
  for (int x = 0; x < ch136yvalues.length; x++) {
    pg.vertex(x*ch136xspacing,(height*0.875)+ch136yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0,height);
  pg.endShape();
  
  
  /*
  pg.fill(oppCol, 70, 75);
  pg.ellipse(width/2,height/2,width,height);
  
  pg.fill(col, 70, 75);
  pg.beginShape();
  for (int x = 0; x < ch136yvalues.length; x++) {
    pg.vertex(x*ch136xspacing,(height)-ch136yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0,height);
  pg.endShape();
  */
}

void ch136RenderOutlines() {
  float xOffset = map(xNoise, min6, max6, -ch136maxDisplacement, ch136maxDisplacement);
  float yOffset = map(yNoise, min7, max7, -ch136maxDisplacement, ch136maxDisplacement);
  float wOffset = map(wNoise, min8, max8, -ch136maxDisplacement, ch136maxDisplacement);
  
  pg.stroke(col, 100, 100);
  pg.strokeWeight(width/100);
  pg.noFill();
   
  pg.stroke(col, 70, 75);
  pg.rect(0,0,ch136x1+xOffset,ch136y1+yOffset);
  
  pg.stroke(oppCol, 70, 75);
  pg.rect(ch136x1+xOffset,0,ch136x2-ch136x1,ch136y1+yOffset);
  
  pg.stroke(col, 70, 75);
  pg.rect(ch136x2+xOffset,0,width-(ch136x2+xOffset),ch136y1+yOffset);
  
  
  
  pg.stroke(oppCol, 70, 75);
  pg.rect(0,ch136y1+yOffset,ch136x1+xOffset,ch136y2-ch136y1);
  
  pg.stroke(col, 70, 75);
  pg.ellipse(0+xOffset, (height/2)+yOffset, (height/4)+wOffset, height/4);
  
  pg.stroke(col, 70, 75);
  pg.rect(ch136x1+xOffset,ch136y1+yOffset,ch136x2-ch136x1,ch136y2-ch136y1);
  
  pg.stroke(oppCol, 70, 75);
  pg.ellipse((width/2)+xOffset, (height/2)+yOffset, (height/4)+wOffset, height/4);
  
  pg.stroke(oppCol, 70, 75);
  pg.rect(ch136x2+xOffset,ch136y1+yOffset,width-(ch136x2+xOffset), ch136y2-ch136y1);
  
  pg.stroke(col, 70, 75);
  pg.ellipse(width+xOffset, (height/2)+yOffset, (height/4)+wOffset, height/4);
  
  
  
  pg.stroke(col, 70, 75);
  pg.rect(0,ch136y2+yOffset,ch136x1+xOffset,height-(ch136x2+yOffset));
  
  pg.stroke(oppCol, 70, 75);
  pg.rect(ch136x1+xOffset,ch136y2+yOffset,ch136x2-ch136x1,height-(ch136x2+yOffset));
   
  pg.stroke(col, 70, 75);
  pg.rect(ch136x2+xOffset,ch136y2+yOffset,width-(ch136x2+xOffset),height-(ch136x2+yOffset));
    
  
  pg.stroke(col, 70, 50);
  pg.beginShape();
  for (int x = 0; x < ch136yvalues.length; x++) {
    pg.vertex(x*ch136xspacing,(height*0.125)-ch136yvalues[x]);
  }
  //pg.vertex(width,0);
  //pg.vertex(0,0);
  pg.endShape();
  
  pg.stroke(oppCol, 70, 50);
  pg.beginShape();
  for (int x = 0; x < ch136yvalues.length; x++) {
    pg.vertex(x*ch136xspacing,(height*0.875)+ch136yvalues[x]);
  }
  //pg.vertex(width,height);
  //pg.vertex(0,height);
  pg.endShape();
}
