void game() {
  if (S==n) {
    mode = GAMEOVER;
    win.rewind();
  }
  background(black);
  //bricks
  for (int i = 0; i < n; i++) {
    if (!isBroken[i]) {
      if (dist(ballx, bally, x[i], y[i])<=balld/2+brickS/2) { //bounce off paddle
        vx=(ballx-x[i])/5;
        vy=(bally-y[i])/5;
        isBroken[i]=true;
        S++;
        bbreak.rewind();
        bbreak.play();
      }
      fill(c[i]);
      circle(x[i], y[i], brickS);
    }
  }
  //
  if (live==0) {
    mode = GAMEOVER;
    gameover.rewind();
  }
  paddlex = mouseX;
  if (paddlex<paddled/2) { //restrictions
    paddlex = paddled/2;
  }
  if (paddlex> width-paddled/2) {
    paddlex = width-paddled/2;
  }
  fill(white); //show ball
  ballx += vx;
  bally += vy;
  if (bally<balld/2) bally = balld/2;//ball restrictions
  if (ballx<balld/2) ballx = balld/2;
  if (ballx>width-balld/2) ballx = width-balld/2;
  if (ballx <= balld/2 || ballx>=width-balld/2) { //bounce off walls
    vx = vx*-1;
    beep.rewind();
    beep.play();
  }
  if (bally <= balld/2) { //bounce off walls
    vy = vy*-1;
    beep.rewind();
    beep.play();
  }
  //live--
  textSize(50);
  text("Lives: "+live, width/4, height/20);
   text("Score: "+S+"/"+n, width*3/4-50, height/20);
  if (bally>height+balld/2) {
    live--;
    resetRound();
    failure.rewind();
    failure.play();
  }
  
  circle(ballx, bally, balld);
  circle(paddlex, paddley, paddled);
  imageMode(CENTER);
  image(rage, paddlex, paddley, paddled, paddled);
  imageMode(CORNER);
  if (dist(ballx, bally, paddlex, paddley)<=balld/2+paddled/2) { //bounce off paddle
    vx=(ballx-paddlex)/10;
    vy=(bally-paddley)/10;
    boop.rewind();
    boop.play();
  }
}
void resetRound() { //resets the round
  ballx = width/2;
  bally = height/2;
 vx = 0;
 vy = 2;
}
