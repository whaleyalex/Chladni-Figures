//ChladniFigure126

int ch126xspacing = 2; //how far apart for horizontal locations (wave fidelity)
float ch126period; //pixels before wave repeats
float ch126dx; //Value for incrementing X, a function of period and xspacing
float[] ch126yvalues; //An array to store the height values for the wave

float ch126maxAmplitude; //max height for the wave

float ch126spacing; //pixel spacing value for wave placement

void ch126Setup () {
  ch126period = widthVar * 0.366;
  ch126spacing = heightVar * 0.075;
  ch126maxAmplitude = heightVar*0.09;
  
  ch126dx = (TWO_PI / ch126period) * ch126xspacing;
  ch126yvalues = new float[widthVar*3/ch126xspacing];
}

void ch126Draw () {
  pg.beginDraw();
  ch126CalcWave();
  ch126RenderWave();
  pg.endDraw();
}

void ch126DrawOutlines () {
  pg.beginDraw();
  ch126CalcWave();
  ch126RenderOutlines();
  pg.endDraw();
}

void ch126CalcWave() {
  float f = map(ampNoise1, min1, max1, 0, ch126maxAmplitude);
  
  //For every x value, calculate a y value with a sine function
  float x = negativeTheta;
  for (int i = 0; i < ch126yvalues.length; i++) {
    ch126yvalues[i] = sin(x)*f;
    x+=ch126dx;
  }
  
  negativeTheta -= 0.15;
}

void ch126RenderWave() {
  //pg.pushMatrix();
  
  pg.fill(col, 100, 100);
  pg.noStroke();
  pg.rect(0,0,widthVar,heightVar);
  
  pg.translate(widthVar/2, -(((sqrt(sq(widthVar)+sq(heightVar)))/2)-(heightVar/2)) );
  pg.rotate(PI/4);
  pg.translate(-widthVar/2,0);
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch126yvalues.length; x++) {
    pg.vertex(x*ch126xspacing, ((heightVar/2)-(7*ch126spacing))-ch126yvalues[x]);
  }
  pg.vertex(widthVar,heightVar*2);
  pg.vertex(0, heightVar*2);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch126yvalues.length; x++) {
    pg.vertex(x*ch126xspacing, ((heightVar/2)-(5*ch126spacing))+ch126yvalues[x]);
  }
  pg.vertex(widthVar,heightVar*2);
  pg.vertex(0, heightVar*2);
  pg.endShape();
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch126yvalues.length; x++) {
    pg.vertex(x*ch126xspacing, ((heightVar/2)-(3*ch126spacing))-ch126yvalues[x]);
  }
  pg.vertex(widthVar,heightVar*2);
  pg.vertex(0, heightVar*2);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch126yvalues.length; x++) {
    pg.vertex(x*ch126xspacing, ((heightVar/2)-(ch126spacing))+ch126yvalues[x]);
  }
  pg.vertex(widthVar,heightVar*2);
  pg.vertex(0, heightVar*2);
  pg.endShape();
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch126yvalues.length; x++) {
    pg.vertex(x*ch126xspacing, ((heightVar/2)+(ch126spacing))-ch126yvalues[x]);
  }
  pg.vertex(widthVar,heightVar*2);
  pg.vertex(0, heightVar*2);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch126yvalues.length; x++) {
    pg.vertex(x*ch126xspacing, ((heightVar/2)+(3*ch126spacing))+ch126yvalues[x]);
  }
  pg.vertex(widthVar,heightVar*2);
  pg.vertex(0, heightVar*2);
  pg.endShape();
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch126yvalues.length; x++) {
    pg.vertex(x*ch126xspacing, ((heightVar/2)+(5*ch126spacing))-ch126yvalues[x]);
  }
  pg.vertex(widthVar,heightVar*2);
  pg.vertex(0, heightVar*2);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch126yvalues.length; x++) {
    pg.vertex(x*ch126xspacing, ((heightVar/2)+(7*ch126spacing))+ch126yvalues[x]);
  }
  pg.vertex(widthVar,heightVar*2);
  pg.vertex(0, heightVar*2);
  pg.endShape();
  
  //pg.popMatrix();
}

void ch126RenderOutlines() {
  pg.stroke(col, 100, 100);
  pg.strokeWeight(widthVar/100);
  pg.noFill();
  
  pg.translate(widthVar/2, -(((sqrt(sq(widthVar)+sq(heightVar)))/2)-(heightVar/2)) );
  pg.rotate(PI/4);
  pg.translate(-widthVar/2,0);
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch126yvalues.length; x++) {
    pg.vertex(x*ch126xspacing, ((heightVar/2)-(7*ch126spacing))-ch126yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar*2);
  //pg.vertex(0, heightVar*2);
  pg.endShape();
  
  pg.stroke(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch126yvalues.length; x++) {
    pg.vertex(x*ch126xspacing, ((heightVar/2)-(5*ch126spacing))+ch126yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar*2);
  //pg.vertex(0, heightVar*2);
  pg.endShape();
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch126yvalues.length; x++) {
    pg.vertex(x*ch126xspacing, ((heightVar/2)-(3*ch126spacing))-ch126yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar*2);
  //pg.vertex(0, heightVar*2);
  pg.endShape();
  
  pg.stroke(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch126yvalues.length; x++) {
    pg.vertex(x*ch126xspacing, ((heightVar/2)-(ch126spacing))+ch126yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar*2);
  //pg.vertex(0, heightVar*2);
  pg.endShape();
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch126yvalues.length; x++) {
    pg.vertex(x*ch126xspacing, ((heightVar/2)+(ch126spacing))-ch126yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar*2);
  //pg.vertex(0, heightVar*2);
  pg.endShape();
  
  pg.stroke(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch126yvalues.length; x++) {
    pg.vertex(x*ch126xspacing, ((heightVar/2)+(3*ch126spacing))+ch126yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar*2);
  //pg.vertex(0, heightVar*2);
  pg.endShape();
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch126yvalues.length; x++) {
    pg.vertex(x*ch126xspacing, ((heightVar/2)+(5*ch126spacing))-ch126yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar*2);
  //pg.vertex(0, heightVar*2);
  pg.endShape();
  
  pg.stroke(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch126yvalues.length; x++) {
    pg.vertex(x*ch126xspacing, ((heightVar/2)+(7*ch126spacing))+ch126yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar*2);
  //pg.vertex(0, heightVar*2);
  pg.endShape();
}