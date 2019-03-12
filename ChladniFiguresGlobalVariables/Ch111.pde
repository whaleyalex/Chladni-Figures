//ChladniFigure111

float ch111maxDisplacement; //max number of pixels for shifting lines positive and negative;

float ch111x1,ch111x2,ch111x3;
float ch111y1,ch111y2,ch111y3;

void ch111Setup () {
  ch111x1 = width*0.125;
  ch111x2 = width*0.5;
  ch111x3 = width*0.875;
  ch111y1 = height*0.125;
  ch111y2 = height*0.5;
  ch111y3 = height*0.875;
  
  ch111maxDisplacement = height*0.1;
}

void ch111Draw () {
  pg.beginDraw();
  
  float xOffset = map(xNoise, min6, max6, -ch111maxDisplacement, ch111maxDisplacement);
  float yOffset = map(yNoise, min7, max7, -ch111maxDisplacement, ch111maxDisplacement);
  
  pg.noStroke();
  
  pg.fill(col, 70, 75);
  pg.rect(0,0,ch111x1+xOffset,ch111y1+yOffset);
  
  pg.fill(oppCol, 70, 75);
  pg.rect((ch111x1)+xOffset,0,width*0.375,ch111y1+yOffset);
  
  pg.fill(col, 70, 75);
  pg.rect((ch111x2)+xOffset,0,width*0.375,ch111y1+yOffset);
  
  pg.fill(oppCol, 70, 75);
  pg.rect((ch111x3)+xOffset,0,width-(ch111x3+xOffset),ch111y1+yOffset);
  
  
  pg.fill(oppCol, 70, 75);
  pg.rect(0,ch111y1+yOffset,ch111x1+xOffset,height*0.375);
  
  pg.fill(col, 70, 75);
  pg.rect((ch111x1)+xOffset,ch111y1+yOffset,width*0.375,height*0.375);
  
  pg.fill(oppCol, 70, 75);
  pg.rect((ch111x2)+xOffset,ch111y1+yOffset,width*0.375,height*0.375);
  
  pg.fill(col, 70, 75);
  pg.rect((ch111x3)+xOffset,ch111y1+yOffset,width-(ch111x3+xOffset),height*0.375);
  
  
  pg.fill(col, 70, 75);
  pg.rect(0,ch111y2+yOffset,ch111x1+xOffset,height*0.375);
  
  pg.fill(oppCol, 70, 75);
  pg.rect((ch111x1)+xOffset,ch111y2+yOffset,width*0.375,height*0.375);
  
  pg.fill(col, 70, 75);
  pg.rect((ch111x2)+xOffset,ch111y2+yOffset,width*0.375,height*0.375);
  
  pg.fill(oppCol, 70, 75);
  pg.rect((ch111x3)+xOffset,ch111y2+yOffset,width-(ch111x3+xOffset),height*0.375); 
  
  
  pg.fill(oppCol, 70, 75);
  pg.rect(0,ch111y3+yOffset,ch111x1+xOffset,height-(ch111y3+yOffset));
  
  pg.fill(col, 70, 75);
  pg.rect((ch111x1)+xOffset,ch111y3+yOffset,width*0.375,height-(ch111y3+yOffset));
  
  pg.fill(oppCol, 70, 75);
  pg.rect((ch111x2)+xOffset,ch111y3+yOffset,width*0.375,height-(ch111y3+yOffset));
  
  pg.fill(col, 70, 75);
  pg.rect((ch111x3)+xOffset,ch111y3+yOffset,width-(ch111x3+xOffset),height-(ch111y3+yOffset)); 
  
  
  pg.endDraw();
}

void ch111DrawOutlines () {
  pg.beginDraw();
  
  float xOffset = map(xNoise, min6, max6, -ch111maxDisplacement, ch111maxDisplacement);
  float yOffset = map(yNoise, min7, max7, -ch111maxDisplacement, ch111maxDisplacement);
  
  pg.stroke(col, 100, 100);
  pg.strokeWeight(width/100);
  pg.noFill();
  
  pg.stroke(col, 70, 75);
  pg.rect(0,0,ch111x1+xOffset,ch111y1+yOffset);
  
  pg.stroke(oppCol, 70, 75);
  pg.rect((ch111x1)+xOffset,0,width*0.375,ch111y1+yOffset);
  
  pg.stroke(col, 70, 75);
  pg.rect((ch111x2)+xOffset,0,width*0.375,ch111y1+yOffset);
  
  pg.stroke(oppCol, 70, 75);
  pg.rect((ch111x3)+xOffset,0,width-(ch111x3+xOffset),ch111y1+yOffset);
  
  
  pg.stroke(oppCol, 70, 75);
  pg.rect(0,ch111y1+yOffset,ch111x1+xOffset,height*0.375);
  
  pg.stroke(col, 70, 75);
  pg.rect((ch111x1)+xOffset,ch111y1+yOffset,width*0.375,height*0.375);
  
  pg.stroke(oppCol, 70, 75);
  pg.rect((ch111x2)+xOffset,ch111y1+yOffset,width*0.375,height*0.375);
  
  pg.stroke(col, 70, 75);
  pg.rect((ch111x3)+xOffset,ch111y1+yOffset,width-(ch111x3+xOffset),height*0.375);
  
  
  pg.stroke(col, 70, 75);
  pg.rect(0,ch111y2+yOffset,ch111x1+xOffset,height*0.375);
  
  pg.stroke(oppCol, 70, 75);
  pg.rect((ch111x1)+xOffset,ch111y2+yOffset,width*0.375,height*0.375);
  
  pg.stroke(col, 70, 75);
  pg.rect((ch111x2)+xOffset,ch111y2+yOffset,width*0.375,height*0.375);
  
  pg.stroke(oppCol, 70, 75);
  pg.rect((ch111x3)+xOffset,ch111y2+yOffset,width-(ch111x3+xOffset),height*0.375); 
  
  
  pg.stroke(oppCol, 70, 75);
  pg.rect(0,ch111y3+yOffset,ch111x1+xOffset,height-(ch111y3+yOffset));
  
  pg.stroke(col, 70, 75);
  pg.rect((ch111x1)+xOffset,ch111y3+yOffset,width*0.375,height-(ch111y3+yOffset));
  
  pg.stroke(oppCol, 70, 75);
  pg.rect((ch111x2)+xOffset,ch111y3+yOffset,width*0.375,height-(ch111y3+yOffset));
  
  pg.stroke(col, 70, 75);
  pg.rect((ch111x3)+xOffset,ch111y3+yOffset,width-(ch111x3+xOffset),height-(ch111y3+yOffset));
  
  pg.endDraw();
}
