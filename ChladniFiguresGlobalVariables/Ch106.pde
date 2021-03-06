//ChladniFigure106

int ch106xspacing = 2; //how far apart for horizontal locations (wave fidelity)
int ch106w; //width of the wave
float ch106period; //pixels before wave repeats
float ch106dx; //Value for incrementing X, a function of period and xspacing
float[] ch106yvalues; //An array to store the height values for the wave

float ch106maxAmplitude; //max height for the wave

float ch106spacing; //pixel spacing value for wave placement

void ch106Setup () {
  ch106spacing = height * 0.143;
  ch106period = width * 0.6667;
  ch106maxAmplitude = height * 0.16;
  
  ch106dx = (TWO_PI / ch106period) * ch106xspacing;
  ch106yvalues = new float[width/ch106xspacing];
}

void ch106Draw () {
  pg.beginDraw();
  ch106CalcWave();
  ch106RenderWave();
  pg.endDraw();
}

void ch106DrawOutlines () {
  pg.beginDraw();
  ch106CalcWave();
  ch106RenderOutlines();
  pg.endDraw();
}

void ch106CalcWave() {
  float f = map(ampNoise1, min1, max1, 0, ch106maxAmplitude);
  
  //For every x value, calculate a y value with a sine function
  float x = theta;
  for (int i = 0; i < ch106yvalues.length; i++) {
    ch106yvalues[i] = sin(x)*f;
    x+=ch106dx;
  }
  
  theta+=0.02;
}

void ch106RenderWave() {  
  pg.fill(col, 100, 100);
  pg.noStroke();
  pg.rect(0,0,width,height);
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch106yvalues.length; x++) {
    pg.vertex(x*ch106xspacing, ((height/2)-(3*ch106spacing))+ch106yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch106yvalues.length; x++) {
    pg.vertex(x*ch106xspacing, ((height/2)-ch106spacing)-ch106yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch106yvalues.length; x++) {
    pg.vertex(x*ch106xspacing, ((height/2)+ch106spacing)+ch106yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch106yvalues.length; x++) {
    pg.vertex(x*ch106xspacing, ((height/2)+(3*ch106spacing))-ch106yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
}

void ch106RenderOutlines() {
  pg.stroke(col, 100, 100);
  pg.strokeWeight(width/100);
  pg.noFill();
  //pg.rect(0,0,width,height);
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch106yvalues.length; x++) {
    pg.vertex(x*ch106xspacing, ((height/2)-(3*ch106spacing))+ch106yvalues[x]);
  }
  //pg.vertex(width,height);
  //pg.vertex(0, height);
  pg.endShape();
  
  pg.stroke(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch106yvalues.length; x++) {
    pg.vertex(x*ch106xspacing, ((height/2)-ch106spacing)-ch106yvalues[x]);
  }
  //pg.vertex(width,height);
  //pg.vertex(0, height);
  pg.endShape();
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch106yvalues.length; x++) {
    pg.vertex(x*ch106xspacing, ((height/2)+ch106spacing)+ch106yvalues[x]);
  }
  //pg.vertex(width,height);
  //pg.vertex(0, height);
  pg.endShape();
  
  pg.stroke(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch106yvalues.length; x++) {
    pg.vertex(x*ch106xspacing, ((height/2)+(3*ch106spacing))-ch106yvalues[x]);
  }
  //pg.vertex(width,height);
  //pg.vertex(0, height);
  pg.endShape();
}
