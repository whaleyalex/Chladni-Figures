//ChladniFigure139

int ch139xspacing = 2; //how far apart for horizontal locations (wave fidelity)
int ch139w; //width of the wave
float ch139period; //pixels before wave repeats
float ch139dx; //Value for incrementing X, a function of period and xspacing
float[] ch139yvalues; //An array to store the height values for the wave

float ch139maxAmplitude; //max height for the wave

float ch139spacing; //pixel spacing value for wave placement

float ch139maxPix; //max num pixels line moves up and down

void ch139Setup () {
  ch139period = widthVar * 0.6667;
  ch139spacing = heightVar*0.143;
  ch139maxAmplitude= heightVar*0.1;
  
  ch139maxPix = heightVar * 0.075;
  
  ch139dx = (TWO_PI / ch139period) * ch139xspacing;
  ch139yvalues = new float[widthVar/ch139xspacing];
}

void ch139Draw () {
  pg.beginDraw();
  ch139CalcWave();
  ch139RenderWave();
  pg.endDraw();
}

void ch139DrawOutlines () {
  pg.beginDraw();
  ch139CalcWave();
  ch139RenderOutlines();
  pg.endDraw();
}

void ch139CalcWave() {
  
  float f = map(ampNoise1, min1, max1, 0, ch139maxAmplitude);
  
  //For every x value, calculate a y value with a sine function
  float x = staticTheta;
  for (int i = 0; i < ch139yvalues.length; i++) {
    ch139yvalues[i] = sin(x)*f;
    x+=ch139dx;
  }
}

void ch139RenderWave() {
  pg.fill(col, 100, 100);
  pg.noStroke();
  
  pg.rect(0,0,widthVar,heightVar);
  
  float var = map(yNoise, min7, max7, -ch139maxPix, ch139maxPix);
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch139yvalues.length; x++) {
    pg.vertex(x*ch139xspacing, ((heightVar/2)-(3*ch139spacing))-ch139yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  pg.vertex(0, (((heightVar/2)-(2*ch139spacing))+var));
  pg.vertex(widthVar, (((heightVar/2)-(2*ch139spacing))+var));
  pg.vertex(widthVar,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch139yvalues.length; x++) {
    pg.vertex(x*ch139xspacing, ((heightVar/2)-ch139spacing)+ch139yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  pg.vertex(0, ((heightVar/2)+var));
  pg.vertex(widthVar, ((heightVar/2)+var));
  pg.vertex(widthVar,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch139yvalues.length; x++) {
    pg.vertex(x*ch139xspacing, ((heightVar/2)+ch139spacing)-ch139yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  pg.vertex(0, (((heightVar/2)+(2*ch139spacing))+var));
  pg.vertex(widthVar, (((heightVar/2)+(2*ch139spacing))+var));
  pg.vertex(widthVar,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch139yvalues.length; x++) {
    pg.vertex(x*ch139xspacing, ((heightVar/2)+(3*ch139spacing))+ch139yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
}

void ch139RenderOutlines() {
  pg.stroke(col, 100, 100);
  pg.strokeWeight(widthVar/100);
  pg.noFill();
  //pg.rect(0,0,width,height);
  
  float var = map(yNoise, min7, max7, -ch139maxPix, ch139maxPix);
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch139yvalues.length; x++) {
    pg.vertex(x*ch139xspacing, ((heightVar/2)-(3*ch139spacing))-ch139yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar);
  //pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.stroke(col, 100, 100);
  pg.beginShape();
  pg.vertex(0, (((heightVar/2)-(2*ch139spacing))+var));
  pg.vertex(widthVar, (((heightVar/2)-(2*ch139spacing))+var));
  //pg.vertex(widthVar,heightVar);
  //pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch139yvalues.length; x++) {
    pg.vertex(x*ch139xspacing, ((heightVar/2)-ch139spacing)+ch139yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar);
  //pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.stroke(col, 100, 100);
  pg.beginShape();
  pg.vertex(0, ((heightVar/2)+var));
  pg.vertex(widthVar, ((heightVar/2)+var));
  //pg.vertex(widthVar,heightVar);
  //pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch139yvalues.length; x++) {
    pg.vertex(x*ch139xspacing, ((heightVar/2)+ch139spacing)-ch139yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar);
  //pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.stroke(col, 100, 100);
  pg.beginShape();
  pg.vertex(0, (((heightVar/2)+(2*ch139spacing))+var));
  pg.vertex(widthVar, (((heightVar/2)+(2*ch139spacing))+var));
  //pg.vertex(widthVar,heightVar);
  //pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch139yvalues.length; x++) {
    pg.vertex(x*ch139xspacing, ((heightVar/2)+(3*ch139spacing))+ch139yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar);
  //pg.vertex(0, heightVar);
  pg.endShape();
}