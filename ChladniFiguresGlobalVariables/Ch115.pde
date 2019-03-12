//ChladniFigure115

int ch115xspacing = 2; //how far apart for horizontal locations (wave fidelity)
int ch115w; //width of the wave
float ch115period; //pixels before wave repeats
float ch115dx; //Value for incrementing X, a function of period and xspacing
float[] ch115yvalues; //An array to store the height values for the wave

float ch115maxAmplitude; //max height for the wave

float ch115spacing; //pixel spacing value for wave placement

void ch115Setup () {
  ch115period = width * 0.4;
  ch115spacing = height*0.2;
  ch115maxAmplitude = height*0.1;
  
  ch115dx = (TWO_PI / ch115period) * ch115xspacing;
  ch115yvalues = new float[width/ch115xspacing];
}

void ch115Draw () {
  pg.beginDraw();
  ch115CalcWave();
  ch115RenderWave();
  pg.endDraw();
}

void ch115DrawOutlines () {
  pg.beginDraw();
  ch115CalcWave();
  ch115RenderOutlines();
  pg.endDraw();
}

void ch115CalcWave() {
  
  float f = map(ampNoise1, min1, max1, 0, ch115maxAmplitude);
  
  //For every x value, calculate a y value with a sine function
  float x = staticTheta;
  for (int i = 0; i < ch115yvalues.length; i++) {
    ch115yvalues[i] = sin(x)*f;
    x+=ch115dx;
  }
}

void ch115RenderWave() {  
  pg.fill(col, 100, 100);
  pg.noStroke();
  
  pg.rect(0,0,width,height);
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch115yvalues.length; x++) {
    pg.vertex(x*ch115xspacing, ((height/2)-(2*ch115spacing))+ch115yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch115yvalues.length; x++) {
    pg.vertex(x*ch115xspacing, ((height/2)-(ch115spacing))-ch115yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch115yvalues.length; x++) {
    pg.vertex(x*ch115xspacing, (height/2)+ch115yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch115yvalues.length; x++) {
    pg.vertex(x*ch115xspacing, ((height/2)+ch115spacing)-ch115yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch115yvalues.length; x++) {
    pg.vertex(x*ch115xspacing, ((height/2)+(2*ch115spacing))+ch115yvalues[x]);
  }
  pg.vertex(width,height);
  pg.vertex(0, height);
  pg.endShape();
}

void ch115RenderOutlines() {
  pg.stroke(col, 100, 100);
  pg.strokeWeight(width/100);
  pg.noFill();
  //pg.rect(0,0,width,height);
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch115yvalues.length; x++) {
    pg.vertex(x*ch115xspacing, ((height/2)-(2*ch115spacing))+ch115yvalues[x]);
  }
  //pg.vertex(width,height);
  //pg.vertex(0, height);
  pg.endShape();
  
  pg.stroke(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch115yvalues.length; x++) {
    pg.vertex(x*ch115xspacing, ((height/2)-(ch115spacing))-ch115yvalues[x]);
  }
  //pg.vertex(width,height);
  //pg.vertex(0, height);
  pg.endShape();
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch115yvalues.length; x++) {
    pg.vertex(x*ch115xspacing, (height/2)+ch115yvalues[x]);
  }
  //pg.vertex(width,height);
  //pg.vertex(0, height);
  pg.endShape();
  
  pg.stroke(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch115yvalues.length; x++) {
    pg.vertex(x*ch115xspacing, ((height/2)+ch115spacing)-ch115yvalues[x]);
  }
  //pg.vertex(width,height);
  //pg.vertex(0, height);
  pg.endShape();
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch115yvalues.length; x++) {
    pg.vertex(x*ch115xspacing, ((height/2)+(2*ch115spacing))+ch115yvalues[x]);
  }
  //pg.vertex(width,height);
  //pg.vertex(0, height);
  pg.endShape();
}
