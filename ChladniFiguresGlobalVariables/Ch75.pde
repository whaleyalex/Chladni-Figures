//ChladniFigure75

float[] ch75xvalues1 = new float[360]; //An array to store the horizontal values for the wave
float[] ch75yvalues1 = new float[360]; //An array to store the height values for the wave

float ch75yoff1 = 0.0; //noise for the amplitude of the wave
float ch75maxAmplitude1; //max height for the wave
float ch75radius1;
int ch75numOfSins1;

float ch75xoffCirc = 0.3; //noise for the x dimension of the ellipse
float ch75yoffCirc = 0.4; //noise for the y dimension of the ellipse
float ch75maxDisplacement; //maxDisplacement for dimensions of ellipse in the center of the figure

void ch75Setup () {
  ch75maxAmplitude1 = height*0.06;
  ch75radius1 = height*0.45;
  ch75numOfSins1 = 6;
  
  ch75maxDisplacement = width*0.075;
}

void ch75Draw () {
  pg.beginDraw();
  ch75CalcWave();
  ch75RenderWave();
  pg.endDraw();
}

void ch75CalcWave() {
  float f1 = map(noise(ch75yoff1), 0, 1, 0, ch75maxAmplitude1);
  
  ch75yoff1 += 0.01; //Try different values for speed at which the amplitude changes
    
  for (int i = 0; i < 360; i++) {
    ch75xvalues1[i] = (ch75radius1+(f1*(-cos(ch75numOfSins1*radians(i)))))*cos(radians(i));
    ch75yvalues1[i] = (ch75radius1+(f1*(-cos(ch75numOfSins1*radians(i)))))*sin(radians(i));
  }
}

void ch75RenderWave() {
  float col = map(noise(colNoise), 0, 1, 0, 360);
  
  pg.background(col, 100, 100);
  pg.noStroke();
  
  pg.fill(360-col, 100, 100);
  pg.beginShape();
  for (int x = 0; x < ch75yvalues1.length; x++) {
    pg.curveVertex(ch75xvalues1[x]+(width/2),ch75yvalues1[x]+(height/2));
  }
  pg.curveVertex(ch75xvalues1[0]+(width/2), ch75yvalues1[0]+(height/2));
  pg.endShape();
  
  float xoff = map(noise(ch75xoffCirc), 0, 1, -ch75maxDisplacement, ch75maxDisplacement);
  float yoff = map(noise(ch75yoffCirc), 0, 1, -ch75maxDisplacement, ch75maxDisplacement);
  
  pg.fill(col, 100, 100);
  pg.ellipse(width/2,height/2,(width*0.4)+xoff,(height*0.5)+yoff);
  
  circle.disableStyle();
  pg.fill(360-col, 70, 75);
  pg.shape(circle,0,0,width,height);
  
  ch75xoffCirc += 0.01;
  ch75yoffCirc += 0.01;
}
