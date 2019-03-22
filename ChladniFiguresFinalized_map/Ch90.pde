//ChladniFigure90

int ch90yspacing = 1; //How far apart each vertical position should be

float ch90period; //How many pixels before the wave repeats
float ch90dy; //Value for incrementing Y, as a function of period and yspacing
float[] ch90xvalues; //Using an array to store horizontal values for the wave

float ch90maxAmplitude; //max height for the wave

float ch90dist; //pixels from the center line

void ch90Setup () {
  ch90dist = widthVar*0.25;
  ch90maxAmplitude = widthVar*0.3;
  
  ch90period = heightVar*2;
  ch90dy = (TWO_PI / ch90period) * ch90yspacing;
  ch90xvalues = new float[heightVar/ch90yspacing];
}

void ch90Draw () {
  pg.beginDraw();
  ch90CalcWave();
  ch90RenderWave();
  pg.endDraw();
}

void ch90DrawOutlines () {
  pg.beginDraw();
  ch90CalcWave();
  ch90RenderOutlines();
  pg.endDraw();
}

void ch90CalcWave() {
  float f = map(ampNoise1, min1, max1, 0, ch90maxAmplitude);
  
  float y = staticTheta;
  for (int i = 0; i < ch90xvalues.length; i++) {
    ch90xvalues[i] = sin(y)*f;
    y+=ch90dy;
  }
}

void ch90RenderWave() {
  pg.fill(col, 100, 100);
  pg.noStroke();
  pg.rect(0,0,widthVar,heightVar);
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int y = 0; y < ch90xvalues.length; y++) {
    pg.vertex((widthVar/2)+(ch90dist)+ch90xvalues[y],y*ch90yspacing);
  }
  pg.vertex(widthVar/2,heightVar);
  pg.vertex(widthVar/2,0);
  pg.endShape();
  
  pg.beginShape();
  for (int y = 0; y < ch90xvalues.length; y++) {
    pg.vertex((widthVar/2)-(ch90dist)-ch90xvalues[y],y*ch90yspacing);
  }
  pg.vertex(widthVar/2,heightVar);
  pg.vertex(widthVar/2,0);
  pg.endShape();
}

void ch90RenderOutlines() {
  pg.stroke(col, 100, 100);
  pg.strokeWeight(widthVar/100);
  pg.noFill();
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int y = 0; y < ch90xvalues.length; y++) {
    pg.vertex((width/2)+(ch90dist)+ch90xvalues[y],y*ch90yspacing);
  }
  //pg.vertex(widthVar/2,heightVar);
  //pg.vertex(widthVar/2,0);
  pg.endShape();
  
  pg.beginShape();
  for (int y = 0; y < ch90xvalues.length; y++) {
    pg.vertex((widthVar/2)-(ch90dist)-ch90xvalues[y],y*ch90yspacing);
  }
  //pg.vertex(widthVar/2,heightVar);
  //pg.vertex(widthVar/2,0);
  pg.endShape();
}