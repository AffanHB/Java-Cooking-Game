//w22 h18
class Seaweed extends Ingredients implements ButtonPresses
{
  Seaweed(int xPos, int yPos) {
    super(xPos, yPos);
  }
  void SeaweedBasket() { //draw seaweed Basket
    image(img.seaweedBasket, xPos, yPos);
  }
  void onClick() { //if Left Mouse Button clicked, sets draw to true and sets up the confetti animation.
    if ((mouseX>=(int(xPos))) && (mouseY>=(int(yPos))) && (mouseX<=(int(xPos+110))) && (mouseY<=(int(yPos+90))) && ingredientMoving==false) { //ingredientMoving is to make it so only one ingredient can be picked up at a time
      draw=true;
      confettiMsStart=millis();
      confettiMSTarget=confettiMsStart+300; //total length of the animation
      confettiON=true;
    }
  }
  void PressComplete() { //draws the seaweed initially
      image(img.seaweed, xPos,yPos+45);
      move=true;
      draw=false;
  }
  void drawSeaweed(){ //continually draws seaweed at the mouse position at every call of the method
      newXPos=mouseX; 
      newYPos=mouseY;
      image(img.seaweed, newXPos, newYPos);      
  }
}
