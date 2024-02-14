//w22 h18
class Salmon extends Ingredients implements ButtonPresses
{
  Salmon(int xPos, int yPos) {
    super(xPos, yPos);
  }
  void salmonBasket() { //draw salmon basket
    image(img.salmonBasket, xPos, yPos);
  }
  void onClick() { //if Left Mouse Button clicked, sets draw to true and sets up the confetti animation.
    if ((mouseX>=(int(xPos))) && (mouseY>=(int(yPos))) && (mouseX<=(int(xPos+110))) && (mouseY<=(int(yPos+90))) && ingredientMoving==false) {//ingredientMoving is to make it so only one ingredient can be picked up at a time
      draw=true;
      confettiMsStart=millis();
      confettiMSTarget=confettiMsStart+300; //total length of the animation
      confettiON=true;
    }
  }
  void PressComplete() { //draws the salmon initially
      image(img.salmon, xPos, yPos+45);
      move=true;
      draw=false;
  }
  void drawSalmon() { //continually draws salmon at the mouse position at every call of the method
      newXPos=mouseX;
      newYPos=mouseY;
      image(img.salmon, newXPos, newYPos);
  }
}
