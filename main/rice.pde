//w22 h18
class Rice extends Ingredients implements ButtonPresses
{
  Rice(int xPos, int yPos) {
    super(xPos, yPos);
  }
  void riceBasket() { //draw rice basket
    image(img.riceBasket, xPos, yPos);
  }
  void onClick() { //if Left Mouse Button clicked, sets draw to true and sets up the confetti animation.
    if ((mouseX>=(int(xPos))) && (mouseY>=(int(yPos))) && (mouseX<=(int(xPos+110))) && (mouseY<=(int(yPos+90))) && ingredientMoving==false) { //*width and height by 5 as it wa sused in pixildraw
      draw=true;
      confettiMsStart=millis();
      confettiMSTarget=confettiMsStart+300; //total length of the animation
      confettiON=true;
    }
  }
  void PressComplete() { //draws the rice initially
      image(img.rice, xPos,yPos+45);
      move=true;
      draw=false;
  }
  void drawRice(){ //continually draws rice at the mouse position at every call of the method
      newXPos=mouseX;
      newYPos=mouseY;  
      image(img.rice, newXPos, newYPos);      
  }
}
