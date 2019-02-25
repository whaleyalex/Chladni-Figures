//ChladniFigure119

float ch119xNoise = 0.1;
float ch119yNoise = 0.2;
float ch119wNoise = 0.3; //noise for width of the ellipses

float ch119maxDisplacement = 20; //max number of pixels for shifting lines positive and negative, and width of the ellipses
float ch119widthDisplacement = 30; //max number of pixels for shifting width of the ellipses

void ch119Setup () {
  
}

void ch119Draw () {
  pg.beginDraw();
  
  float col = map(noise(colNoise), 0, 1, 240, 360);
  float oppCol = (360-col) + 240;
  
  float xOffset = map(noise(ch119xNoise), 0, 1, -ch119maxDisplacement, ch119maxDisplacement);
  float yOffset = map(noise(ch119yNoise), 0, 1, -ch119maxDisplacement, ch119maxDisplacement);
  float wOffset = map(noise(ch119wNoise), 0, 1, -ch119widthDisplacement, ch119widthDisplacement);
  
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
  
  ch119xNoise += 0.01;
  ch119yNoise += 0.01;
  ch119wNoise += 0.03;
}
