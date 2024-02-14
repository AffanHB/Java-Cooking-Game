//W108 H31
class Conveyor
{
  PImage[] images = new PImage[6];
  private int initX=0;
  Conveyor()
  {
  }
  void loadImagesInArray() {
    images[0]=(img.conveyor1);
    images[1]=(img.conveyor2);
    images[2]=(img.conveyor1);
    images[3]=(img.conveyor2);
    images[4]=(img.conveyor1);
    images[5]=(img.conveyor2);
  }
  
  void initConv(){ // draws the conveyor belt
    for (int i=0; i<=5; i++) { 
      if (initX<=width) {
        image(images[i], initX, height/2);
        initX=initX+495;
        if (initX>=width) { //prevents the conveyor from being drawn endlessly past the width the screen. 
          initX=0;
          break;
        }
      }
    }
  }
}
