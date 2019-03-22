//ChladniFigure89

float ch89lowerLimit; //minDimension for the ellipse
float ch89upperLimit; //max dimension for the ellipse

void ch89Setup () {
  ch89lowerLimit = widthVar-(widthVar/2);
  ch89upperLimit = widthVar-(widthVar/10);
}

void ch89Draw () {
  pg.beginDraw();
  
  float dim = map(wNoise, min8, max8, ch89lowerLimit, ch89upperLimit);
 
  pg.fill(col, 100, 100);
  pg.noStroke();
  pg.rect(0,0,widthVar,heightVar);
  
  pg.fill(oppCol, 100, 100);
  pg.ellipse(widthVar/2, heightVar/2, dim, dim);
  
  pg.endDraw();
}

void ch89DrawOutlines () {
  pg.beginDraw();
  
  pg.stroke(col, 100, 100);
  pg.strokeWeight(widthVar/100);
  pg.noFill();
  //pg.rect(0,0,widthVar,heightVar);
  
  pg.stroke(oppCol, 100, 100);
  pg.ellipse(widthVar/2, heightVar/2, dim, dim);
  
  pg.endDraw();
}
