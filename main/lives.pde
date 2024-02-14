class Lives
{
  public int liveCounter=0;
  public boolean resetIndex0=false;
  PImage[] livesBoard=new PImage[5];
  Lives() {
  }
  void loadArray() { //loads array with images for all the number of lives you could have
    livesBoard[0]=img.lives3;
    livesBoard[1]=img.lives2;
    livesBoard[2]=img.lives1;
    livesBoard[3]=img.gameOver;
  }
  void drawLivesBoard() {
    image(livesBoard[lives.liveCounter], width-140, 0);
  }
  void endLevel() {
    score.score();
    score.saveScores();
    if(product.gameOverSplash==true || product.levelPassed==true && score.levelCount==1){
      score.levelCount=0;
    }
    else if(product.levelPassed==true && score.levelCount==0){
      score.levelCount=score.levelCount+1;
    }
    gameReset(); //resets all variables in the game to default
  }
  void gameReset() {
    avocado1.booleanReseter();//resets move/draw
    rice1.booleanReseter();
    salmon1.booleanReseter();
    seaweed1.booleanReseter();
    chicken1.booleanReseter();
    product.productVarResetter();
    ingredientMoving=false;
    rat1.drawON=false;
    rat1.initX=0;
    lives.liveCounter=0;
    score.scoreCounter=0;
    product.products.clear();//clear products ArrayList
    product.orderList.clear();//clear orderList ArrayList
    if (product.gameOverSplash==true) {
      gameOver();
    }
    if (product.levelPassed==true) {
      levelPassed();
    }
  }
}
