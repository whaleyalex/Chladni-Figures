//ChladniFiguresReworked

PGraphics pg;
int dim = 1024; //dimension for width and height

int caseNum = 1;

//Constants for Gradient
int Y_AXIS = 1;
int X_AXIS = 2;
color c1, c2;

void setup() {
  size(1024, 1024, P3D);
  pg = createGraphics(dim,dim);
  textureMode(NORMAL);
  
  //Setup functions for each Chladni Figure
  ch1Setup();
  ch67Setup();
  ch89Setup();
  ch90Setup();
  ch94Setup();
  ch97Setup();
  ch106Setup();
  ch108Setup();
  ch109Setup();
  ch111Setup();
  ch115Setup();
  ch119Setup();
  ch130Setup();
  ch136Setup();
  ch139Setup();
  ch141Setup();
  
  c1 = color(255, 0, 0);
  c2 = color(0, 0, 255);
    
  //frameRate(24);
}

void draw() {
  switch (caseNum) { //determines which Chladni Figure is shown for which number key is pressed
    case 1:
      ch90Draw();
    break;
    case 2:
      ch94Draw();
    break;
    case 3:
      ch97Draw();
    break;
    case 4:
      ch106Draw();
    break;
    case 5:
      ch108Draw();
    break;
    case 6:
      ch115Draw();
    break;
    case 7:
      ch130Draw();
    break;
    case 8:
      ch139Draw();
    break;
    case 9:
      ch1Draw();
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

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}
