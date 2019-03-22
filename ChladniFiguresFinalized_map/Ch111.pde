//ChladniFigure111

float ch111maxDisplacement; //max number of pixels for shifting lines positive and negative;

float ch111x1,ch111x2,ch111x3;
float ch111y1,ch111y2,ch111y3;

void ch111Setup () {
  ch111x1 = widthVar*0.125;
  ch111x2 = widthVar*0.5;
  ch111x3 = widthVar*0.875;
  ch111y1 = heightVar*0.125;
  ch111y2 = heightVar*0.5;
  ch111y3 = heightVar*0.875;
  
  ch111maxDisplacement = heightVar*0.15;
}

void ch111Draw () {
  pg.beginDraw();
  
  float xOffset = map(xNoise, min6, max6, -ch111maxDisplacement, ch111maxDisplacement);
  float yOffset = map(yNoise, min7, max7, -ch111maxDisplacement, ch111maxDisplacement);
  
  pg.noStroke();
  
  pg.fill(col, 100, 100);
  pg.rect(0,0,ch111x1+xOffset,ch111y1+yOffset);
  
  pg.fill(oppCol, 100, 100);
  pg.rect((ch111x1)+xOffset,0,widthVar*0.375,ch111y1+yOffset);
  
  pg.fill(col, 100, 100);
  pg.rect((ch111x2)+xOffset,0,widthVar*0.375,ch111y1+yOffset);
  
  pg.fill(oppCol, 100, 100);
  pg.rect((ch111x3)+xOffset,0,widthVar-(ch111x3+xOffset),ch111y1+yOffset);
  
  
  pg.fill(oppCol, 100, 100);
  pg.rect(0,ch111y1+yOffset,ch111x1+xOffset,heightVar*0.375);
  
  pg.fill(col, 100, 100);
  pg.rect((ch111x1)+xOffset,ch111y1+yOffset,widthVar*0.375,heightVar*0.375);
  
  pg.fill(oppCol, 100, 100);
  pg.rect((ch111x2)+xOffset,ch111y1+yOffset,widthVar*0.375,heightVar*0.375);
  
  pg.fill(col, 100, 100);
  pg.rect((ch111x3)+xOffset,ch111y1+yOffset,widthVar-(ch111x3+xOffset),heightVar*0.375);
  
  
  pg.fill(col, 100, 100);
  pg.rect(0,ch111y2+yOffset,ch111x1+xOffset,heightVar*0.375);
  
  pg.fill(oppCol, 100, 100);
  pg.rect((ch111x1)+xOffset,ch111y2+yOffset,widthVar*0.375,heightVar*0.375);
  
  pg.fill(col, 100, 100);
  pg.rect((ch111x2)+xOffset,ch111y2+yOffset,widthVar*0.375,heightVar*0.375);
  
  pg.fill(oppCol, 100, 100);
  pg.rect((ch111x3)+xOffset,ch111y2+yOffset,widthVar-(ch111x3+xOffset),heightVar*0.375); 
  
  
  pg.fill(oppCol, 100, 100);
  pg.rect(0,ch111y3+yOffset,ch111x1+xOffset,heightVar-(ch111y3+yOffset));
  
  pg.fill(col, 100, 100);
  pg.rect((ch111x1)+xOffset,ch111y3+yOffset,widthVar*0.375,heightVar-(ch111y3+yOffset));
  
  pg.fill(oppCol, 100, 100);
  pg.rect((ch111x2)+xOffset,ch111y3+yOffset,widthVar*0.375,heightVar-(ch111y3+yOffset));
  
  pg.fill(col, 100, 100);
  pg.rect((ch111x3)+xOffset,ch111y3+yOffset,widthVar-(ch111x3+xOffset),heightVar-(ch111y3+yOffset)); 
  
  
  pg.endDraw();
}

void ch111DrawOutlines () {
  pg.beginDraw();
  
  float xOffset = map(xNoise, min6, max6, -ch111maxDisplacement, ch111maxDisplacement);
  float yOffset = map(yNoise, min7, max7, -ch111maxDisplacement, ch111maxDisplacement);
  
  pg.stroke(col, 100, 100);
  pg.strokeWeight(widthVar/100);
  pg.noFill();
  
  pg.stroke(col, 100, 100);
  pg.rect(0,0,ch111x1+xOffset,ch111y1+yOffset);
  
  pg.stroke(oppCol, 100, 100);
  pg.rect((ch111x1)+xOffset,0,widthVar*0.375,ch111y1+yOffset);
  
  pg.stroke(col, 100, 100);
  pg.rect((ch111x2)+xOffset,0,widthVar*0.375,ch111y1+yOffset);
  
  pg.stroke(oppCol, 100, 100);
  pg.rect((ch111x3)+xOffset,0,widthVar-(ch111x3+xOffset),ch111y1+yOffset);
  
  
  pg.stroke(oppCol, 100, 100);
  pg.rect(0,ch111y1+yOffset,ch111x1+xOffset,heightVar*0.375);
  
  pg.stroke(col, 100, 100);
  pg.rect((ch111x1)+xOffset,ch111y1+yOffset,widthVar*0.375,heightVar*0.375);
  
  pg.stroke(oppCol, 100, 100);
  pg.rect((ch111x2)+xOffset,ch111y1+yOffset,widthVar*0.375,heightVar*0.375);
  
  pg.stroke(col, 100, 100);
  pg.rect((ch111x3)+xOffset,ch111y1+yOffset,widthVar-(ch111x3+xOffset),heightVar*0.375);
  
  
  pg.stroke(col, 100, 100);
  pg.rect(0,ch111y2+yOffset,ch111x1+xOffset,heightVar*0.375);
  
  pg.stroke(oppCol, 100, 100);
  pg.rect((ch111x1)+xOffset,ch111y2+yOffset,widthVar*0.375,heightVar*0.375);
  
  pg.stroke(col, 100, 100);
  pg.rect((ch111x2)+xOffset,ch111y2+yOffset,widthVar*0.375,heightVar*0.375);
  
  pg.stroke(oppCol, 100, 100);
  pg.rect((ch111x3)+xOffset,ch111y2+yOffset,widthVar-(ch111x3+xOffset),heightVar*0.375); 
  
  
  pg.stroke(oppCol, 100, 100);
  pg.rect(0,ch111y3+yOffset,ch111x1+xOffset,heightVar-(ch111y3+yOffset));
  
  pg.stroke(col, 100, 100);
  pg.rect((ch111x1)+xOffset,ch111y3+yOffset,widthVar*0.375,heightVar-(ch111y3+yOffset));
  
  pg.stroke(oppCol, 100, 100);
  pg.rect((ch111x2)+xOffset,ch111y3+yOffset,widthVar*0.375,heightVar-(ch111y3+yOffset));
  
  pg.stroke(col, 100, 100);
  pg.rect((ch111x3)+xOffset,ch111y3+yOffset,widthVar-(ch111x3+xOffset),heightVar-(ch111y3+yOffset));
  
  pg.endDraw();
}