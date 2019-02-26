//ChladniFiguresGlobalVariables

PGraphics pg;
int dim = 512; //dimension for width and height

int caseNum = 1; //Which Chladni figure is being drawn
float staticTheta = 0.0; //unchaging value for theta that has no movement
float theta = 0.0; //postive direction movement
float negativeTheta = 0.0; //negative direction movement;

float rot = 0; //angle of rotation

float colNoise = 0.1; //noise for color of Chladni figures
float zNoise = 0.2; //noise for scale factors

PShape circle; //circular PShape

//Constants for Gradient
int Y_AXIS = 1;
int X_AXIS = 2;
color c1, c2;

void setup() {
  size(512, 512, P3D);
  pg = createGraphics(dim,dim);
  textureMode(NORMAL);
  
  circle = loadShape("CircleHole.svg");
  
  //Setup functions for each Chladni Figure
  ch1Setup();
  ch37Setup();
  ch50Setup();
  ch62Setup();
  ch67Setup();
  ch73Setup();
  ch75Setup();
  ch89Setup();
  ch90Setup();
  ch91Setup();
  ch94Setup();
  ch97Setup();
  ch106Setup();
  ch108Setup();
  ch109Setup();
  ch111Setup();
  ch113Setup();
  ch115Setup();
  ch119Setup();
  ch126Setup();
  ch130Setup();
  ch136Setup();
  ch137Setup();
  ch139Setup();
  ch141Setup();
  
  //pg.blendMode(REPLACE);
  
  //c1 = color(255, 0, 0);
  //c2 = color(0, 0, 255);
    
  //frameRate(24);
}

void draw() {
  pg.colorMode(HSB,360,100,100);
  
  switch (caseNum) { //determines which Chladni Figure is shown for which number key is pressed
    case 1:
      ch1Draw();
    break;  
    case 2:
      ch37Draw();
    break;
    case 3:
      ch50Draw();
    break;
    case 4:
      ch62Draw();
    break;
    case 5:
      ch67Draw();
    break;
    case 6:
      ch73Draw();
    break;
    case 7:
      ch75Draw();
    break;
    case 8:
      ch89Draw();
    break;
    case 9:
      ch90Draw();
    break;
    case 10:
      ch126Draw(); //repeat REPLACE 126
    break;
    case 11:
      ch94Draw();
    break;
    case 12:
      ch97Draw();
    break;
    case 13:
      ch106Draw();
    break;
    case 14:
      ch108Draw();
    break;
    case 15:
      ch109Draw();
    break;
    case 16:
      ch111Draw();
    break;
    case 17:
      ch113Draw();
    break;
    case 18:
      ch115Draw();
    break;
    case 19:
      ch119Draw();
    break;
    case 20:
      ch126Draw();
    break;
    case 21:
      ch130Draw();
    break;
    case 22:
      ch136Draw();
    break;
    case 23:
      ch137Draw();
    break;
    case 24:
      ch139Draw();
    break;
    case 25:
      ch141Draw();
    break;
  }
  
  colNoise += 0.01; //increment value of noise for color
  zNoise += 0.01; //noise for z translation
  
  rot++;
  if (rot == 361) { //reset rotation angle
    rot = 0;
  }
  
  //PGraphics dimensions as a texture
  beginShape();
  texture(pg);
  vertex(0,0,0,0);
  vertex(width,0,1,0);
  vertex(width,height,1,1);
  vertex(0,height,0,1);
  vertex(0,height,0,1);
  endShape(CLOSE);
}

void keyPressed() { //keybinding for the Chladni figures
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
  else if (key == '0') {
    caseNum = 10;
  }
  else if (key == 'q') {
    caseNum = 11; 
  }
  else if (key == 'w') {
    caseNum = 12;
  }
  else if (key == 'e') {
    caseNum = 13;
  }
  else if (key == 'r') {
    caseNum = 14;
  }
  else if (key == 't') {
    caseNum = 15;
  }
  else if (key == 'y') {
    caseNum = 16;
  }
  else if (key == 'u') {
    caseNum = 17;
  }
  else if (key == 'i') {
    caseNum = 18;
  }
  else if (key == 'o') {
    caseNum = 19;
  }
  else if (key == 'p') {
    caseNum = 20;
  }
  else if (key == 'a') {
    caseNum = 21;
  }
  else if (key == 's') {
    caseNum = 22;
  }
  else if (key == 'd') {
    caseNum = 23;
  }
  else if (key == 'f') {
    caseNum = 24;
  }
  else if (key == 'g') {
    caseNum = 25;
  }
  else if (key == 'z') {
    pg.blendMode(REPLACE);
  }
  else if (key == 'x') {
    pg.blendMode(ADD);
  }
  else if (key == 'c') {
    pg.blendMode(SUBTRACT);
  }
  else if (key == 'v') {
    pg.blendMode(DARKEST);
  }
  else if (key == 'b') {
    pg.blendMode(LIGHTEST);
  }
  else if (key == 'n') {
    pg.blendMode(DIFFERENCE);
  }
  else if (key == 'm') {
    pg.blendMode(EXCLUSION);
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
