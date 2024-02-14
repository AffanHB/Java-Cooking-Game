abstract class Ingredients //all the ingredients inherrit from this class
{
  protected int xPos, yPos, newXPos, newYPos;
  protected int confettiMSTarget,confettiMsStart;
  protected boolean move=false, draw=false,confettiON=false;
  Ingredients(int xPos, int yPos){
    this.xPos=xPos;
    this.yPos=yPos;    
  }
  void booleanReseter(){ //this method is inheritted and resets the move and draw booleans once the game ends.
    move=false;
    draw=false;
  }
   void confetti(){
    if (generalMSNow<=confettiMSTarget-150){ //first part of the animation-lasts for half the time of the total animation length
      image(img.confetti1, xPos-25,yPos);
    }
    else if(generalMSNow>=confettiMSTarget-150 &&generalMSNow<=confettiMSTarget){ //second part of the animation, if checks for if first half has ran and prevents it from running over the max length
      image(img.confetti2,xPos-50,yPos-25);
    }
    else{
      confettiON=false; //stops confetti from being called in main.
    }
  }
}
