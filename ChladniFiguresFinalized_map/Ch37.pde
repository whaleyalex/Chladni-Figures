//ChladniFigure37

float[] ch37xvalues1 = new float[360]; //An array to store the horizontal values for the wave
float[] ch37yvalues1 = new float[360]; //An array to store the height values for the wave

float[] ch37xvalues2 = new float[360]; //An array to store the horizontal values for the wave
float[] ch37yvalues2 = new float[360]; //An array to store the height values for the wave

float[] ch37xvalues3 = new float[360]; //An array to store the horizontal values for the wave
float[] ch37yvalues3 = new float[360]; //An array to store the height values for the wave

float ch37maxAmplitude1; //max height for the wave
float ch37radius1;
int ch37numOfSins1;

float ch37maxAmplitude2; //max height for the wave
float ch37radius2;
int ch37numOfSins2;

float ch37maxAmplitude3; //max height for the wave
float ch37radius3;
int ch37numOfSins3;

float ch37maxDisplacement; //maxDisplacement for dimensions of ellipse in the center of the figure

void ch37Setup () {
  ch37maxAmplitude1 = heightVar*0.08;
  ch37radius1 = heightVar*0.45;
  ch37numOfSins1 = 8;
  
  ch37maxAmplitude2 = heightVar*0.08;
  ch37radius2 = heightVar*0.3;
  ch37numOfSins2 = 8;
  
  ch37maxAmplitude3 = heightVar*0.08;
  ch37radius3 = heightVar*0.6;
  ch37numOfSins3 = 8;
  
  ch37maxDisplacement = widthVar*0.075;
}

void ch37Draw () {
  pg.beginDraw();
  ch37CalcWave();
  ch37RenderWave();
  pg.endDraw();
}

void ch37DrawOutlines () {
  pg.beginDraw();
  ch37CalcWave();
  ch37RenderOutlines();
  pg.endDraw();
}

void ch37DrawBlue () {
  pg.beginDraw();
  ch37CalcWave();
  ch37RenderBlue();
  pg.endDraw();
}

void ch37CalcWave() {
  float f1 = map(ampNoise1, min1, max1, 0, ch37maxAmplitude1);
    
  for (int i = 0; i < 360; i++) {
    ch37xvalues1[i] = (ch37radius1+(f1*(-cos(ch37numOfSins1*radians(i)))))*cos(radians(i));
    ch37yvalues1[i] = (ch37radius1+(f1*(-cos(ch37numOfSins1*radians(i)))))*sin(radians(i));
  }
  
  float f2 = map(ampNoise2, min2, max2, 0, ch37maxAmplitude2);
    
  for (int i = 0; i < 360; i++) {
    ch37xvalues2[i] = (ch37radius2+(f2*(cos(ch37numOfSins2*radians(i)))))*cos(radians(i));
    ch37yvalues2[i] = (ch37radius2+(f2*(cos(ch37numOfSins2*radians(i)))))*sin(radians(i));
  }
  
  float f3 = map(ampNoise3, min3, max3, 0, ch37maxAmplitude3);
    
  for (int i = 0; i < 360; i++) {
    ch37xvalues3[i] = (ch37radius3+(f3*(cos(ch37numOfSins3*radians(i)))))*cos(radians(i));
    ch37yvalues3[i] = (ch37radius3+(f3*(cos(ch37numOfSins3*radians(i)))))*sin(radians(i));
  }
}

void ch37RenderWave() {
  float zVar = map(noise(zNoise), 0, 1, 0, 100); //z noise not used

  pg.fill(oppCol, 100, 100);
  pg.noStroke();
    
    
  pg.pushMatrix();
  pg.translate(0,0);
  pg.rect(0,0,widthVar,heightVar);
  //pg.background(col, 100, 100);
  pg.popMatrix();
  
  
  
  pg.pushMatrix();
  pg.translate(widthVar/2,heightVar/2);
  pg.rotate(radians(rot));
  //pg.scale(map(scaleNoise,0,1,0.75,1.1)); //because of how scale works, the scale can change differently depending on the previous scale
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch37yvalues3.length; x++) {
    pg.curveVertex(ch37xvalues3[x],ch37yvalues3[x]);
  }
  pg.curveVertex(ch37xvalues3[0], ch37yvalues3[0]);
  pg.endShape();
    
  pg.popMatrix(); 
    
    
  pg.pushMatrix();
  pg.translate(widthVar/2,heightVar/2);
  pg.rotate(radians(rot)*0.25);
  //pg.scale(map(scaleNoise,0,1,0.75,1.1)); //because of how scale works, the scale can change differently depending on the previous scale
  
  pg.fill(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch37yvalues1.length; x++) {
    pg.curveVertex(ch37xvalues1[x],ch37yvalues1[x]);
  }
  pg.curveVertex(ch37xvalues1[0], ch37yvalues1[0]);
  pg.endShape();
    
  pg.popMatrix();
    
    
  pg.pushMatrix();
  pg.translate(widthVar/2,heightVar/2);
  pg.rotate(radians(rot*0.5));
    
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch37yvalues2.length; x++) {
    pg.curveVertex(ch37xvalues2[x],ch37yvalues2[x]);
  }
  pg.curveVertex(ch37xvalues2[0], ch37yvalues2[0]);
  pg.endShape();
    
  pg.popMatrix();
  
  
  float xoff = map(xNoise, min6, max6, -ch37maxDisplacement, ch37maxDisplacement);
  float yoff = map(yNoise, min7, max7, -ch37maxDisplacement, ch37maxDisplacement);
  
  pg.pushMatrix();
  pg.translate(widthVar/2,heightVar/2);
  
  pg.fill(oppCol, 100, 100);
  pg.ellipse(0,0,(widthVar*0.333)+xoff,(heightVar*0.333)+yoff);
  
  pg.popMatrix();
  
  //circle.disableStyle();
  //pg.fill(col, 70, 75);
  //pg.shape(circle,0,0,widthVar,heightVar);
  
}

