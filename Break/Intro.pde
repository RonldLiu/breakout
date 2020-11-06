void intro() {
  gameover.pause();
  win.pause();
  intro.play(); //play sound
  background(white);
  image(gif[frame],0,0,width,height);
  frame++;
  if(frame == 9){
    frame = 0;
  }
  stroke(black);
  shadowText("BREAKOUT", width/2, 200, 100); //title
  tactileButton(250, 340, 300, 130, "PLAY", 400, 395, 80); //1 player button
}
void introClicks() {
  if (mouseX > 250 && mouseX < 550 && mouseY > 340 && mouseY< 470) { //if clicked on 2 player button, start game without computer player
    intro.rewind();
    mode = GAME;
    resetGame();//resets game
    intro.pause();
  }
}
