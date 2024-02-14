//w22 h18
class Avocado extends Ingredients implements ButtonPresses
{
  Avocado(int xPos, int yPos) {
    super(xPos, yPos);
  }
  void avocadoBasket() { //draw avocado Basket
    image(img.avocadoBasket, xPos, yPos);
  }
  void onClick() { //if Left Mouse Button clicked, sets draw to true and sets up the confetti animation.
    if ((mouseX>=(int(xPos))) && (mouseY>=(int(yPos))) && (mouseX<=(int(xPos+110))) && (mouseY<=(int(yPos+90))) && ingredientMoving==false) { //ingredientMoving is to make it so only one ingredient can be picked up at a time
      draw=true;
      confettiMsStart=millis();
      confettiMSTarget=confettiMsStart+300;
      confettiON=true;
    }
  }
  void PressComplete() { //draws the avocado initially
      image(img.avocado, xPos,yPos+45);
      move=true;
      draw=false;
  }
  void drawAvocado(){ //continually draws avocado at the mouse position at every call of the method
      newXPos=mouseX;
      newYPos=mouseY;  
      image(img.avocado, newXPos, newYPos);      
  }
}
