//*7 multiplier for all images
class Score
{
  String[] scoreList = new String[2];
  String[] loadInto=loadStrings("scores.txt");
  private int scoreCounter=0;
  public int levelCount=0;
  private String scoreValString;
  private int XPos;
  Score(int XPos) {
    this.XPos=XPos;
  }
  void scoreboard() { //this draws the background scoreboard
    image(img.scoreboard, XPos, 0);
  }
  void score() {
    textAlign(CENTER);
    textSize(startbutton.text_size); 
    scoreValString=Integer.toString(scoreCounter); //converts the score to a string so it can be used for text.
    scoreboard();
    text(scoreValString, XPos+105, 65); //current score
    text(loadInto[levelCount], XPos+273, 65); //high score
  }
  void saveScores() {
    try {
      if (Integer.parseInt(scoreValString)>Integer.parseInt(loadInto[levelCount])) { //converts the string into integers, and checks if the score at end is greater than high score.
        scoreList[levelCount]=scoreValString;
        saveStrings("scores.txt", scoreList); //saves to a file called scores.txt
      }
    }
    catch(NumberFormatException e){
      scoreList[levelCount]=scoreValString;
      saveStrings("scores.txt", scoreList); //saves to a file called scores.txt
    }
  }
}
