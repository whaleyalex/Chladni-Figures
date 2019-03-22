//ChladniFigure108

int ch108xspacing = 2; //how far apart for horizontal locations (wave fidelity)
int ch108w; //width of the wave
float ch108period; //pixels before wave repeats
float ch108dx; //Value for incrementing X, a function of period and xspacing
float[] ch108yvalues; //An array to store the height values for the wave

float ch108maxAmplitude; //max height for the wave

float ch108spacing; //pixel spacing value for wave placement

void ch108Setup () {
  ch108period = widthVar * 0.6667;
  ch108spacing = heightVar * 0.125;
  ch108maxAmplitude = heightVar * 0.15;
  
  ch108dx = (TWO_PI / ch108period) * ch108xspacing;
  ch108yvalues = new float[widthVar/ch108xspacing];
}

void ch108Draw () {
  pg.beginDraw();
  ch108CalcWave();
  ch108RenderWave();
  pg.endDraw();
}

void ch108DrawOutlines () {
  pg.beginDraw();
  ch108CalcWave();
  ch108RenderOutlines();
  pg.endDraw();
}

void ch108CalcWave() {
  float f = map(ampNoise1, min1, max1, 0, ch108maxAmplitude);
  
  //For every x value, calculate a y value with a sine function
  float x = negativeTheta;
  for (int i = 0; i < ch108yvalues.length; i++) {
    ch108yvalues[i] = sin(x)*f;
    x+=ch108dx;
  }
  
  negativeTheta -= 0.08;
}

void ch108RenderWave() {  
  pg.fill(col, 100, 100);
  pg.noStroke();
  pg.rect(0,0,widthVar,heightVar);
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch108yvalues.length; x++) {
    pg.vertex(x*ch108xspacing, ((heightVar/2)-(3*ch108spacing))-ch108yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch108yvalues.length; x++) {
    pg.vertex(x*ch108xspacing, ((heightVar/2)-ch108spacing)+ch108yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch108yvalues.length; x++) {
    pg.vertex(x*ch108xspacing, ((heightVar/2)+ch108spacing)-ch108yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch108yvalues.length; x++) {
    pg.vertex(x*ch108xspacing, ((heightVar/2)+(3*ch108spacing))+ch108yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
}

void ch108RenderOutlines() {
  pg.stroke(col, 100, 100);
  pg.strokeWeight(widthVar/100);
  pg.noFill();
  //pg.rect(0,0,widthVar,heightVar);
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch108yvalues.length; x++) {
    pg.vertex(x*ch108xspacing, ((heightVar/2)-(3*ch108spacing))-ch108yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar);
  //pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.stroke(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch108yvalues.length; x++) {
    pg.vertex(x*ch108xspacing, ((heightVar/2)-ch108spacing)+ch108yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar);
  //pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch108yvalues.length; x++) {
    pg.vertex(x*ch108xspacing, ((heightVar/2)+ch108spacing)-ch108yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar);
  //pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.stroke(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch108yvalues.length; x++) {
    pg.vertex(x*ch108xspacing, ((heightVar/2)+(3*ch108spacing))+ch108yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar);
  //pg.vertex(0, heightVar);
  pg.endShape();
}
