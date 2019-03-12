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

//values for the noise functions
float amp1 = 0.0;
float amp2 = 0.1;
float amp3 = 0.2;
float amp4 = 0.3;
float amp5 = 0.4;
float x1 = 0.5;
float y1 = 0.6;
float w1 = 0.7;

float z1 = 0.8; //not implemented yet
float zNoise;

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

boolean scene1 = true;
boolean scene37 = false;
boolean scene50 = false;
boolean scene62 = false;
boolean scene67 = false;
boolean scene73 = false;
boolean scene75 = false;
boolean scene89 = false;
boolean scene90 = false;
boolean scene94 = false;
boolean scene97 = false;
boolean scene106 = false;
boolean scene108 = false;
boolean scene109 = false;
boolean scene111 = false;
boolean scene113 = false;
boolean scene115 = false;
boolean scene119 = false;
boolean scene126 = false;
boolean scene130 = false;
boolean scene136 = false;
boolean scene137 = false;
boolean scene139 = false;
boolean scene141 = false;

boolean fill = true; //use outlines of filled in shapes for the figures

PShape circle; //circular PShape

void setup() {
  size(512, 512, P3D);
  pg = createGraphics(dim,dim,P3D);
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
  
  zNoise = noise(z1);
  
  //DRAW THE SELECTED FIGURES
  if (scene1) {
    if (fill) {
      ch1Draw();    
    }
    else {
      ch1DrawOutlines();  
    }
  }
  if (scene37) {
    if (fill) {
      ch37Draw();    
    }
    else {
      ch37DrawOutlines();  
    }
  }
  if (scene50) {
    if (fill) {
      ch50Draw();    
    }
    else {
      ch50DrawOutlines();  
    }
  }
  if (scene62) {
    if (fill) {
      ch62Draw();    
    }
    else {
      ch62DrawOutlines();  
    }
  }
  if (scene67) {
    if (fill) {
      ch67Draw();    
    }
    else {
      ch67DrawOutlines();  
    }
  }
  if (scene73) {
    if (fill) {
      ch73Draw();    
    }
    else {
      ch73DrawOutlines();  
    }
  }
  if (scene75) {
    if (fill) {
      ch75Draw();    
    }
    else {
      ch75DrawOutlines();  
    }
  }
  if (scene89) {
    if (fill) {
      ch89Draw();    
    }
    else {
      ch89DrawOutlines();  
    }
  }
  if (scene90) {
    if (fill) {
      ch90Draw();    
    }
    else {
      ch90DrawOutlines();  
    }
  }
  if (scene94) {
    if (fill) {
      ch94Draw();    
    }
    else {
      ch94DrawOutlines();  
    }
  }
  if (scene97) {
    if (fill) {
      ch97Draw();    
    }
    else {
      ch97DrawOutlines();  
    }
  }
  if (scene106) {
    if (fill) {
      ch106Draw();    
    }
    else {
      ch106DrawOutlines();  
    }
  }
  if (scene108) {
    if (fill) {
      ch108Draw();    
    }
    else {
      ch108DrawOutlines();  
    }
  }
  if (scene109) {
    if (fill) {
      ch109Draw();    
    }
    else {
      ch109DrawOutlines();  
    }
  }
  if (scene111) {
    if (fill) {
      ch111Draw();    
    }
    else {
      ch111DrawOutlines();  
    }
  }
  if (scene113) {
    if (fill) {
      ch113Draw();    
    }
    else {
      ch113DrawOutlines();  
    }
  }
  if (scene115) {
    if (fill) {
      ch115Draw();    
    }
    else {
      ch115DrawOutlines();  
    }
  }
  if (scene119) {
    if (fill) {
      ch119Draw();    
    }
    else {
      ch119DrawOutlines();  
    }
  }
  if (scene126) {
    if (fill) {
      ch126Draw();    
    }
    else {
      ch126DrawOutlines();  
    }
  }
  if (scene130) {
    if (fill) {
      ch130Draw();    
    }
    else {
      ch130DrawOutlines();  
    }
  }
  if (scene136) {
    if (fill) {
      ch136Draw();    
    }
    else {
      ch136DrawOutlines();  
    }
  }
  if (scene137) {
    if (fill) {
      ch137Draw();    
    }
    else {
      ch137DrawOutlines();  
    }
  }
  if (scene139) {
    if (fill) {
      ch139Draw();    
    }
    else {
      ch139DrawOutlines();  
    }
  }
  if (scene141) {
    if (fill) {
      ch141Draw();    
    }
    else {
      ch141DrawOutlines();  
    }
  }
  
  //DRAW THE MOST RECENTLY SELECTED FIGURE ON TOP
  switch (caseNum) { //determines which Chladni Figure is shown for which number key is pressed
    case 1:
      if (fill) {
        ch1Draw();
      }
      else {
        ch1DrawOutlines();  
      }
    break;  
    case 2:
      if (fill) {
        ch37Draw();
      }
      else {
        ch37DrawOutlines();  
      }
    break;
    case 3:
      if (fill) {
        ch50Draw();
      }
      else {
        ch50DrawOutlines();  
      }
    break;
    case 4:
      if (fill) {
        ch62Draw();
      }
      else {
        ch62DrawOutlines();  
      }
    break;
    case 5:
      if (fill) {
        ch67Draw();
      }
      else {
        ch67DrawOutlines();  
      }
    break;
    case 6:
      if (fill) {
        ch73Draw();
      }
      else {
        ch73DrawOutlines();  
      }
    break;
    case 7:
      if (fill) {
        ch75Draw();
      }
      else {
        ch75DrawOutlines();  
      }
    break;
    case 8:
      if (fill) {
        ch89Draw();
      }
      else {
        ch89DrawOutlines();  
      }
    break;
    case 9:
      if (fill) {
        ch90Draw();
      }
      else {
        ch90DrawOutlines();  
      }
    break;
    case 10:
      if (fill) {
        ch94Draw();
      }
      else {
        ch94DrawOutlines();  
      }
    break;
    case 11:
      if (fill) {
        ch97Draw();
      }
      else {
        ch97DrawOutlines();  
      }
    break;
    case 12:
      if (fill) {
        ch106Draw();
      }
      else {
        ch106DrawOutlines();  
      }
    break;
    case 13:
      if (fill) {
        ch108Draw();
      }
      else {
        ch108DrawOutlines();  
      }
    break;
    case 14:
      if (fill) {
        ch109Draw();
      }
      else {
        ch109DrawOutlines();  
      }
    break;
    case 15:
      if (fill) {
        ch111Draw();
      }
      else {
        ch111DrawOutlines();  
      }
    break;
    case 16:
      if (fill) {
        ch113Draw();
      }
      else {
        ch113DrawOutlines();  
      }
    break;
    case 17:
      if (fill) {
        ch115Draw();
      }
      else {
        ch115DrawOutlines();  
      }
    break;
    case 18:
      if (fill) {
        ch119Draw();
      }
      else {
        ch119DrawOutlines();  
      }
    break;
    case 19:
      if (fill) {
        ch126Draw();
      }
      else {
        ch126DrawOutlines();  
      }
    break;
    case 20:
      if (fill) {
        ch130Draw();
      }
      else {
        ch130DrawOutlines();  
      }
    break;
    case 21:
      if (fill) {
        ch136Draw();
      }
      else {
        ch136DrawOutlines();  
      }
    break;
    case 22:
      if (fill) {
        ch137Draw(); //NEEDS FIXED
      }
      else {
        ch137Draw();//REPLACE WHEN FIXED
        //ch137DrawOutlines();  
      }
    break;
    case 23:
      if (fill) {
        ch139Draw();
      }
      else {
        ch139DrawOutlines();  
      }
    break;
    case 24:
      if (fill) {
        ch141Draw();
      }
      else {
        ch141DrawOutlines();  
      }
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
  
  z1++; //not implemented yet
  
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
    scene1 = !scene1;
    if (scene1) { caseNum = 1; }
  }
  else if (key == '2') {
    scene37 = !scene37;
    if (scene37) { caseNum = 2; }
  }
  else if (key == '3') {
    scene50 = !scene50;
    if (scene50) { caseNum = 3; }
  }
  else if (key == '4') {
    scene62 = !scene62;
    if (scene62) { caseNum = 4; }
  }
  else if (key == '5') {
    scene67 = !scene67;
    if (scene67) { caseNum = 5; }
  }
  else if (key == '6') {
    scene73 = !scene73;
    if (scene73) { caseNum = 6; }
  }
  else if (key == '7') {
    scene75 = !scene75;
    if (scene75) { caseNum = 7; }
  }
  else if (key == '8') {
    scene89 = !scene89;
    if (scene89) { caseNum = 8; }
  }
  else if (key == '9') {
    scene90 = !scene90;
    if (scene90) { caseNum = 9; }
  }
  else if (key == '0') {
    scene94 = !scene94;
    if (scene94) { caseNum = 10; }
  }
  else if (key == 'q') {
    scene97 = !scene97;
    if (scene97) { caseNum = 11; }
  }
  else if (key == 'w') {
    scene106 = !scene106;
    if (scene106) { caseNum = 12; }
  }
  else if (key == 'e') {
    scene108 = !scene108;
    if (scene108) { caseNum = 13; }
  }
  else if (key == 'r') {
    scene109 = !scene109;
    if (scene109) { caseNum = 14; }
  }
  else if (key == 't') {
    scene111 = !scene111;
    if (scene111) { caseNum = 15; }
  }
  else if (key == 'y') {
    scene113 = !scene113;
    if (scene113) { caseNum = 16; }
  }
  else if (key == 'u') {
    scene115 = !scene115;
    if (scene115) { caseNum = 17; }
  }
  else if (key == 'i') {
    scene119 = !scene119;
    if (scene119) { caseNum = 18; }
  }
  else if (key == 'o') {
    scene126 = !scene126;
    if (scene126) { caseNum = 19; }
  }
  else if (key == 'p') {
    scene130 = !scene130;
    if (scene130) { caseNum = 20; }
  }
  else if (key == 'a') {
    scene136 = !scene136;
    if (scene136) { caseNum = 21; }
  }
  else if (key == 's') {
    scene137 = !scene137;
    if (scene137) { caseNum = 22; }
  }
  else if (key == 'd') {
    scene139 = !scene139;
    if (scene139) { caseNum = 23; }
  }
  else if (key == 'f') {
    scene141 = !scene141;
    if (scene141) { caseNum = 24; }
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
  else if (key == 'k') {
    fill = true;  
  }
  else if (key == 'l') {
    fill = false;
  }
}
