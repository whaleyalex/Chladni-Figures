//ChladniFiguresReworked

PGraphics pg;
int dim = 512; //dimension for width and height

int caseNum = 1;

void setup() {
  size(512, 512, P3D);
  pg = createGraphics(dim,dim);
  textureMode(NORMAL);
  
  //Setup functions for each Chladni Figure
  ch1Setup();
  ch89Setup();
  ch90Setup();
  ch94Setup();
  ch97Setup();
  ch106Setup();
  ch108Setup();
  ch115Setup();
  ch130Setup();
  ch139Setup();
    
  //frameRate(24);
}

void draw() {
  switch (caseNum) { //determines which Chladni Figure is shown for which number key is pressed
    case 1:
      ch1Draw();
    break;
    case 2:
      ch89Draw();
    break;
    case 3:
      ch90Draw();
    break;
    case 4:
      ch94Draw();
    break;
    case 5:
      ch139Draw();
    break;
    case 6:
      ch106Draw();
    break;
    case 7:
      ch108Draw();
    break;
    case 8:
      ch115Draw();
    break;
    case 9:
      ch130Draw();
    break;
  }
  
  beginShape();
  texture(pg);
  vertex(0,0,0,0);
  vertex(width,0,1,0);
  vertex(width,height,1,1);
  vertex(0,height,0,1);
  vertex(0,height,0,1);
  endShape(CLOSE);
}

void keyPressed() {
  if (key == '1') {
    caseNum = 1;
  }
  else if (key == '2') {
    caseNum = 2;
  }
  else if (key == '3') {
    caseNum = 3;
  }
  else if (key == '4') {
    caseNum = 4;
  }
  else if (key == '5') {
    caseNum = 5;
  }
  else if (key == '6') {
    caseNum = 6;
  }
  else if (key == '7') {
    caseNum = 7;
  }
  else if (key == '8') {
    caseNum = 8;
  }
  else if (key == '9') {
    caseNum = 9;
  }
}
