//Plates= W27 H27 //<>//
class Product
{
  PImage[] CompletedProducts=new PImage[3];
  ArrayList<PImage> products=new ArrayList<PImage>();
  ArrayList<PImage> orderList=new ArrayList<PImage>();
  public boolean initPlates=false;
  public int a=0, b=1; //denotes which image is being drawn from products
  public boolean Image1=false, Image2=false;
  public float XPos1=0, XPos2=0;
  private float initY;
  private float speedX;
  private int msStart, msTarget;
  public int msNow;
  public boolean orderListFull=false;
  private int productNum1=0;
  private int productNum2=1;
  private final int productNumY=5;
  private boolean skipIf=false, productNullifierDone=false;
  private int finalIndex;
  public boolean levelPassed=false, gameOverSplash=false;
  private int completedProductsMax=2;
  Product(float initY, float speedX) {
    this.initY=initY;
    this.speedX=speedX;
  }
  void loadOrders() { //load orders into the array
    CompletedProducts[0]=img.salmonSushi;
    CompletedProducts[1]=img.AvocadoSalmon;
    CompletedProducts[2]=img.chickenSushi;
    if (score.levelCount==1) {
      completedProductsMax=3;
    } else {
      completedProductsMax=2;
    }
    for (int i=0; i<=products.size()-1; i++) {
      float itemNum=random(completedProductsMax);
      orderList.add(CompletedProducts[int(itemNum)]);
      if (i==products.size()-1) {
        orderListFull=true;
      }
    }
  }
  void initPlates() { //number of products per level
    for (int i=0; i<=11; i++) { //L1=12plates
      products.add(img.plate);
      if (i==11) {
        product.initPlates=true;
        finalIndex=i;
      }
    }
  }
  void PlatePicker() { //The plates are a component and stored in an ArrayList but are kept in this class as it deals with everything to do directly with products.
    for (int i=0; i<=products.size()-1; i++) {
      if (lives.resetIndex0==true) {
        i=0;
        lives.resetIndex0=false;
        break;
      }
      if (i==a && Image1==false && Image2==true || (a==0 && i==a) && Image1==false) { //The bit after the OR allows for the first image to be drawn, the bit before maintains seperation on future draws of Image1.
        msStart=millis();
        msTarget=msStart+5000; //msStart takes the value millis() returns, then msTarget is made for 10000ms(10secs) after.
        Image1=true;
      }
      if (i==b && msNow>=msTarget && Image2==false) { //This checks to see if 10second have surpassed. So each plate is at a ~10second interval.
        Image2=true;
      }
    }
  }
  void PlateDrawer() {
    if (Image1==true) {
      image(products.get(a), XPos1, initY);
      XPos1=XPos1+speedX;
      if (XPos1>=width) {
        productCheck(a); //checks if the product matches order
        if (productNullifierDone==false) { //boolean stops productNullifier from occuring if it has already occured as a result of the player failing the level.
          productNullifier(a);
        }
        if (lives.resetIndex0==false) {
          a=a+2;
          XPos1=0;
          Image1=false; //allows for the next plate to be drawn
        }
        productNullifierDone=false;
      }
    }
    if (Image2==true) {
      image(products.get(b), XPos2, initY);
      XPos2=XPos2+speedX;
      if (XPos2>=width) {
        productCheck(b); //checks if the product matches order
        if (productNullifierDone==false) { //boolean stops productNullifier from occuring if it has already occured as a result of the player failing the level.
          productNullifier(b);
        }
        if (lives.resetIndex0==false) {
          b=b+2;
          XPos2=0;
          Image2=false;//allows for the next plate to be drawn
        }
        productNullifierDone=false;
      }
    }
  }
  void displayOrders() {
    image(img.orderBoard, 0, 0);
    image(orderList.get(productNum1), 5, productNumY);
    image(orderList.get(productNum2), 147, productNumY);
  }
  void addComponent(int indexNumber) { //this method ensures products are added in one order
    if (products.get(indexNumber)==img.plate && seaweed1.move==true) {
      products.set(indexNumber, img.plateSeaweed); //this replaces empty plate png with seaweed+plate png in the array.
      seaweed1.move=false; //This stops seaweed being drawn
      ingredientMoving=false;
    }
    if (products.get(indexNumber)==img.plateSeaweed && rice1.move==true) {
      products.set(indexNumber, img.plateSeaweedRice); //this replaces seaweed plate png with seaweed+plate+rice png in the array.
      rice1.move=false; //This stops rice being drawn
      ingredientMoving=false;
    }
    if (products.get(indexNumber)==img.plateSeaweedRice && avocado1.move==true) {
      products.set(indexNumber, img.plateSeaweedRiceAvocado); //this replaces seaweedrice plate png with seaweed+plate+rice+avcocado png in the array.
      avocado1.move=false; //This stops avocado being drawn
      ingredientMoving=false;
    }
    if (products.get(indexNumber)==img.plateSeaweedRiceAvocado && salmon1.move==true) {
      products.set(indexNumber, img.AvocadoSalmon); //this replaces seaweedrice plate png with avocadosalmon png in the array.
      salmon1.move=false; //This stops salmon being drawn
      ingredientMoving=false;
    }
    if (products.get(indexNumber)==img.plateSeaweedRice && salmon1.move==true) {
      products.set(indexNumber, img.salmonSushi); //this replaces seaweedrice plate png with salmonsushi png in the array.
      salmon1.move=false; //This stops salmon being drawn
      ingredientMoving=false;
    }
    if (products.get(indexNumber)==img.plateSeaweedRice && chicken1.move==true) {
      products.set(indexNumber, img.chickenSushi); //this replaces seaweedrice plate png with chickenSushi png in the array.
      chicken1.move=false; //This stops chicken being drawn
      ingredientMoving=false;
    }
  }
  void productCheck(int IndexNumber) { //checks if the product matches order and increases the scorecount
    if ((products.get(IndexNumber) == orderList.get(productNum1)) && (products.get(IndexNumber) == orderList.get(productNum2))) { //if both orders in the scoreboard are the same, replaces one only.
      score.scoreCounter=score.scoreCounter+1;
      skipIf=true;
      if (productNum2+2<=orderList.size()-1) {//prevents productNum2 from exceeding orderList size.
        productNum2=productNum2+2;
      }
    } else if (products.get(IndexNumber) == orderList.get(productNum1) && skipIf==false) { //if product is equal to first order on orderboard
      score.scoreCounter=score.scoreCounter+1;
      if (productNum1+2<=orderList.size()-1) {
        productNum1=productNum1+2;
      }
    } else if (products.get(IndexNumber) == orderList.get(productNum2) && skipIf==false) { //if product is equal to second order on orderboard
      score.scoreCounter=score.scoreCounter+1;
      if (productNum2+2<=orderList.size()-1) {
        productNum2=productNum2+2;
      }
    } else if (products.get(IndexNumber) != orderList.get(productNum1) || products.get(IndexNumber) != orderList.get(productNum2)) { //if product is equal to neither order in the orderboard
      lives.liveCounter=lives.liveCounter+1;
      if (lives.liveCounter==4) { //ends and resets the game
        product.productNullifierDone=true;
        lives.resetIndex0=false;
        gameOverSplash=true; //causes the game over splash screen
        lives.endLevel();
      }
    }
    skipIf=false;
  }
  void productNullifier(int IndexNumber) { //sets the product in the array to null when it reaches the end of the conveyor belt
    products.set(IndexNumber, null);
    if (IndexNumber==finalIndex) { //this checks if the IndexNumber is the final index and resets the game 
      levelPassed=true; //this will display the level passed splash
      lives.endLevel();      
    }
  }
  void productVarResetter() { //resets the variables used in this class.
    a=0;
    b=1;
    productNum1=0;
    productNum2=0;
    XPos1=0;
    XPos2=0;
    Image2=false;
    Image1=false;
    lives.resetIndex0=true;
  }
}
