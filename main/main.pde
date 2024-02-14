boolean startconveyor=false;
int overMsStart, overMSTarget;
int overMSNow;
int generalMSNow;
boolean ingredientMoving=false;
Button startbutton;
Images img;
Conveyor conv;
Seaweed seaweed1;
Product product;
Rice rice1;
Salmon salmon1;
Avocado avocado1;
Lives lives;
Score score;
Rat rat1;
Chicken chicken1;
Bin bin1;
void setup() {
  fullScreen();
  final int ingredientBasketY=height/2+250; 
  startbutton = new Button();
  img = new Images();
  conv= new Conveyor();
  seaweed1=new Seaweed(int(0.25*(width/2)), int(ingredientBasketY));
  rice1=new Rice(int(0.25*(width/2)+150), int(ingredientBasketY));
  salmon1=new Salmon(int(0.25*(width/2)+450), int(ingredientBasketY));
  avocado1=new Avocado(int(0.25*(width/2)+300), int(ingredientBasketY));
  chicken1=new Chicken(int(0.25*(width/2)+600), int(ingredientBasketY)); 
  product=new Product(height/2+7.5, (width*0.06)/60);
  bin1=new Bin(int(0.25*(width/2)+750), int(ingredientBasketY));
  rat1=new Rat();
  lives=new Lives();
  score=new Score(width/2-168);
  main_menu(); //draws the main menu
  img.load(); //loads all the images used at once
}

void mousePressed() {
  if (startbutton.StartButtonDisable==false) {
    startbutton.onClick();
  }
  if (mouseButton==LEFT) { //only runs if mouseButton pressed is the left button.
    seaweed1.onClick();
    rice1.onClick();
    salmon1.onClick();
    avocado1.onClick();
    bin1.onClick();
    if(score.levelCount==1){
      chicken1.onClick();
    }
  }
}

void mouseReleased() {//tracks plate positions and allows the addComponent to know which plate was clicked
  if (mouseX>=product.XPos1 && mouseX<=product.XPos1+135 && product.Image1==true && mouseY>=height/2 && mouseY<=height/2+135) {
    product.addComponent(product.a);
  }
  if (mouseX>=product.XPos2 && mouseX<=product.XPos2+135 && product.Image2==true && mouseY>=height/2 && mouseY<=height/2+135) {
    product.addComponent(product.b);
  }
}

void draw() { //responsible for drawing images on screen
  if (startbutton.StartButtonDisable==false) {
    startbutton.PressComplete();
  }
  //Level related methods
  if (startconveyor==true) {
    background(77, 255, 77);
    generalMSNow=millis(); //this msNow is used for both the rat and confetti
    conv.loadImagesInArray();
    conv.initConv(); //draw conv
    lives.loadArray();
    lives.drawLivesBoard();
    seaweed1.SeaweedBasket();
    rice1.riceBasket();
    salmon1.salmonBasket();
    avocado1.avocadoBasket();
    bin1.drawBin();
    if(score.levelCount==1){
      chicken1.chickenBasket();
    }
    score.scoreboard();
    score.score();
    if (product.orderListFull==false) {
      product.loadOrders();
    }
    if (product.orderListFull==true) {
      product.displayOrders();
    }
    if (seaweed1.draw==true) {
      seaweed1.PressComplete();
    }
    if (rice1.draw==true) {
      rice1.PressComplete();
    }
    if (salmon1.draw==true) {
      salmon1.PressComplete();
    }
    if (avocado1.draw==true) {
      avocado1.PressComplete();
    }
    if (chicken1.draw==true) {
      chicken1.PressComplete();
    }
    if(bin1.binConsume==true){
      bin1.pressComplete();
    }
    if (product.initPlates==false) {
      product.initPlates();
    }
    if (product.initPlates==true) {
      product.PlatePicker();
      product.PlateDrawer();
      product.msNow=millis();
    }
    if (seaweed1.move==true) { 
      seaweed1.drawSeaweed();
      ingredientMoving=true;
    }
    if (rice1.move==true) {
      rice1.drawRice();
      ingredientMoving=true;
    }
    if (salmon1.move==true) {
      salmon1.drawSalmon();
      ingredientMoving=true;
    }
    if (avocado1.move==true) {
      avocado1.drawAvocado();
      ingredientMoving=true;
    }
    if (chicken1.move==true) {
      chicken1.drawChicken();
      ingredientMoving=true;
    }
    if (seaweed1.confettiON==true) {
      seaweed1.confetti();
    }
    if (rice1.confettiON==true) {
      rice1.confetti();
    }
    if (avocado1.confettiON==true) {
      avocado1.confetti();
    }
    if (salmon1.confettiON==true) {
      salmon1.confetti();
    }
    if (chicken1.confettiON==true) {
      chicken1.confetti();
    }
    if (rat1.drawON==false) {
      rat1.randomiser();
    }
    if (rat1.drawON==true) {
      rat1.drawRat();
    }
  }
  if (product.gameOverSplash==true || product.levelPassed==true) { //ensures the correct amount of time passes for the splash screen and completes the reset
    overMSNow=millis();
    if (overMSNow>=overMSTarget) {
      product.gameOverSplash=false;
      product.levelPassed=false;
      main_menu();
      startbutton.StartButtonDisable=false;
    }
  }
}
void main_menu() { //displays the menu, its text and buttons.
  background(232, 130, 1);
  textAlign(CENTER);
  textSize(startbutton.text_size); //add text font
  text("Undercooked", width/2, height/2);
  startbutton.drawButton(width/2, height/2+165);
  fill(255, 255, 255);
  textAlign(CENTER, CENTER);
  text("Press to Start", width/2, height/2+165);
  textSize(width*0.01);
  textAlign(LEFT,TOP);
  text("""How to play: 
   Drag the ingredients required for the product on the orderboard onto the plate. You must drag the seaweed onto the plate first, then rice, then filling.
   If you drag the wrong one, put it into the bin to remove it. 
   If you get an order wrong or your mouse touches the rat you will loose a life, you have 3 lives as shown on the top right.
   Level 2 begins if you beat level 1 and introduces a new product Chicken sushi!
Type of Products:
   If the center is only orange, you need to make Salmon sushi.  
   If the center is orange and green, you need to make Avocado and Salmon sushi.
   If the center is brown and orange, you need to make Chicken Sushi.""",5,15);
}

void startgame() {
  background(77, 255, 77);
  startconveyor=true;
}

void gameOver() { //if the game is failed, this resets the game and displays the game over splashscreen.
  text("Game Over", width/2, height/2);
  overMsStart=millis();
  overMSTarget=overMsStart+5000;
  product.orderListFull=false;
  product.initPlates=false;
  startconveyor=false;
}
void levelPassed() { //if the game is failed, this resets the game and displays the level passed splashscreen.
  text("Level Passed!", width/2, height/2);
  overMsStart=millis();
  overMSTarget=overMsStart+5000;
  product.orderListFull=false;
  product.initPlates=false;
  startconveyor=false;
}
