class Rat
{
  private int ratMsTarget1, ratMsTarget2;
  private float r, speedX, initY, speedY, initX=0;
  private boolean drawON=false;
  Rat() {
  }
  void randomiser() { //this method sets all the variables which need randomising to draw the rat
    ratMsTarget1=generalMSNow+1000;
    ratMsTarget2=generalMSNow+3000;
    r=random(ratMsTarget1, ratMsTarget2);//this randomises the time between rats but keeps it within a limit
    speedX=random((width*0.10)/60, (width*0.15)/60);
    initY=random(0, height);
    speedY=random((width*0.05)/60, (width*0.08)/60);
    drawON=true;
  }
  void drawRat() {
    if (generalMSNow>=r) {
      image(img.rat, initX, initY);
      initX=initX+speedX;
      initY=initY+speedY;
      if (initX>=width || initY>=height) { //removes the rat and resets if it is over the edge of the screen
        drawON=false;
        initX=0;
      }
      if (mouseX>=initX && mouseX<=initX+85 && mouseY>=initY && mouseY<=initY+80) { //this detects if the mouse is over the rat 
        drawON=false;
        initX=0;
        lives.liveCounter=lives.liveCounter+1;
        if (lives.liveCounter==4) { //game over condition
          product.productNullifierDone=true;
          product.gameOverSplash=true; //causes the game over splash screen
          lives.endLevel();
        }
      }
    }
  }
}
