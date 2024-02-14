class Images
{
  public PImage conveyor1, conveyor2, conveyor3, conveyor4, conveyor5, conveyor6, orderBoard, plate;
  public PImage rice, riceBasket;
  public PImage seaweed, seaweedBasket, plateSeaweed, plateSeaweedRice, plateSeaweedRiceAvocado, AvocadoSalmon;
  public PImage salmon, salmonSushi, salmonBasket;
  public PImage avocado, avocadoBasket;
  public PImage lives3, lives2, lives1, gameOver, scoreboard;
  public PImage chickenBasket, chicken, chickenSushi;
  public PImage confetti1, confetti2;
  public PImage rat;
  public PImage bin;
  Images()
  {
  }
  void load()//loads all images used in the game
  {
    conveyor1=loadImage("Images/Conv1.png");
    conveyor2=loadImage("Images/Conv2.png");
    rice=loadImage("Images/rice.png");
    riceBasket=loadImage("Images/riceBasket.png");
    seaweed=loadImage("Images/seaweed.png");
    seaweedBasket=loadImage("Images/SeaweedBasket.png");
    salmonSushi=loadImage("Images/Salmonsushi.png");
    plate=loadImage("Images/Plate.png");
    plateSeaweed=loadImage("Images/plateWseaweed.png");
    plateSeaweedRice=loadImage("Images/plateSeaweedRice.png");
    plateSeaweedRiceAvocado=loadImage("Images/plateSeaweedRiceAvocado.png");
    AvocadoSalmon=loadImage("Images/AvocadoSalmon.png");
    salmon=loadImage("Images/salmon.png");
    salmonBasket=loadImage("Images/SalmonBasket.png");
    orderBoard=loadImage("Images/Orderboard.png");
    avocado=loadImage("Images/Avocado.png");
    avocadoBasket=loadImage("Images/avocadoBasket.png");
    lives3=loadImage("Images/3Lives.png");
    lives2=loadImage("Images/2Lives.png");
    lives1=loadImage("Images/1life.png");
    gameOver=loadImage("Images/0live.png");
    scoreboard=loadImage("Images/scoreboard.png");
    confetti1=loadImage("Images/confetti.png");
    confetti2=loadImage("Images/confetti2.png");
    rat=loadImage("Images/rat.png");
    chickenBasket=loadImage("Images/chickenBasket.png");
    chicken=loadImage("Images/chicken.png");
    chickenSushi=loadImage("Images/plateChicken.png");
    bin=loadImage("Images/Bin.png");
  }
}
