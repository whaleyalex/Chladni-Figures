import java.io.BufferedWriter;
import java.io.FileWriter;
import oscP5.*;
import netP5.*;

OscP5 oscP5;
float valueenv1, valueenv2, valueenv3;

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
//float x1 = 0.5;
//float y1 = 0.6;
//float w1 = 0.7;
//float z1 = 0.8;

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

class Vertx {
 int x, y;
 Vertx(int xV, int yV) {
   x = xV;
   y = yV;
 }
} 

Vertx[]vertices;
Vertx vx1, vx2, vx3, vx4;
boolean firstpress, polygonClosed, editMode, applytex;
int x1, y1, x2, y2, a, verticesIndex;
float xoff, yoff,val1,val2;


int r1, r2, r3;
int counter = 0;

float figureNumber = 54; //number of figures to include, 49 for original figures, 54 for all

color blue;
color red;
color purple;

int widthVar; //width variable for figures
int heightVar; //height variable for figures

//boolean fill = true; //use outlines of filled in shapes for the figures

PShape circle; //circular PShape

void settings() {
  fullScreen(P3D,SPAN);
  //fullScreen(P3D);
}


void setup() {
  //size(512, 512, P3D); //if dim is updated, update this initialization as well to match dim
  frameRate(25);
  pg = createGraphics(dim,dim,P3D);
  textureMode(NORMAL);
   oscP5 = new OscP5(this,8000);
   vertices = new Vertx[0];
    firstpress = editMode = true;
    polygonClosed = applytex = false;
    verticesIndex = 0;
    a = 0;
    smooth();
   
   
  widthVar = dim;
  heightVar = dim;
  
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
  col = map(noise(valueenv2), 0, 1, 200, 360);
  oppCol = (360-col)+200; //calculate the opposite value for color
  
  //Initialize noise variables
  assignNoiseVariables();
  
  //Draw figures
  if (counter >= 50) {
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
  //incrementNoiseVariables();

  //Iterate rotation variable
  rot++;
  if (rot == 361) { //reset rotation angle
    rot = 0;
  }
  
  
  
  //PGraphics dimensions as a texture
  //beginShape();
  //texture(pg);
  //vertex(0,0,0,0);
  //vertex(widthVar,0,1,0);
  //vertex(widthVar,heightVar,1,1);
  //vertex(0,heightVar,0,1);
  //vertex(0,heightVar,0,1);
  //endShape(CLOSE);
  
  
   if (applytex == true && vertices.length != 0) {
    background(0);
    
    for (int i=0; i<vertices.length; i=i+4) {      
      noStroke();
      
        //shape 1
      beginShape();
      texture(pg);
      vertex(vertices[i].x, vertices[i].y, 0, 0); 
      vertex(vertices[i+1].x, vertices[i+1].y, 1, 0); 
          vertex(vertices[i+2].x, vertices[i+2].y, 1, 1); 
      vertex(vertices[i+3].x, vertices[i+3].y, 0, 1); 
      endShape(CLOSE);    
    } 
  }  
  
  
}






void assignNoiseVariables() {
  //Recommended Channel 1, maybe divided
  ampNoise1 = valueenv2; // audio inputs
  ampNoise2 = valueenv2;
  ampNoise3 = valueenv2;
  ampNoise4 = valueenv2;
  ampNoise5 = valueenv2;
  //Recommended Channel 2
  xNoise = valueenv1;
  yNoise = valueenv1;
  //Recommended Channel 3
  wNoise = valueenv3;
  zNoise = valueenv3;
}






//void incrementNoiseVariables() {
//  colNoise += 0.01; //increment value of noise for color
//  zNoise += 0.01; //noise for z translation
  
//  amp1 +=0.01;
//  amp2 +=0.01;
//  amp3 +=0.01;
//  amp4 +=0.01;
//  amp5 +=0.01;
//  x1 +=0.01;
//  y1 +=0.01;
//  w1 +=0.01;
//  z1 +=0.01;
//}





 void keyPressed() {
  if (key == 'w') {   // write to file
    String points = "";
    for (int i = 0; i < vertices.length; i++) {
        String p1 = str(vertices[i].x);
        String p2 = str(vertices[i].y);
        points += p1 + "," + p2 + ";";       
    }
    String[] list = split(points, ';');
    // Writes the strings to a file, each on a separate line
     saveStrings("points.txt", list);    
  
  } else if (key == 'r') {
    String[] points = loadStrings("points.txt");

    vertices = (Vertx[]) expand(vertices, points.length-1);
    verticesIndex = points.length-1;
    
    for (int i = 0 ; i < points.length-1; i++) {      
      String[] list = split(points[i], ',');
      println("we are at index:  " + i);
      println(list[0]);
      println(list[1]);
      int px = Integer.parseInt(list[0]); 
      int py = Integer.parseInt(list[1]); 
      vertices[i] = new Vertx(px, py);   
    }
    
    applytex = true;
  
  } else {
    // apply texture to polygon(s)
    applytex = true;
  }
  
 
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
      ch37DrawBlue(); // color overlays
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

void mousePressed() {
   
   applytex = false;
  if (firstpress == true){
    x1 = mouseX;
    y1 = mouseY;
    x2 = x1;
    y2 = y1;
    firstpress = false;
    
    vertices = (Vertx[]) expand(vertices, verticesIndex+1);
    vertices[verticesIndex] = new Vertx(x1, y1);   
  }else{
    x1 = x2;
    y1 = y2;
    x2 = mouseX;
    y2 = mouseY;

    //verticesIndex++;
    if (verticesIndex % 4 > 0 || polygonClosed == true) {
      vertices = (Vertx[]) expand(vertices, verticesIndex+1);
      vertices[verticesIndex] = new Vertx(x2, y2);
      polygonClosed = false;
    } else {
      polygonClosed = true;
      firstpress = true;
    }
  }
}

void mouseReleased(){
  if (verticesIndex % 4 == 0 && firstpress == true) {
    x2 = vertices[vertices.length-4].x;
    y2 = vertices[vertices.length-4].y;
    verticesIndex--;
    
  }
    verticesIndex++;
   // noStroke();
    stroke(225);
    //strokeWeight(1);
    line(x1, y1, x2, y2);
}

// OSC events listener

void oscEvent(OscMessage theOscMessage) {

  //print(" typetag: "+theOscMessage.typetag());
  
  if(theOscMessage.checkAddrPattern("/env1")==true) { 
   valueenv1=theOscMessage.get(0).floatValue();
  println(valueenv1);
    
  }
  if(theOscMessage.checkAddrPattern("/env2")==true) { 
   valueenv2=theOscMessage.get(0).floatValue();
  println(valueenv2);
    
  }
  
  if(theOscMessage.checkAddrPattern("/env3")==true) { 
   valueenv3=theOscMessage.get(0).floatValue();
  println(valueenv3);
    
  }
  
  
}