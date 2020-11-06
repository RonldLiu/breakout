void gameover() {
  if (S==n) {
    textSize(100);
    fill(green);
    text("YOU WIN", width/2, height/2); //displays left win in red
    win.play();
  } else {
    textSize(100);
    fill(red);
    text("GAME OVER", width/2, height/2); 
    gameover.play();
    gameover.play();
  }
  intro.rewind();
}
