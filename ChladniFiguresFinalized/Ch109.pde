//ChladniFigure109

float ch109maxDisplacement; //max number of pixels for shifting lines positive and negative;

float ch109y1,ch109y2,ch109y3,ch109y4;

void ch109Setup () {
  ch109y1 = heightVar*0.125;
  ch109y2 = heightVar*0.375;
  ch109y3 = heightVar*0.625;
  ch109y4 = heightVar*0.875;
  
  ch109maxDisplacement  = heightVar * 0.2;
}

void ch109Draw () {
  pg.beginDraw();
  
  float xOffset = map(xNoise, min6, max6, -ch109maxDisplacement, ch109maxDisplacement);
  float yOffset = map(yNoise, min7, max7, -ch109maxDisplacement, ch109maxDisplacement);
  
  //pg.background(col, 70, 75);
  pg.noStroke();
  
  pg.fill(col, 100, 100);
  pg.rect(0,0,(widthVar/2)+xOffset,(ch109y1)+yOffset);
  
  pg.fill(oppCol, 100, 100);
  pg.rect((widthVar/2)+xOffset,0,widthVar-((widthVar/2)+xOffset),(ch109y1)+yOffset);
  
  
  pg.fill(oppCol, 100, 100);
  pg.rect(0,ch109y1+yOffset,(widthVar/2)+xOffset,heightVar*0.25);
  
  pg.fill(col, 100, 100);
  pg.rect((widthVar/2)+xOffset,ch109y1+yOffset,widthVar-((widthVar/2)+xOffset),heightVar*0.25);
  
  
  pg.fill(col, 100, 100);
  pg.rect(0,ch109y2+yOffset,(widthVar/2)+xOffset,heightVar*0.25);
  
  pg.fill(oppCol, 100, 100);
  pg.rect((widthVar/2)+xOffset,ch109y2+yOffset,widthVar-((widthVar/2)+xOffset),heightVar*0.25);
  
  
  pg.fill(oppCol, 100, 100);
  pg.rect(0,ch109y3+yOffset,(widthVar/2)+xOffset,heightVar*0.25);
  
  pg.fill(col, 100, 100);
  pg.rect((widthVar/2)+xOffset,ch109y3+yOffset,widthVar-((widthVar/2)+xOffset),heightVar*0.25);
  
  
  pg.fill(col, 100, 100);
  pg.rect(0,ch109y4+yOffset,(widthVar/2)+xOffset,heightVar-(ch109y4+yOffset));
  
  pg.fill(oppCol, 100, 100);
  pg.rect((widthVar/2)+xOffset,ch109y4+yOffset,widthVar-((widthVar/2)+xOffset),heightVar-(ch109y4+yOffset));
  
  pg.endDraw();
}

void ch109DrawOutlines () {
  pg.beginDraw();
  
  float xOffset = map(xNoise, min6, max6, -ch109maxDisplacement, ch109maxDisplacement);
  float yOffset = map(yNoise, min7, max7, -ch109maxDisplacement, ch109maxDisplacement);
  
  pg.stroke(col, 100, 100);
  pg.strokeWeight(widthVar/100);
  pg.noFill();
  //pg.rect(0,0,widthVar,heightVar);
  
  pg.rect(0,0,(widthVar/2)+xOffset,(ch109y1)+yOffset);
  
  pg.stroke(oppCol, 100, 100);
  pg.rect((widthVar/2)+xOffset,0,widthVar-((widthVar/2)+xOffset),(ch109y1)+yOffset);
  
  pg.stroke(oppCol, 100, 100);
  pg.rect(0,ch109y1+yOffset,(widthVar/2)+xOffset,heightVar*0.25);
  
  pg.stroke(col, 100, 100);
  pg.rect((widthVar/2)+xOffset,ch109y1+yOffset,widthVar-((widthVar/2)+xOffset),heightVar*0.25);
  
  pg.stroke(col, 100, 100);
  pg.rect(0,ch109y2+yOffset,(widthVar/2)+xOffset,heightVar*0.25);
  
  pg.stroke(oppCol, 100, 100);
  pg.rect((widthVar/2)+xOffset,ch109y2+yOffset,widthVar-((widthVar/2)+xOffset),heightVar*0.25);
  
  pg.stroke(oppCol, 100, 100);
  pg.rect(0,ch109y3+yOffset,(widthVar/2)+xOffset,heightVar*0.25);
  
  pg.stroke(col, 100, 100);
  pg.rect((widthVar/2)+xOffset,ch109y3+yOffset,widthVar-((widthVar/2)+xOffset),heightVar*0.25);
  
  pg.stroke(col, 100, 100);
  pg.rect(0,ch109y4+yOffset,(widthVar/2)+xOffset,heightVar-(ch109y4+yOffset));
  
  pg.stroke(oppCol, 100, 100);
  pg.rect((widthVar/2)+xOffset,ch109y4+yOffset,widthVar-((widthVar/2)+xOffset),heightVar-(ch109y4+yOffset));
  
  pg.endDraw();
}
