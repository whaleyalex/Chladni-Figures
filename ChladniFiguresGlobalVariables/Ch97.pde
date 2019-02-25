//ChladniFigure97

int ch97xspacing = 2; //how far apart for horizontal locations (wave fidelity)
float ch97period; //pixels before wave repeats
float ch97dx; //Value for incrementing X, a function of period and xspacing
float[] ch97yvalues; //An array to store the height values for the wave

float ch97yoff = 0.0; //noise for the amplitude of the wave
float ch97maxAmplitude; //max height for the wave

float ch97spacing; //pixel spacing value for wave placement

void ch97Setup () {
  ch97period = width * 1.3333;
  ch97spacing = height * 0.2;
  ch97maxAmplitude = height*0.12;
  
  ch97dx = (TWO_PI / ch97period) * ch97xspacing;
  ch97yvalues = new float[width*3/ch97xspacing];
}

void ch97Draw () {
  pg.beginDraw();
  ch97CalcWave();
  ch97RenderWave();
  pg.endDraw();
}

void ch97CalcWave() {
  
  float f = map(noise(ch97yoff), 0, 1, 0, ch97maxAmplitude);
  
  ch97yoff += 0.01; //Try different values for speed at which the amplitude changes
  
  //For every x value, calculate a y value with a sine function
  float x = theta;
  for (int i = 0; i < ch97yvalues.length; i++) {
    ch97yvalues[i] = sin(x)*f;
    x+=ch97dx;
  }
  theta+=0.02;
}

void ch97RenderWave() {
  //pg.pushMatrix();
  float col = map(noise(colNoise), 0, 1, 0, 360);
  
  pg.background(col, 100, 100);
  pg.noStroke();
  
  //pg.scale(1.25);
  pg.translate(width/2, -(((sqrt(sq(width)+sq(height)))/2)-(height/2)) );
  pg.rotate(PI/4);
  pg.translate(-width/2,0);
  
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch97yvalues.length; x++) {
    pg.vertex(x*ch97xspacing, ((height/2)-(3*ch97spacing))-ch97yvalues[x]);
  }
  pg.vertex(width,height*2);
  pg.vertex(0, height*2);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch97yvalues.length; x++) {
    pg.vertex(x*ch97xspacing, ((height/2)-ch97spacing)+ch97yvalues[x]);
  }
  pg.vertex(width,height*2);
  pg.vertex(0, height*2);
  pg.endShape();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch97yvalues.length; x++) {
    pg.vertex(x*ch97xspacing, ((height/2)+ch97spacing)-ch97yvalues[x]);
  }
  pg.vertex(width,height*2);
  pg.vertex(0, height*2);
  pg.endShape();
  
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch97yvalues.length; x++) {
    pg.vertex(x*ch97xspacing, ((height/2)+(3*ch97spacing))+ch97yvalues[x]);
  }
  pg.vertex(width,height*2);
  pg.vertex(0, height*2);
  pg.endShape();

  //pg.popMatrix();
}
