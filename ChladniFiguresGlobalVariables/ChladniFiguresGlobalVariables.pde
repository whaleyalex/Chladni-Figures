//ChladniFiguresGlobalVariables

PGraphics pg;
int dim = 512; //dimension for width and height

int caseNum = 1; //Which Chladni figure is being drawn
float staticTheta = 0.0; //unchaging value for theta that has no movement
float theta = 0.0; //postive direction movement
float negativeTheta = 0.0; //negative direction movement;

float rot = 0; //angle of rotation

float colNoise = 0.1; //noise for color of Chladni figures
float oppCol = 0.0; //opposite value for color
float col = 0.0; //value for the color mapped
float zNoise = 0.2; //not implemented yet

//values for the noise functions
float amp1 = 0.0;
float amp2 = 0.1;
float amp3 = 0.2;
float amp4 = 0.3;
float amp5 = 0.4;
float x1 = 0.5;
float y1 = 0.6;
float w1 = 0.7;

//noise variables to be replaced with variables from audio input. Min and max values are used for mapping. Replace with min and max for input from audio.
float ampNoise1;
float min1 = 0;
float max1 = 1;
float ampNoise2;
float min2 = 0;
float max2 = 1;
float ampNoise3;
float min3 = 0;
float max3 = 1;
float ampNoise4;
float min4 = 0;
float max4 = 1;
float ampNoise5;
float min5 = 0;
float max5 = 1;
float xNoise;
float min6 = 0;
float max6 = 1;
float yNoise;
float min7 = 0;
float max7 = 1;
float wNoise;
float min8 = 0;
float max8 = 1;

PShape circle; //circular PShape

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
    
  //frameRate(24);
}

void draw() {
  pg.colorMode(HSB,360,100,100);
  col = map(noise(colNoise), 0, 1, 240, 360);
  oppCol = (360-col) + 240; //calculate the opposite value for color
  
  ampNoise1 = noise(amp1);
  ampNoise2 = noise(amp2);
  ampNoise3 = noise(amp3);
  ampNoise4 = noise(amp4);
  ampNoise5 = noise(amp5);
  xNoise = noise(x1);
  yNoise = noise(y1);
  wNoise = noise(w1);
  
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
      ch94Draw();
    break;
    case 11:
      ch97Draw();
    break;
    case 12:
      ch106Draw();
    break;
    case 13:
      ch108Draw();
    break;
    case 14:
      ch109Draw();
    break;
    case 15:
      ch111Draw();
    break;
    case 16:
      ch113Draw();
    break;
    case 17:
      ch115Draw();
    break;
    case 18:
      ch119Draw();
    break;
    case 19:
      ch126Draw();
    break;
    case 20:
      ch130Draw();
    break;
    case 21:
      ch136Draw();
    break;
    case 22:
      ch137Draw();
    break;
    case 23:
      ch139Draw();
    break;
    case 24:
      ch141Draw();
    break;
  }
  
  //Increment Noise Variables
  
  colNoise += 0.01; //increment value of noise for color
  zNoise += 0.01; //noise for z translation
  
  amp1 +=0.01;
  amp2 +=0.01;
  amp3 +=0.01;
  amp4 +=0.01;
  amp5 +=0.01;
  x1 +=0.01;
  y1 +=0.01;
  w1 +=0.01;
  
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
