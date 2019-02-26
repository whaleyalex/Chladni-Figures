//ChladniFigure37

float[] ch37xvalues1 = new float[360]; //An array to store the horizontal values for the wave
float[] ch37yvalues1 = new float[360]; //An array to store the height values for the wave

float[] ch37xvalues2 = new float[360]; //An array to store the horizontal values for the wave
float[] ch37yvalues2 = new float[360]; //An array to store the height values for the wave

float ch37yoff1 = 0.0; //noise for the amplitude of the wave
float ch37maxAmplitude1; //max height for the wave
float ch37radius1;
int ch37numOfSins1;

float ch37yoff2 = 0.1; //noise for the amplitude of the wave
float ch37maxAmplitude2; //max height for the wave
float ch37radius2;
int ch37numOfSins2;

float ch37xoffCirc = 0.3; //noise for the x dimension of the ellipse
float ch37yoffCirc = 0.4; //noise for the y dimension of the ellipse
float ch37maxDisplacement; //maxDisplacement for dimensions of ellipse in the center of the figure

void ch37Setup () {
  ch37maxAmplitude1 = height*0.05;
  ch37radius1 = height*0.45;
  ch37numOfSins1 = 8;
  
  ch37maxAmplitude2 = height*0.03;
  ch37radius2 = height*0.3;
  ch37numOfSins2 = 8;
  
  ch37maxDisplacement = width*0.075;
}

void ch37Draw () {
  pg.beginDraw();
  ch37CalcWave();
  ch37RenderWave();
  pg.endDraw();
}

void ch37CalcWave() {
  float f1 = map(noise(ch37yoff1), 0, 1, 0, ch37maxAmplitude1);
  
  ch37yoff1 += 0.01; //Try different values for speed at which the amplitude changes
    
  for (int i = 0; i < 360; i++) {
    ch37xvalues1[i] = (ch37radius1+(f1*(-cos(ch37numOfSins1*radians(i)))))*cos(radians(i));
    ch37yvalues1[i] = (ch37radius1+(f1*(-cos(ch37numOfSins1*radians(i)))))*sin(radians(i));
  }
  
  float f2 = map(noise(ch37yoff2), 0, 1, 0, ch37maxAmplitude2);
  
  ch37yoff2 += 0.01; //Try different values for speed at which the amplitude changes
    
  for (int i = 0; i < 360; i++) {
    ch37xvalues2[i] = (ch37radius2+(f2*(cos(ch37numOfSins2*radians(i)))))*cos(radians(i));
    ch37yvalues2[i] = (ch37radius2+(f2*(cos(ch37numOfSins2*radians(i)))))*sin(radians(i));
  }
}

void ch37RenderWave() {
  float col = map(noise(colNoise), 0, 1, 0, 360);
  //float zVar = map(noise(zNoise), 0, 1, -30, 30);
  
  pg.background(col, 100, 100);
  pg.noStroke();
  
  pg.pushMatrix();
  pg.translate(width/2,height/2);
  pg.rotate(radians(rot));
  //pg.scale(map(scaleNoise,0,1,0.75,1.1)); //because of how scale works, the scale can change differently depending on the previous scale
  
  pg.fill(360-col, 100, 100);
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
  
  pg.fill(col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch37yvalues2.length; x++) {
    pg.curveVertex(ch37xvalues2[x],ch37yvalues2[x]);
  }
  pg.curveVertex(ch37xvalues2[0], ch37yvalues2[0]);
  pg.endShape();
  
  pg.popMatrix();
  
  float xoff = map(noise(ch37xoffCirc), 0, 1, -ch37maxDisplacement, ch37maxDisplacement);
  float yoff = map(noise(ch37yoffCirc), 0, 1, -ch37maxDisplacement, ch37maxDisplacement);
  
  pg.pushMatrix();
  pg.translate(width/2,height/2);
  
  pg.fill(360-col, 100, 100);
  pg.ellipse(0,0,(width*0.333)+xoff,(height*0.333)+yoff);
  
  pg.popMatrix();
  
  circle.disableStyle();
  pg.fill(col, 70, 75);
  pg.shape(circle,0,0,width,height);
  
  ch37xoffCirc += 0.01;
  ch37yoffCirc += 0.01;
}
