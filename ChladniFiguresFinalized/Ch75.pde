//ChladniFigure75

float[] ch75xvalues1 = new float[360]; //An array to store the horizontal values for the wave
float[] ch75yvalues1 = new float[360]; //An array to store the height values for the wave

float ch75maxAmplitude1; //max height for the wave
float ch75radius1;
int ch75numOfSins1;

float ch75maxDisplacement; //maxDisplacement for dimensions of ellipse in the center of the figure

void ch75Setup () {
  ch75maxAmplitude1 = heightVar*0.08;
  ch75radius1 = heightVar*0.45;
  ch75numOfSins1 = 6;
  
  ch75maxDisplacement = widthVar*0.075;
}

void ch75Draw () {
  pg.beginDraw();
  ch75CalcWave();
  ch75RenderWave();
  pg.endDraw();
}

void ch75DrawOutlines () {
  pg.beginDraw();
  ch75CalcWave();
  ch75RenderOutlines();
  pg.endDraw();
}

void ch75DrawBlue () {
  pg.beginDraw();
  ch75CalcWave();
  ch75RenderBlue();
  pg.endDraw();
}

void ch75CalcWave() {
  float f1 = map(ampNoise1, min1, max1, 0, ch75maxAmplitude1);
    
  for (int i = 0; i < 360; i++) {
    ch75xvalues1[i] = (ch75radius1+(f1*(-cos(ch75numOfSins1*radians(i)))))*cos(radians(i));
    ch75yvalues1[i] = (ch75radius1+(f1*(-cos(ch75numOfSins1*radians(i)))))*sin(radians(i));
  }
}

void ch75RenderWave() {
  pg.fill(col, 100, 100);
  pg.noStroke();
  
  pg.rect(0,0,widthVar,heightVar);
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch75yvalues1.length; x++) {
    pg.curveVertex(ch75xvalues1[x]+(widthVar/2),ch75yvalues1[x]+(heightVar/2));
  }
  pg.curveVertex(ch75xvalues1[0]+(widthVar/2), ch75yvalues1[0]+(heightVar/2));
  pg.endShape();
  
  float xoff = map(xNoise, min6, max6, -ch75maxDisplacement, ch75maxDisplacement);
  float yoff = map(yNoise, min7, max7, -ch75maxDisplacement, ch75maxDisplacement);
  
  pg.fill(col, 100, 100);
  pg.ellipse(widthVar/2,heightVar/2,(widthVar*0.4)+xoff,(heightVar*0.5)+yoff);
  
  //circle.disableStyle();
  //pg.fill(oppCol, 70, 75);
  //pg.shape(circle,0,0,widthVar,heightVar);
}

void ch75RenderOutlines() {
  pg.stroke(col, 100, 100);
  pg.strokeWeight(widthVar/100);
  pg.noFill();
  //pg.rect(0,0,widthVar,heightVar);
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch75yvalues1.length; x++) {
    pg.curveVertex(ch75xvalues1[x]+(widthVar/2),ch75yvalues1[x]+(heightVar/2));
  }
  pg.curveVertex(ch75xvalues1[0]+(widthVar/2), ch75yvalues1[0]+(heightVar/2));
  pg.endShape();
  
  float xoff = map(xNoise, min6, max6, -ch75maxDisplacement, ch75maxDisplacement);
  float yoff = map(yNoise, min7, max7, -ch75maxDisplacement, ch75maxDisplacement);
  
  pg.stroke(col, 100, 100);
  pg.ellipse(widthVar/2,heightVar/2,(widthVar*0.4)+xoff,(heightVar*0.5)+yoff); 
}

void ch75RenderBlue() {
  pg.fill(240, 80, 70, 50);
  pg.noStroke();
  
  pg.rect(0,0,widthVar,heightVar);
  
  pg.fill(240, 80, 70, 50);
  pg.beginShape();
  for (int x = 0; x < ch75yvalues1.length; x++) {
    pg.curveVertex(ch75xvalues1[x]+(widthVar/2),ch75yvalues1[x]+(heightVar/2));
  }
  pg.curveVertex(ch75xvalues1[0]+(widthVar/2), ch75yvalues1[0]+(heightVar/2));
  pg.endShape();
  
  float xoff = map(xNoise, min6, max6, -ch75maxDisplacement, ch75maxDisplacement);
  float yoff = map(yNoise, min7, max7, -ch75maxDisplacement, ch75maxDisplacement);
  
  pg.fill(240, 80, 70, 50);
  pg.ellipse(widthVar/2,heightVar/2,(widthVar*0.4)+xoff,(heightVar*0.5)+yoff);
  
  //circle.disableStyle();
  //pg.fill(oppCol, 70, 75);
  //pg.shape(circle,0,0,widthVar,heightVar);
}
