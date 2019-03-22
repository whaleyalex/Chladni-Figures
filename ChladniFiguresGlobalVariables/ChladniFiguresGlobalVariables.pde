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
float z1 = 0.8;

//noise variables to be replaced with variables from audio input. Min and max values are used for mapping. Replace with min and max for input from audio.
float ampNoise1; //Most important value to be mapped to audio
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
float zNoise;
float min9 = 0;
float max9 = 1;

/* //boolean toggle system
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
*/

int r1, r2, r3;
int counter = 0;

float figureNumber = 54; //number of figures to include, 49 for original figures, 54 for all

color blue;
color red;
color purple;

//boolean fill = true; //use outlines of filled in shapes for the figures

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
  
  //initialize first figures
  r1 = 2;
  r2 = (int)random(1,figureNumber);  
  r3 = (int)random(1,figureNumber);
    
  pg.colorMode(HSB,360,100,100,100);  
  //frameRate(24);
  
  blue = color(240, 80, 70, 20);
  red = color(360, 85, 70, 20);
  purple = color(280, 100, 45, 20);
}







void draw() {
  pg.colorMode(HSB,360,100,100,100);
  col = map(noise(colNoise), 0, 1, 240, 360);
  oppCol = (360-col) + 240; //calculate the opposite value for color
  
  //Initialize noise variables
  assignNoiseVariables();
  
  //Draw figures
  if (counter >= 250) {
    theta = 0.0; //postive direction movement
    negativeTheta = 0.0; //negative direction movement;
    r1 = (int)random(1,figureNumber);
    r2 = (int)random(1,figureNumber);  
    r3 = (int)random(1,figureNumber);
    counter = 0;
  }
  drawFigure(r1);
  drawFigure(r2);
  drawFigure(r3);
  counter++;
    
  //Increment Noise Variables (Comment this section out when implemented with audio input)
  incrementNoiseVariables();

  //Iterate rotation variable
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






void assignNoiseVariables() {
  //Recommended Channel 1, maybe divided
  ampNoise1 = noise(amp1);
  ampNoise2 = noise(amp2);
  ampNoise3 = noise(amp3);
  ampNoise4 = noise(amp4);
  ampNoise5 = noise(amp5);
  //Recommended Channel 2
  xNoise = noise(x1);
  yNoise = noise(y1);
  //Recommended Channel 3
  wNoise = noise(w1);
  zNoise = noise(z1);
}






void incrementNoiseVariables() {
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
  z1 +=0.01;
}





 //keyPressed for debugging
void keyPressed() { //keybinding for the Chladni figures debugging
  if (key == '1') {
    r3 = 1;
  }
  if (key == '2') {
    r3 = 2;
  }
  if (key == '3') {
    r3 = 3;
  }
  if (key == '4') {
    r3 = 4;
  }
  if (key == '5') {
    r3 = 5;
  }
  if (key == '6') {
    r3 = 6;
  }
  if (key == '7') {
    r3 = 7;
  }
  if (key == '8') {
    r3 = 8;
  }
  if (key == '9') {
    r3 = 9;
  }
  if (key == '0') {
    r3 = 10;
  }
  if (key == 'q') {
    r3 = 11;
  }
  if (key == 'w') {
    r3 = 12;
  }
  if (key == 'e') {
    r3 = 13;
  }
  if (key == 'r') {
    r3 = 14;
  }
  if (key == 't') {
    r3 = 15;
  }
  if (key == 'y') {
    r3 = 16;
  }
  if (key == 'u') {
    r3 = 17;
  }
  if (key == 'i') {
    r3 = 18;
  }
  if (key == 'o') {
    r3 = 19;
  }
  if (key == 'p') {
    r3 = 20;
  }
  if (key == 'a') {
    r3 = 21;
  }
  if (key == 's') {
    r3 = 22;
  }
  if (key == 'd') {
    r3 = 23;
  }
  if (key == 'f') {
    r3 = 24;
  }
  
  //Use g for testing
  if (key == 'g') {
    r3 = 46;
  }
  
  /* //changing blend modes
  if (key == 'z') {
    pg.blendMode(NORMAL);
  }
  if (key == 'x') {
    pg.blendMode(ADD);
  }
  if (key == 'c') {
    pg.blendMode(SUBTRACT);
  }
  if (key == 'v') {
    pg.blendMode(DARKEST);
  }
  if (key == 'b') {
    pg.blendMode(LIGHTEST);
  }
  if (key == 'n') {
    pg.blendMode(DIFFERENCE);
  }
  if (key == 'm') {
    pg.blendMode(EXCLUSION);
  }
  */
  
  /* //fill using booleans outdated
  if (key == 'k') {
    fill = true;  
  }
  if (key == 'l') {
    fill = false;
  }
  */
}







void drawFigure(int caseNumber) { 
  switch (caseNumber) { //switch statement to determine which Chladni figure to draw
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
    case 25:
      ch1DrawOutlines();
    break;
    case 26:
      ch37DrawOutlines();
    break;
    case 27:
      ch50DrawOutlines();
    break;
    case 28:
      ch62DrawOutlines();
    break;
    case 29:
      ch67DrawOutlines();
    break;
    case 30:
      ch73DrawOutlines();
    break;
    case 31:
      ch75DrawOutlines();
    break;
    case 32:
      ch89DrawOutlines();
    break;
    case 33:
      ch90DrawOutlines();
    break;
    case 34:
      ch94DrawOutlines();
    break;
    case 35:
      ch97DrawOutlines();
    break;
    case 36:
      ch106DrawOutlines();
    break;
    case 37:
      ch108DrawOutlines();
    break;
    case 38:
      ch109DrawOutlines();
    break;
    case 39:
      ch111DrawOutlines();
    break;
    case 40:
      ch113DrawOutlines();
    break;
    case 41:
      ch115DrawOutlines();
    break;
    case 42:
      ch119DrawOutlines();
    break;
    case 43:
      ch126DrawOutlines();
    break;
    case 44:
      ch130DrawOutlines();
    break;
    case 45:
      ch136DrawOutlines();
    break;
    case 46:
      ch137DrawOutlines();
    break;
    case 47:
      ch139DrawOutlines();
    break;
    case 48: //49 for original figures
      ch141DrawOutlines();
    break; 
    case 49:
      ch37DrawBlue();
    break;
    case 50:
      ch50DrawRed();
    break;
    case 51:
      ch62DrawPurple();
    break;
    case 52:
      ch75DrawBlue();
    break;
    case 53:
      ch113DrawRed();
    break;
  }  
}
