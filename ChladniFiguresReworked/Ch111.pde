//ChladniFigure111

float ch111colNoise = 0.1;
float ch111xNoise = 0.1;
float ch111yNoise = 0.2;

float ch111maxDisplacement = 20; //max number of pixels for shifting lines positive and negative;

float ch111x1,ch111x2,ch111x3;
float ch111y1,ch111y2,ch111y3;

void ch111Setup () {
  ch111x1 = width*0.125;
  ch111x2 = width*0.5;
  ch111x3 = width*0.875;
  ch111y1 = height*0.125;
  ch111y2 = height*0.5;
  ch111y3 = height*0.875;
}

void ch111Draw () {
  pg.beginDraw();
  
  pg.colorMode(HSB,360,100,100);
  float col = map(noise(ch111colNoise), 0, 1, 240, 360);
  float oppCol = (360-col) + 240;
  
  float xOffset = map(noise(ch111xNoise), 0, 1, -ch111maxDisplacement, ch111maxDisplacement);
  float yOffset = map(noise(ch111yNoise), 0, 1, -ch111maxDisplacement, ch111maxDisplacement);
  
  //pg.background(col, 70, 75);
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
  
  ch111xNoise += 0.01;
  ch111yNoise += 0.01;
  ch111colNoise += 0.01;
}
