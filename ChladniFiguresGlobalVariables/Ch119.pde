//ChladniFigure119

float ch119maxDisplacement; //max number of pixels for shifting lines positive and negative, and width of the ellipses
float ch119widthDisplacement; //max number of pixels for shifting width of the ellipses

void ch119Setup () {
  ch119maxDisplacement = height*0.1; //max number of pixels for shifting lines positive and negative, and width of the ellipses
  ch119widthDisplacement = width*0.125;
}

void ch119Draw () {
  pg.beginDraw();
  
  float xOffset = map(xNoise, min6, max6, -ch119maxDisplacement, ch119maxDisplacement);
  float yOffset = map(yNoise, min7, max7, -ch119maxDisplacement, ch119maxDisplacement);
  float wOffset = map(wNoise, min8, max8, -ch119widthDisplacement, ch119widthDisplacement);
  
  //pg.background(col, 70, 75);
  pg.noStroke();
  
  pg.fill(col, 70, 75);
  pg.rect(0,0,(width/2)+xOffset,(height/2)+yOffset);
  
  pg.fill(oppCol, 70, 75);
  pg.ellipse((width*0.15)+xOffset, (height*0.25)+yOffset, (width*0.4)+wOffset, (height*0.333));
  
  pg.fill(oppCol, 70, 75);
  pg.rect((width/2)+xOffset,0,width-((width/2)+xOffset),(height/2)+yOffset);
  
  pg.fill(col, 70, 75);
  pg.ellipse((width*0.85)+xOffset, (height*0.25)+yOffset, (width*0.4)+wOffset, (height*0.333));
  
  pg.fill(oppCol, 70, 75);
  pg.rect(0,(height/2)+yOffset,(width/2)+xOffset,height-((height/2)+yOffset));
  
  pg.fill(col, 70, 75);
  pg.ellipse((width*0.15)+xOffset, (height*0.75)+yOffset, (width*0.4)+wOffset, (height*0.333));
  
  pg.fill(col, 70, 75);
  pg.rect((width/2)+xOffset,(height/2)+yOffset,width-((width/2)+xOffset),height-((height/2)+yOffset));
  
  pg.fill(oppCol, 70, 75);
  pg.ellipse((width*0.85)+xOffset, (height*0.75)+yOffset, (width*0.4)+wOffset, (height*0.333));
  
  pg.endDraw();
}
