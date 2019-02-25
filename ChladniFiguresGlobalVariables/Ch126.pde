//ChladniFigure126

int ch126xspacing = 2; //how far apart for horizontal locations (wave fidelity)
float ch126period; //pixels before wave repeats
float ch126dx; //Value for incrementing X, a function of period and xspacing
float[] ch126yvalues; //An array to store the height values for the wave

float ch126yoff = 0.0; //noise for the amplitude of the wave
float ch126maxAmplitude; //max height for the wave

float ch126spacing; //pixel spacing value for wave placement

void ch126Setup () {
  ch126period = width * 0.366;
  ch126spacing = height * 0.075;
  ch126maxAmplitude = height*0.0725;
  
  ch126dx = (TWO_PI / ch126period) * ch126xspacing;
  ch126yvalues = new float[width*3/ch126xspacing];
}

void ch126Draw () {
  pg.beginDraw();
  ch126CalcWave();
  ch126RenderWave();
  pg.endDraw();
}

void ch126CalcWave() {
  float f = map(noise(ch126yoff), 0, 1, 0, ch126maxAmplitude);
  
  ch126yoff += 0.01; //Try different values for speed at which the amplitude changes
  
  //For every x value, calculate a y value with a sine function
  float x = negativeTheta;
  for (int i = 0; i < ch126yvalues.length; i++) {
    ch126yvalues[i] = sin(x)*f;
    x+=ch126dx;
  }
  
  negativeTheta -= 0.2;
}

void ch126RenderWave() {
  //pg.pushMatrix();

  float col = map(noise(colNoise), 0, 1, 0, 360);
  
  pg.background(col, 100, 100);
  pg.noStroke();
  
  pg.translate(width/2, -(((sqrt(sq(width)+sq(height)))/2)-(height/2)) );
  pg.rotate(PI/4);
  pg.translate(-width/2,0);
  
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch126yvalues.length; x++) {
    pg.vertex(x*ch126xspacing, ((height/2)-(7*ch126spacing))-ch126yvalues[x]);
  }
  pg.vertex(width,height*2);
  pg.vertex(0, height*2);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch126yvalues.length; x++) {
    pg.vertex(x*ch126xspacing, ((height/2)-(5*ch126spacing))+ch126yvalues[x]);
  }
  pg.vertex(width,height*2);
  pg.vertex(0, height*2);
  pg.endShape();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch126yvalues.length; x++) {
    pg.vertex(x*ch126xspacing, ((height/2)-(3*ch126spacing))-ch126yvalues[x]);
  }
  pg.vertex(width,height*2);
  pg.vertex(0, height*2);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch126yvalues.length; x++) {
    pg.vertex(x*ch126xspacing, ((height/2)-(ch126spacing))+ch126yvalues[x]);
  }
  pg.vertex(width,height*2);
  pg.vertex(0, height*2);
  pg.endShape();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch126yvalues.length; x++) {
    pg.vertex(x*ch126xspacing, ((height/2)+(ch126spacing))-ch126yvalues[x]);
  }
  pg.vertex(width,height*2);
  pg.vertex(0, height*2);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch126yvalues.length; x++) {
    pg.vertex(x*ch126xspacing, ((height/2)+(3*ch126spacing))+ch126yvalues[x]);
  }
  pg.vertex(width,height*2);
  pg.vertex(0, height*2);
  pg.endShape();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch126yvalues.length; x++) {
    pg.vertex(x*ch126xspacing, ((height/2)+(5*ch126spacing))-ch126yvalues[x]);
  }
  pg.vertex(width,height*2);
  pg.vertex(0, height*2);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch126yvalues.length; x++) {
    pg.vertex(x*ch126xspacing, ((height/2)+(7*ch126spacing))+ch126yvalues[x]);
  }
  pg.vertex(width,height*2);
  pg.vertex(0, height*2);
  pg.endShape();
  
  //pg.popMatrix();
}
