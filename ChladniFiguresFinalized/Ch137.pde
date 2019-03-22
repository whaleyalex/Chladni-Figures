//ChladniFigure137

int ch137xspacing = 2; //how far apart for horizontal locations (wave fidelity)
int ch137w; //width of the wave
float ch137period; //pixels before wave repeats
float ch137dx; //Value for incrementing X, a function of period and xspacing
float[] ch137yvalues; //An array to store the height values for the wave

float ch137yoff = 0.0; //noise for the amplitude of the wave
float ch137maxAmplitude; //max height for the wave

float ch137spacing; //pixel spacing value for wave placement

float ch137maxPix; //max num pixels line moves up and down

void ch137Setup () {
  ch137period = widthVar * 0.6667;
  ch137spacing = heightVar*0.143;
  ch137maxAmplitude= heightVar*0.1;
  
  ch137maxPix = widthVar * 0.1;
  
  ch137dx = (TWO_PI / ch137period) * ch137xspacing;
  ch137yvalues = new float[widthVar/ch137xspacing];
}

void ch137Draw () {
  pg.beginDraw();
  ch137CalcWave();
  ch137RenderWave();
  pg.endDraw();
}

void ch137DrawOutlines () {
  pg.beginDraw();
  ch137CalcWave();
  ch137RenderOutlines();
  pg.endDraw();
}

void ch137CalcWave() {
  
  float f = map(noise(ch137yoff), 0, 1, 0, ch137maxAmplitude);
  
  ch137yoff += 0.01; //Try different values for speed at which the amplitude changes
  
  //For every x value, calculate a y value with a sine function
  float x = staticTheta;
  for (int i = 0; i < ch137yvalues.length; i++) {
    ch137yvalues[i] = sin(x)*f;
    x+=ch137dx;
  }
}

void ch137RenderWave() {
  pg.fill(col, 100, 100);
  pg.noStroke();
  
  pg.rect(0,0,widthVar,heightVar);
  
  float var = map(noise(wNoise), 0, 1, -ch137maxPix, ch137maxPix);
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch137yvalues.length; x++) {
    pg.vertex(x*ch137xspacing, ((heightVar/2)-(3*ch137spacing))-ch137yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch137yvalues.length; x++) {
    pg.vertex(x*ch137xspacing, ((heightVar/2)-ch137spacing)+ch137yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch137yvalues.length; x++) {
    pg.vertex(x*ch137xspacing, ((heightVar/2)+ch137spacing)-ch137yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch137yvalues.length; x++) {
    pg.vertex(x*ch137xspacing, ((heightVar/2)+(3*ch137spacing))+ch137yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
  
  //vertical rectangles
  pg.fill(360, 100, 50, 50);
  pg.beginShape();
  pg.vertex(0, 0);
  pg.vertex((widthVar*0.25)+var, 0);
  pg.vertex((widthVar*0.25)+var,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.fill(240, 100, 50, 50);
  pg.beginShape();
  pg.vertex((widthVar*0.25)+var, 0);
  pg.vertex((widthVar*0.5)+var, 0);
  pg.vertex((widthVar*0.5)+var,heightVar);
  pg.vertex((widthVar*0.25)+var, heightVar);
  pg.endShape();
  
  pg.fill(360, 100, 50, 50);
  pg.beginShape();
  pg.vertex((widthVar*0.5)+var, 0);
  pg.vertex((widthVar*0.75)+var, 0);
  pg.vertex((widthVar*0.75)+var,heightVar);
  pg.vertex((widthVar*0.5)+var, heightVar);
  pg.endShape();
  
  pg.fill(240, 100, 50, 50);
  pg.beginShape();
  pg.vertex((widthVar*0.75)+var, 0);
  pg.vertex(widthVar, 0);
  pg.vertex(widthVar,heightVar);
  pg.vertex((widthVar*0.75)+var, heightVar);
  pg.endShape();
}

void ch137RenderOutlines() {
  pg.stroke(col, 100, 100);
  pg.strokeWeight(widthVar/100);
  pg.noFill();
  
  //pg.rect(0,0,widthVar,heightVar);
  
  float var = map(noise(wNoise), 0, 1, -ch137maxPix, ch137maxPix);
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch137yvalues.length; x++) {
    pg.vertex(x*ch137xspacing, ((heightVar/2)-(3*ch137spacing))-ch137yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.stroke(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch137yvalues.length; x++) {
    pg.vertex(x*ch137xspacing, ((heightVar/2)-ch137spacing)+ch137yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch137yvalues.length; x++) {
    pg.vertex(x*ch137xspacing, ((heightVar/2)+ch137spacing)-ch137yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.stroke(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch137yvalues.length; x++) {
    pg.vertex(x*ch137xspacing, ((heightVar/2)+(3*ch137spacing))+ch137yvalues[x]);
  }
  pg.vertex(widthVar,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
  
  //vertical rectangles
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  pg.vertex(0, 0);
  pg.vertex((widthVar*0.25)+var, 0);
  pg.vertex((widthVar*0.25)+var,heightVar);
  pg.vertex(0, heightVar);
  pg.endShape();
  
  pg.stroke(col, 100, 100);
  pg.beginShape();
  pg.vertex((widthVar*0.25)+var, 0);
  pg.vertex((widthVar*0.5)+var, 0);
  pg.vertex((widthVar*0.5)+var,heightVar);
  pg.vertex((widthVar*0.25)+var, heightVar);
  pg.endShape();
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  pg.vertex((widthVar*0.5)+var, 0);
  pg.vertex((widthVar*0.75)+var, 0);
  pg.vertex((widthVar*0.75)+var,heightVar);
  pg.vertex((widthVar*0.5)+var, heightVar);
  pg.endShape();
  
  pg.stroke(col, 100, 100);
  pg.beginShape();
  pg.vertex((widthVar*0.75)+var, 0);
  pg.vertex(widthVar, 0);
  pg.vertex(widthVar,heightVar);
  pg.vertex((widthVar*0.75)+var, heightVar);
  pg.endShape();
}
