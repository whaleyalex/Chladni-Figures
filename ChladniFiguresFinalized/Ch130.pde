//ChladniFigure130

int ch130xspacing = 2; //how far apart for horizontal locations (wave fidelity)
int ch130w; //width of the wave
float ch130period; //pixels before wave repeats
float ch130dx; //Value for incrementing X, a function of period and xspacing
float[] ch130yvalues; //An array to store the height values for the wave

float ch130maxAmplitude; //max height for the wave

float ch130spacing; //pixel spacing value for wave placement

void ch130Setup () {
  ch130period = widthVar * 0.4;
  ch130spacing = heightVar*0.09;
  ch130maxAmplitude = heightVar*0.08;
  
  ch130dx = (TWO_PI / ch130period) * ch130xspacing;
  ch130yvalues = new float[widthVar/ch130xspacing];
}

void ch130Draw () {
  pg.beginDraw();
  ch130CalcWave();
  ch130RenderWave();
  pg.endDraw();
}

void ch130DrawOutlines () {
  pg.beginDraw();
  ch130CalcWave();
  ch130RenderOutlines();
  pg.endDraw();
}

void ch130CalcWave() {
  
  float f = map(ampNoise1, min1, max1, 0, ch130maxAmplitude);
  
  //For every x value, calculate a y value with a sine function
  float x = theta;
  for (int i = 0; i < ch130yvalues.length; i++) {
    ch130yvalues[i] = sin(x)*f;
    x+=ch130dx;
  }
  
  theta += 0.1;
}

void ch130RenderWave() {
  pg.fill(col, 100, 100);
  pg.noStroke();
  pg.rect(0,0,widthVar,heightVar);
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch130yvalues.length; x++) {
    pg.vertex(x*ch130xspacing, ((heightVar/2)-(5*ch130spacing))+ch130yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch130yvalues.length; x++) {
    pg.vertex(x*ch130xspacing, ((heightVar/2)-(3*ch130spacing))-ch130yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch130yvalues.length; x++) {
    pg.vertex(x*ch130xspacing, ((heightVar/2)-(ch130spacing))+ch130yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch130yvalues.length; x++) {
    pg.vertex(x*ch130xspacing, ((heightVar/2)+ch130spacing)-ch130yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch130yvalues.length; x++) {
    pg.vertex(x*ch130xspacing, ((heightVar/2)+(3*ch130spacing))+ch130yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch130yvalues.length; x++) {
    pg.vertex(x*ch130xspacing, ((heightVar/2)+(5*ch130spacing))-ch130yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
}

void ch130RenderOutlines() {
  pg.stroke(col, 100, 100);
  pg.strokeWeight(widthVar/100);
  pg.noFill();
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch130yvalues.length; x++) {
    pg.vertex(x*ch130xspacing, ((heightVar/2)-(5*ch130spacing))+ch130yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar);
  //pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.stroke(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch130yvalues.length; x++) {
    pg.vertex(x*ch130xspacing, ((heightVar/2)-(3*ch130spacing))-ch130yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar);
  //pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch130yvalues.length; x++) {
    pg.vertex(x*ch130xspacing, ((heightVar/2)-(ch130spacing))+ch130yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar);
  //pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.stroke(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch130yvalues.length; x++) {
    pg.vertex(x*ch130xspacing, ((heightVar/2)+ch130spacing)-ch130yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar);
  //pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch130yvalues.length; x++) {
    pg.vertex(x*ch130xspacing, ((heightVar/2)+(3*ch130spacing))+ch130yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar);
  //pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.stroke(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch130yvalues.length; x++) {
    pg.vertex(x*ch130xspacing, ((heightVar/2)+(5*ch130spacing))-ch130yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar);
  //pg.vertex(0, heightVar);
  pg.endShape();
}
