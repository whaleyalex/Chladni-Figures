//ChladniFigure119

float ch119maxDisplacement; //max number of pixels for shifting lines positive and negative, and width of the ellipses
float ch119widthDisplacement; //max number of pixels for shifting width of the ellipses

void ch119Setup () {
  ch119maxDisplacement = heightVar*0.2; //max number of pixels for shifting lines positive and negative, and width of the ellipses
  ch119widthDisplacement = widthVar*0.2;
}

void ch119Draw () {
  pg.beginDraw();
  
  float xOffset = map(xNoise, min6, max6, -ch119maxDisplacement, ch119maxDisplacement);
  float yOffset = map(yNoise, min7, max7, -ch119maxDisplacement, ch119maxDisplacement);
  float wOffset = map(wNoise, min8, max8, -ch119widthDisplacement, ch119widthDisplacement);
  
  pg.noStroke();
  
  pg.fill(col, 100, 100,map(valueenv3,0,1,0,100));
  pg.rect(0,0,(widthVar/2)+xOffset,(heightVar/2)+yOffset);
  
  pg.fill(oppCol, 100, 100);
  pg.ellipse((widthVar*0.15)+xOffset, (heightVar*0.25)+yOffset, (widthVar*0.4)+wOffset, (heightVar*0.333));
  
  pg.fill(oppCol, 100, 100);
  pg.rect((widthVar/2)+xOffset,0,widthVar-((widthVar/2)+xOffset),(heightVar/2)+yOffset);
  
  pg.fill(col, 100, 100,map(valueenv3,0,1,0,100));
  pg.ellipse((widthVar*0.85)+xOffset, (heightVar*0.25)+yOffset, (widthVar*0.4)+wOffset, (heightVar*0.333));
  
  pg.fill(oppCol, 100, 100);
  pg.rect(0,(heightVar/2)+yOffset,(widthVar/2)+xOffset,heightVar-((heightVar/2)+yOffset));
  
  pg.fill(col, 100, 100,map(valueenv3,0,1,0,100));
  pg.ellipse((widthVar*0.15)+xOffset, (heightVar*0.75)+yOffset, (widthVar*0.4)+wOffset, (heightVar*0.333));
  
  pg.fill(col, 100, 100,map(valueenv3,0,1,0,100));
  pg.rect((widthVar/2)+xOffset,(heightVar/2)+yOffset,widthVar-((widthVar/2)+xOffset),heightVar-((heightVar/2)+yOffset));
  
  pg.fill(oppCol, 100, 100);
  pg.ellipse((widthVar*0.85)+xOffset, (heightVar*0.75)+yOffset, (widthVar*0.4)+wOffset, (heightVar*0.333));
  
  pg.endDraw();
}

void ch119DrawOutlines () {
  pg.beginDraw();
  
  pg.stroke(col, 100, 100);
  pg.strokeWeight(widthVar/100);
  pg.noFill();
  
  float xOffset = map(xNoise, min6, max6, -ch119maxDisplacement, ch119maxDisplacement);
  float yOffset = map(yNoise, min7, max7, -ch119maxDisplacement, ch119maxDisplacement);
  float wOffset = map(wNoise, min8, max8, -ch119widthDisplacement, ch119widthDisplacement);
  
  pg.stroke(col, 100, 100);
  pg.rect(0,0,(widthVar/2)+xOffset,(heightVar/2)+yOffset);
  
  pg.stroke(oppCol, 100, 100);
  pg.ellipse((widthVar*0.15)+xOffset, (heightVar*0.25)+yOffset, (widthVar*0.4)+wOffset, (heightVar*0.333));
  
  pg.stroke(oppCol,100, 100);
  pg.rect((widthVar/2)+xOffset,0,widthVar-((widthVar/2)+xOffset),(heightVar/2)+yOffset);
  
  pg.stroke(col, 100, 100);
  pg.ellipse((widthVar*0.85)+xOffset, (heightVar*0.25)+yOffset, (widthVar*0.4)+wOffset, (heightVar*0.333));
  
  pg.stroke(oppCol, 100, 100);
  pg.rect(0,(heightVar/2)+yOffset,(widthVar/2)+xOffset,heightVar-((heightVar/2)+yOffset));
  
  pg.stroke(col, 100, 100);
  pg.ellipse((widthVar*0.15)+xOffset, (heightVar*0.75)+yOffset, (widthVar*0.4)+wOffset, (heightVar*0.333));
  
  pg.stroke(col, 100, 100);
  pg.rect((widthVar/2)+xOffset,(heightVar/2)+yOffset,widthVar-((widthVar/2)+xOffset),heightVar-((heightVar/2)+yOffset));
  
  pg.stroke(oppCol, 100, 100);
  pg.ellipse((widthVar*0.85)+xOffset, (heightVar*0.75)+yOffset, (widthVar*0.4)+wOffset, (heightVar*0.333));
  
  pg.endDraw();
}