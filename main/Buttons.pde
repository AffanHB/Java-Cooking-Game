class Button implements ButtonPresses //<>//
{
  private boolean startON=false; 
  public boolean StartButtonDisable=false;
  private float rectX, rectY;
  private float radWidth, radHeight;
  public float text_size= (width*0.03);
  Button()
  {
  }
  void drawButton(float a, float b)  //draws buttons. THE PARAMETERS HERE CAN GO IN CONSTRUCTOR.
  { 
    rectX=a;
    rectY=b;
    radWidth=text_size*3;
    radHeight=text_size;
    rectMode(RADIUS);
    fill(232, 130, 1);
    stroke(255, 255, 255);
    rect(rectX, rectY, radWidth, radHeight);
  }
  void onClick() //detects if mouse is over the button area and will act as a "click"
  {
    if(StartButtonDisable==false){
      if ((mouseX>=(rectX-radWidth)) && (mouseY>=(rectY-radHeight)) && (mouseX<=(rectX+radWidth)) && (mouseY<=(rectY+radHeight)))
      {
        startON=true;
      }
    }
  }
  void PressComplete() 
  {
    if (startON==true)
    {
      startgame();
      startON=false;
      StartButtonDisable=true;
    }
  }
}
