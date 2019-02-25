//ChladniFigure89

float ch89lowerLimit; //minDimension for the ellipse
float ch89upperLimit; //max dimension for the ellipse

float ch89dimNoise = 0.0;

void ch89Setup () {
  ch89lowerLimit = width-200;
  ch89upperLimit = width-100;
}

void ch89Draw () {
  pg.beginDraw();
  
  float col = map(noise(colNoise), 0, 1, 0, 360);
  float dim = map(noise(ch89dimNoise), 0, 1, ch89lowerLimit, ch89upperLimit);
 
  pg.background(col, 100, 100);
  pg.noStroke();
  pg.fill(360-col, 100, 100);
  pg.ellipse(width/2, height/2, dim, dim);
  
  ch89dimNoise += 0.01;
  pg.endDraw();
}
