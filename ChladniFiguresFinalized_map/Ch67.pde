//ChladniFigure67

int ch67xspacing = 1; //How far apart each vertical position should be

float ch67period; //How many pixels before the wave repeats
float ch67dx; //Value for incrementing Y, as a function of period and yspacing
float[] ch67yvalues; //Using an array to store horizontal values for the wave

float ch67maxAmplitude; //max height for the wave

void ch67Setup () {
  ch67period = widthVar*2;
  ch67dx = (TWO_PI / ch67period) * ch67xspacing;
  ch67yvalues = new float[widthVar/ch67xspacing];
  
  ch67maxAmplitude = heightVar/2;
}

void ch67Draw () {
  pg.beginDraw();
  ch67CalcWave();
  ch67RenderWave();
  pg.endDraw();
}

void ch67DrawOutlines () {
  pg.beginDraw();
  ch67CalcWave();
  ch67RenderOutlines();
  pg.endDraw();
}

void ch67CalcWave() {
  float f = map(ampNoise1, min1, max1, 0, ch67maxAmplitude);
  
  float x = staticTheta;
  for (int i = 0; i < ch67yvalues.length; i++) {
    ch67yvalues[i] = sin(x)*f;
    x+=ch67dx;
  }
}

void ch67RenderWave() {  
  //pg.background(col, 70, 75);
  pg.noStroke();
  
  pg.fill(oppCol, 100, 100);
  pg.ellipse(widthVar/2,heightVar/2,widthVar,heightVar);
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch67yvalues.length; x++) {
    pg.vertex(x*ch67xspacing,(heightVar)-ch67yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0,heightVar);
  pg.endShape();
  
  circle.disableStyle();
  pg.fill(col, 70, 70);
  pg.shape(circle,0,0,widthVar,heightVar);
}

void ch67RenderOutlines() {
  pg.stroke(col, 100, 100);
  pg.strokeWeight(widthVar/100);
  pg.noFill();
  
  pg.stroke(oppCol, 100, 100);
  pg.ellipse(widthVar/2,heightVar/2,widthVar,heightVar);
  
  pg.stroke(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch67yvalues.length; x++) {
    pg.vertex(x*ch67xspacing,(heightVar)-ch67yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar);
  //pg.vertex(0,heightVar);
  pg.endShape();
}