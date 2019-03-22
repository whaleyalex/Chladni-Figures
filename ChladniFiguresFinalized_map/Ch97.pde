//ChladniFigure97

int ch97xspacing = 2; //how far apart for horizontal locations (wave fidelity)
float ch97period; //pixels before wave repeats
float ch97dx; //Value for incrementing X, a function of period and xspacing
float[] ch97yvalues; //An array to store the height values for the wave

float ch97maxAmplitude; //max height for the wave

float ch97spacing; //pixel spacing value for wave placement

void ch97Setup () {
  ch97period = widthVar * 1.3333;
  ch97spacing = heightVar * 0.2;
  ch97maxAmplitude = heightVar*0.2;
  
  ch97dx = (TWO_PI / ch97period) * ch97xspacing;
  ch97yvalues = new float[widthVar*3/ch97xspacing];
}

void ch97Draw () {
  pg.beginDraw();
  ch97CalcWave();
  ch97RenderWave();
  pg.endDraw();
}

void ch97DrawOutlines () {
  pg.beginDraw();
  ch97CalcWave();
  ch97RenderOutlines();
  pg.endDraw();
}

void ch97CalcWave() {  
  float f = map(ampNoise1, min1, max1, 0, ch97maxAmplitude);
  
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
  pg.fill(col, 100, 100);
  pg.noStroke();
  pg.rect(0,0,widthVar,heightVar);
  
  //pg.scale(1.25);
  pg.translate(widthVar/2, -(((sqrt(sq(widthVar)+sq(heightVar)))/2)-(heightVar/2)) );
  pg.rotate(PI/4);
  pg.translate(-widthVar/2,0);
  
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch97yvalues.length; x++) {
    pg.vertex(x*ch97xspacing, ((heightVar/2)-(3*ch97spacing))-ch97yvalues[x]);
  }
  pg.vertex(widthVar,heightVar*2);
  pg.vertex(0, heightVar*2);
  pg.endShape();
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch97yvalues.length; x++) {
    pg.vertex(x*ch97xspacing, ((heightVar/2)-ch97spacing)+ch97yvalues[x]);
  }
  pg.vertex(widthVar,heightVar*2);
  pg.vertex(0, heightVar*2);
  pg.endShape();
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch97yvalues.length; x++) {
    pg.vertex(x*ch97xspacing, ((heightVar/2)+ch97spacing)-ch97yvalues[x]);
  }
  pg.vertex(widthVar,heightVar*2);
  pg.vertex(0, heightVar*2);
  pg.endShape();
  
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch97yvalues.length; x++) {
    pg.vertex(x*ch97xspacing, ((heightVar/2)+(3*ch97spacing))+ch97yvalues[x]);
  }
  pg.vertex(widthVar,heightVar*2);
  pg.vertex(0, heightVar*2);
  pg.endShape();

  //pg.popMatrix();
}

void ch97RenderOutlines() {
  pg.stroke(col, 100, 100);
  pg.strokeWeight(widthVar/100);
  pg.noFill();
  //pg.rect(0,0,widthVar,heightVar);
  
  pg.translate(widthVar/2, -(((sqrt(sq(widthVar)+sq(heightVar)))/2)-(heightVar/2)) );
  pg.rotate(PI/4);
  pg.translate(-widthVar/2,0);
  
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch97yvalues.length; x++) {
    pg.vertex(x*ch97xspacing, ((heightVar/2)-(3*ch97spacing))-ch97yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar*2);
  //pg.vertex(0, heightVar*2);
  pg.endShape();
  
  pg.stroke(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch97yvalues.length; x++) {
    pg.vertex(x*ch97xspacing, ((heightVar/2)-ch97spacing)+ch97yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar*2);
  //pg.vertex(0, heightVar*2);
  pg.endShape();
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch97yvalues.length; x++) {
    pg.vertex(x*ch97xspacing, ((heightVar/2)+ch97spacing)-ch97yvalues[x]);
  }
  //pg.vertex(widthVar,heightVar*2);
  //pg.vertex(0, heightVar*2);
  pg.endShape();
  
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch97yvalues.length; x++) {
    pg.vertex(x*ch97xspacing, ((heightVar/2)+(3*ch97spacing))+ch97yvalues[x]);
  }
  pg.vertex(widthVar,heightVar*2);
  pg.vertex(0, heightVar*2);
  pg.endShape();
}