void ch37RenderOutlines() {
  pg.stroke(col, 100, 100);
  pg.strokeWeight(widthVar/100);
  pg.noFill();
  pg.rect(0,0,widthVar,heightVar);
    
  pg.pushMatrix();
  //pg.translate(0,0);
  pg.rect(0,0,widthVar,heightVar);
  //pg.background(col, 100, 100);
  pg.popMatrix();
    
  pg.pushMatrix();
  pg.translate(widthVar/2,heightVar/2);
  pg.rotate(radians(rot));
  //pg.scale(map(scaleNoise,0,1,0.75,1.1)); //because of how scale works, the scale can change differently depending on the previous scale
  
  pg.stroke(oppCol, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch37yvalues1.length; x++) {
    pg.curveVertex(ch37xvalues1[x],ch37yvalues1[x]);
  }
  pg.curveVertex(ch37xvalues1[0], ch37yvalues1[0]);
  pg.endShape();
    
  pg.popMatrix();
    
  pg.pushMatrix();
  pg.translate(widthVar/2,heightVar/2);
  pg.rotate(radians(rot*0.5));
    
  pg.stroke(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch37yvalues2.length; x++) {
    pg.curveVertex(ch37xvalues2[x],ch37yvalues2[x]);
  }
  pg.curveVertex(ch37xvalues2[0], ch37yvalues2[0]);
  pg.endShape();
    
  pg.popMatrix();
  
  float xoff = map(xNoise, min6, max6, -ch37maxDisplacement, ch37maxDisplacement);
  float yoff = map(yNoise, min7, max7, -ch37maxDisplacement, ch37maxDisplacement);
  
  pg.pushMatrix();
  pg.translate(widthVar/2,heightVar/2);
  
  pg.stroke(oppCol, 100, 100);
  pg.ellipse(0,0,(widthVar*0.333)+xoff,(heightVar*0.333)+yoff);
  
  pg.popMatrix();
}

void ch37RenderBlue() {
  //float zVar = map(noise(zNoise), 0, 1, 0, 100); //z noise not used
  
  pg.noStroke();
  
  pg.pushMatrix();
  pg.translate(width/2,height/2);
  pg.rotate(radians(rot));
  //pg.scale(map(scaleNoise,0,1,0.75,1.1)); //because of how scale works, the scale can change differently depending on the previous scale
  
  pg.fill(blue);
  pg.beginShape();
  for (int x = 0; x < ch37yvalues3.length; x++) {
    pg.curveVertex(ch37xvalues3[x],ch37yvalues3[x]);
  }
  pg.curveVertex(ch37xvalues3[0], ch37yvalues3[0]);
  pg.endShape();
    
  pg.popMatrix(); 
    
    
  pg.pushMatrix();
  pg.translate(width/2,height/2);
  pg.rotate(radians(rot)*0.25);
  //pg.scale(map(scaleNoise,0,1,0.75,1.1)); //because of how scale works, the scale can change differently depending on the previous scale
  
  pg.fill(blue);
  pg.beginShape();
  for (int x = 0; x < ch37yvalues1.length; x++) {
    pg.curveVertex(ch37xvalues1[x],ch37yvalues1[x]);
  }
  pg.curveVertex(ch37xvalues1[0], ch37yvalues1[0]);
  pg.endShape();
    
  pg.popMatrix();
    
    
  pg.pushMatrix();
  pg.translate(width/2,height/2);
  pg.rotate(radians(rot*0.5));
    
  pg.fill(blue);
  pg.beginShape();
  for (int x = 0; x < ch37yvalues2.length; x++) {
    pg.curveVertex(ch37xvalues2[x],ch37yvalues2[x]);
  }
  pg.curveVertex(ch37xvalues2[0], ch37yvalues2[0]);
  pg.endShape();
    
  pg.popMatrix();
  
  
  float xoff = map(xNoise, min6, max6, -ch37maxDisplacement, ch37maxDisplacement);
  float yoff = map(yNoise, min7, max7, -ch37maxDisplacement, ch37maxDisplacement);
  
  pg.pushMatrix();
  pg.translate(width/2,height/2);
  
  pg.fill(blue);
  pg.ellipse(0,0,(width*0.333)+xoff,(height*0.333)+yoff);
  
  pg.popMatrix();
}