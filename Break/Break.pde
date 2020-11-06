import ddf.minim.*; //Ronald Liu, 1-2, Oct 24, Pong
final int INTRO = 0, GAME = 1, PAUSE = 2, GAMEOVER = 3; //mode's number
int mode = INTRO, live, timer, S = 0; //mode and score;
Minim minim;//sound variables
AudioPlayer intro, beep, boop, bbreak, failure, win, gameover;
float paddlex = 800, paddley = 600, paddled = 200, ballx, bally, balld = 20, vx, vy; //paddles variables and ll's x postition, y position diameter and the velocities, //intitallize ball and paddles
//bricks values
int n = 36, sideM = 100, topM = 100, tempx = sideM, tempy=topM, rowM = 50, colM = 50, brickS = 25;//top margine and side margin, and row margin
int r = 0, g = 100, b=100;
int[] x = new int[n];
int[] y = new int[n];
color[] c = new color[n];
boolean[] isBroken = new boolean[n];
int i = 0;
int[][]bricks = new int[n][3];
int frame = 0;
color black = color(0), white = color(255), red = color(255, 0, 0), green = color(0, 255, 0), blue = color(0, 255, 255), lightgrey = color(100), darkgrey = color(200);
PFont myFont;
PImage[] gif;
PImage rage;
void setup() {
  size(800, 600, FX2D);
  textAlign(CENTER, CENTER);
  

myFont= createFont("Lequire.otf", 32);
  
textFont(myFont);
  minim = new Minim(this); //minim and sound initialization
  beep = minim.loadFile("beep.wav");
  boop = minim.loadFile("boop.wav");
  bbreak = minim.loadFile("break.wav");
  failure = minim.loadFile("failure.wav");
  intro = minim.loadFile("intro.wav");
  win = minim.loadFile("win.wav");
  gameover = minim.loadFile("gameover.wav");
  rage = loadImage("face_rage.png");
  gif = new PImage[9];
  
  while(i<9){
    gif[i] = loadImage("frame_"+i+"_delay-0.04s.png");
    i++;
  }
 
  for (int j = 0; j < n; j++) {
    if (tempx==width-sideM) {
      tempx=sideM;
      tempy+=rowM;
      g+=50;
      b+=50;
    }
    x[j] = tempx;
    y[j] = tempy;
    c[j] = color(r, g, b);
    tempx += colM;
  }
}
void draw() { //different modes depending on the mode    
  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == PAUSE) pause();
  else if (mode == GAMEOVER)  gameover();
}
