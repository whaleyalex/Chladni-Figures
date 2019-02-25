//ChladniFigure109

float ch109xNoise = 0.1;
float ch109yNoise = 0.2;

float ch109maxDisplacement = 20; //max number of pixels for shifting lines positive and negative;

float ch109y1,ch109y2,ch109y3,ch109y4;

void ch109Setup () {
  ch109y1 = height*0.125;
  ch109y2 = height*0.375;
  ch109y3 = height*0.625;
  ch109y4 = height*0.875;
}

void ch109Draw () {
  pg.beginDraw();
  
  float col = map(noise(colNoise), 0, 1, 240, 360);
  float oppCol = (360-col) + 240;
  
  float xOffset = map(noise(ch109xNoise), 0, 1, -ch109maxDisplacement, ch109maxDisplacement);
  float yOffset = map(noise(ch109yNoise), 0, 1, -ch109maxDisplacement, ch109maxDisplacement);
  
  //pg.background(col, 70, 75);
  pg.noStroke();
  
  pg.fill(col, 70, 75);
  pg.rect(0,0,(width/2)+xOffset,(ch109y1)+yOffset);
  
  pg.fill(oppCol, 70, 75);
  pg.rect((width/2)+xOffset,0,width-((width/2)+xOffset),(ch109y1)+yOffset);
  
  
  pg.fill(oppCol, 70, 75);
  pg.rect(0,ch109y1+yOffset,(width/2)+xOffset,height*0.25);
  
  pg.fill(col, 70, 75);
  pg.rect((width/2)+xOffset,ch109y1+yOffset,width-((width/2)+xOffset),height*0.25);
  
  
  pg.fill(col, 70, 75);
  pg.rect(0,ch109y2+yOffset,(width/2)+xOffset,height*0.25);
  
  pg.fill(oppCol, 70, 75);
  pg.rect((width/2)+xOffset,ch109y2+yOffset,width-((width/2)+xOffset),height*0.25);
  
  
  pg.fill(oppCol, 70, 75);
  pg.rect(0,ch109y3+yOffset,(width/2)+xOffset,height*0.25);
  
  pg.fill(col, 70, 75);
  pg.rect((width/2)+xOffset,ch109y3+yOffset,width-((width/2)+xOffset),height*0.25);
  
  
  pg.fill(col, 70, 75);
  pg.rect(0,ch109y4+yOffset,(width/2)+xOffset,height-(ch109y4+yOffset));
  
  pg.fill(oppCol, 70, 75);
  pg.rect((width/2)+xOffset,ch109y4+yOffset,width-((width/2)+xOffset),height-(ch109y4+yOffset));
  
  
  
  pg.endDraw();
  
  ch109xNoise += 0.01;
  ch109yNoise += 0.01;
}
