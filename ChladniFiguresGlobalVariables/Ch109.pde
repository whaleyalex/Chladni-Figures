//ChladniFigure109

float ch109maxDisplacement; //max number of pixels for shifting lines positive and negative;

float ch109y1,ch109y2,ch109y3,ch109y4;

void ch109Setup () {
  ch109y1 = height*0.125;
  ch109y2 = height*0.375;
  ch109y3 = height*0.625;
  ch109y4 = height*0.875;
  
  ch109maxDisplacement  = height * 0.1;
}

void ch109Draw () {
  pg.beginDraw();
  
  float xOffset = map(xNoise, min6, max6, -ch109maxDisplacement, ch109maxDisplacement);
  float yOffset = map(yNoise, min7, max7, -ch109maxDisplacement, ch109maxDisplacement);
  
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
}
