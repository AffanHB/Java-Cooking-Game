class Bin{
  public boolean binConsume=false;
  int xPos, yPos;
  Bin(int xPos, int yPos) {
    this.xPos=xPos;
    this.yPos=yPos;
  }
  void drawBin() { //draw bin
    image(img.bin, xPos, yPos);
  }
  void onClick() { //if Left Mouse Button clicked, sets draw to true and sets up the confetti animation.
    if ((mouseX>=(int(xPos))) && (mouseY>=(int(yPos))) && (mouseX<=(int(xPos+110))) && (mouseY<=(int(yPos+90)))) { //*width and height by 5 as it wa sused in pixildraw
      binConsume=true;
    }
  }
  void pressComplete(){
    avocado1.booleanReseter();//resets move/draw
    rice1.booleanReseter();
    salmon1.booleanReseter();
    seaweed1.booleanReseter();
    chicken1.booleanReseter();
    ingredientMoving=false;
    binConsume=false;
  }
}
