//ChladniFigure89

float ch89lowerLimit; //minDimension for the ellipse
float ch89upperLimit; //max dimension for the ellipse

void ch89Setup () {
  ch89lowerLimit = width-(width/2);
  ch89upperLimit = width-(width/10);
}

void ch89Draw () {
  pg.beginDraw();
  
  float dim = map(wNoise, min8, max8, ch89lowerLimit, ch89upperLimit);
 
  pg.background(col, 100, 100);
  pg.noStroke();
  
  pg.fill(oppCol, 100, 100);
  pg.ellipse(width/2, height/2, dim, dim);
  
  pg.endDraw();
}
