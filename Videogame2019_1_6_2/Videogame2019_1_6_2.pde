import ddf.minim.*;
import ddf.minim.analysis.*;
import processing.video.*;

//Music
Minim minim;
AudioPlayer battleThemeIntro;
AudioPlayer battleThemeMain;
AudioPlayer mainMusic;

boolean battleIntro;

//Video
Movie openCutScene;
Movie finalBossCutScene;
PGraphics pg;
PGraphics pg2;
boolean movieOpen;
boolean movieOpen2 = false;
int timerCount = 0;
boolean skipVideo = false;
boolean videoCheck = false;
PImage endScreen;


int count;

//Pictures
PImage bedroom;
boolean charSelect = false;

//Map Models
ArrayList<PShape> map = new ArrayList<PShape>();
ArrayList<PVector> position = new ArrayList<PVector>();

PShape lHallChairs;
PShape lHallChairs2;
PShape box;

//Character Models
PShape tony;
PShape[] tonyWalk = new PShape[16];
PShape[] enemy = new PShape[4];
boolean enemyCheck = false;
float[] enemyLocX = new float[4];
float[] enemyLocZ = new float[4];
boolean[] enemyStatus = new boolean[4];

//Axis
PVector v1;
PVector v2;

//Camera Speed/Position Variables
float speedX;
float speedY;
float speedZ;
float speedUP;
float speedDOWN;
float x;
float y;
float z;
float x1;
float y1;
float z1;
float e;
float eCount;
float eCountSave;
boolean eCountSwitch;
float scrollFactorX;
float scrollFactorY;
float camX;
float camY;
float camZ;

//Character Movement Variables
float tonyX;
float tonyY;
float tonyZ;
float tonyR;
float tonyI;
boolean tonyBool = true;
boolean isLeft, isRight, isUp, isDown, isE; 

//Minimap Movement
float mapX;
float mapY;

//Collision Variables
float check = 1;
PShape[] childShape;

//Charcter Selection
int choice;
int cut = 1;
int cut2 = 1;

//AABB Collision Bounding Box
float xBoxPos = 0;
float yBoxPos = -17;
float zBoxPos = 0;

//Inventory
boolean open = false;
float xIncrease;
float yIncrease;

//Levels
PShape levelZero;
PShape battleZoneRed;
PShape battleZoneRingRed;
PShape[] battleZoneBlue = new PShape[4];
PShape[] battleZoneRingBlue = new PShape[4];
ArrayList<PShape> levelOne = new ArrayList<PShape>();
ArrayList<PShape> levelTwo = new ArrayList<PShape>();
ArrayList<PShape> levelThree = new ArrayList<PShape>();
int level = 7;
int walkThrough = 0;
float rotateValue;

//Battles
boolean battle = false;
float battlePosition = 0;
boolean win = false;
boolean up;
float increase = 1;
int round = 0;
boolean ready = false;
boolean ready2 = false;
boolean ready3 = false;

//UI
Inventory main;
PlayerStats mainUser;
Item cof;
Item cof1;
Item cof2;
Item leapy;
Item hatboi;
Item scissorsWep;
Item tableOfContents;
Item workLog;
Item titlePage;
int i = 0;
AudioPlayer thunk;
AudioPlayer hoverBoi;

//INVENTORY
PImage inventoryBack;
PImage inventoryBack2; //added in 6.0
PImage inventoryBack3; //added in 6.0
PImage transparentSlot;

PImage hat;
PImage scissors;
PImage report;
PImage coffee;
PImage table;
PImage work;
PImage title;

//CHARACTER SELECT //added in 6.0
PImage buddon;
PImage cSelectLight;
PImage cSelectMed;
PImage cSelectDark;
Movie cSelectLightSpin;
Movie cSelectMedSpin;
Movie cSelectDarkSpin;
Movie cSelectLightSpinRev;
Movie cSelectMedSpinRev;
Movie cSelectDarkSpinRev;
Button lightB;
Button medB;
Button darkB;
Button arrowClock;
Button arrowCounter;
Button donezo;
PGraphics screenI;
int characterTemp = 0;
boolean selected = false;
boolean turnClock;
boolean turnCounter;
float timer = 0;

//COMBAT //added in 6.0
int screen = 0;
boolean started = false;
boolean died = false;
boolean enemyDied = false;
boolean left;
boolean turn=true;
boolean weakA;
boolean strongA;
boolean useI;
boolean pausedC;
boolean pauseClick;
String displayText;
Button useo;
Button weako;
Button stronkboi;
Button drunkCof;
Button butActuallyDont;
Enemy mainBad;
Enemy firstBaddie;
Enemy secondBaddie;
Enemy thirdBaddie;
Enemy boss;
PImage backgroundBox;
PImage useButton;
PImage weakButton;
PImage strongButton;
PImage COFFE;
PImage back;
Bar tonyH;
Bar tonyS;
Bar enemyH;
Bar enemyS;
boolean enemyStrong;
boolean uhg;
float healthTemp;
float staminaTemp;
float healthTarget;
float healthETarget;
float staminaTarget;
float staminaETarget;
float refillHTarget;
float refillSTarget;

//START SCREEN //added in 7.0
PImage background;
PImage startB;
Movie intro;
Button startButton;
boolean playingMov = true;
boolean title0;


void setup() {
  //fullScreen(P3D, 1); //Full Screen 3D
  size(1280, 720, P3D);

  minim = new Minim(this);

  load(); //Loading Models

  smooth(8); //Anti-Aliasing

  battleThemeMain = minim.loadFile("Assets/Music/battle_theme_main.wav");
  thunk = minim.loadFile("thunk.wav");
  hoverBoi = minim.loadFile("HoverSound.wav");
  hoverBoi.setGain(-10);
  thunk.setGain(-10);
}

void movieEvent(Movie m) {
  m.read();
}

void load() {
  inventoryBack = loadImage("inventory_blank.png");
  inventoryBack2 = loadImage("inventory_blank_light.png"); //added in 6.0
  inventoryBack3 = loadImage("inventory_blank_dark.png"); //added in 6.0
  transparentSlot = loadImage("white_square.png");
  mainUser = new PlayerStats("Tony", "Paperwizard");
  main = new Inventory(mainUser);
  hat = loadImage("paper_hat_icon3.png");
  coffee = loadImage("coffee_icon3.png");
  scissors = loadImage("scissors_icon3.png");
  report = loadImage("leap_report_icon.png");
  table = loadImage("table_of_contents_icon.png");
  work = loadImage("work_log_icon.png");
  title = loadImage("title_page_icon.png");
  cof = new Item(coffee, "Coffee", "basic", 50, 30, true);
  cof1 = new Item(coffee, "Coffee", "basic", 50, 30, true);
  cof2 = new Item(coffee, "Coffee", "basic", 50, 30, true);
  leapy = new Item(report, "Resume", "doc");
  tableOfContents = new Item(table, "ToC", "doc");
  workLog = new Item(work, "Work Log", "doc");
  titlePage = new Item(title, "Title Page", "doc");
  hatboi = new Item(hat, "Paper Hat", "helm", 0, 3, 0);
  scissorsWep = new Item(scissors, "Glue", "weapon", 0, 0, 2);
  //main.addItem(test2);
  //main.addItem(test3);
  //main.addItem(test4);

  //CHARACTER SELECT //added in 6.0
  screenI = createGraphics(1280, 720, P3D);
  buddon = loadImage("complete_buddon.png");
  cSelectLight = loadImage("custom_light_still.png");
  cSelectMed = loadImage("custom_med_still.png");
  cSelectDark = loadImage("custom_dark_still.png");
  cSelectLightSpin = new Movie (this, "custom_light.mp4");
  cSelectMedSpin= new Movie (this, "custom_med.mp4");
  cSelectDarkSpin= new Movie (this, "custom_dark.mp4");
  cSelectLightSpinRev= new Movie (this, "custom_light_reverse.mp4");
  cSelectMedSpinRev= new Movie (this, "custom_med_reverse.mp4");
  cSelectDarkSpinRev= new Movie (this, "custom_dark_reverse.mp4");
  lightB = new Button(237, 208, 95, 95);
  medB = new Button(379, 208, 95, 95);
  darkB = new Button(517, 208, 95, 95);
  arrowClock = new Button(886, 615, 71, 70);
  arrowCounter = new Button(1155, 615, 71, 70);
  donezo = new Button(325, 600, 200, 80, buddon);

  //COMBAT //added in 6.0
  back = loadImage("back_button.png");
  backgroundBox = loadImage("battle_bar_blank.png");
  useButton = loadImage("use_item_button.png");
  weakButton = loadImage("light_attack_button.png");
  strongButton = loadImage("heavy_attack_button.png");
  COFFE = loadImage("coffee_icon3.png");

  mainBad = new Enemy("Muffin", 50, 10, 2, 1, "slap", "big slap"); //enemy used by combat, make new enemies and set this equal to them
  
  firstBaddie = new Enemy("yo", 10, 10, 2, 1, "slap", "big slap", new Item[]{scissorsWep, titlePage});
  secondBaddie = new Enemy("this", 20, 20, 3, 2, "slap", "big slap", new Item[]{hatboi, tableOfContents});
  thirdBaddie = new Enemy("is", 30, 30, 6, 2, "slap", "big slap", new Item[]{cof, cof1, cof2, workLog});
  boss = new Enemy("a test", 40, 50, 6, 2, "slap", "big slap", new Item[]{leapy});
  

  //Buttons
  weako = new Button(309, 525, 190, 80, weakButton);
  stronkboi = new Button(309, 619, 190, 80, strongButton);
  useo = new Button(524, 568, 211, 84, useButton);
  drunkCof = new Button(309, 525, 80, 80, COFFE);
  butActuallyDont = new Button(309, 619, 190, 80, back);

  //Bars
  tonyH = new Bar(30, 614, 220, 24, "HP", mainUser.getHealth(), mainUser.getMaxHealth(), #34CE3D, 7, true);
  tonyS = new Bar(30, 668, 220, 24, "SP", mainUser.getStamina(), mainUser.getMaxStamina(), #9229A2, 7, true);
  enemyH = new Bar(1030, 614, 220, 24, "HP", mainBad.getHealth(), mainBad.getMaxHealth(), #34CE3D, 7, true);
  enemyS = new Bar(1030, 668, 220, 24, "SP", mainBad.getStamina(), mainBad.getMaxStamina(), #9229A2, 7, true);

  //Bedroom Instructions
  bedroom = loadImage("Assets/Pictures/controls.png");
  
  //Main Music
  mainMusic = minim.loadFile("mainMusic.wav");


  //Opening Cut Scene
  pg = createGraphics(1280, 720, P3D);
  pg2 = createGraphics(1280, 720, P3D);
  
  //Enemy Status
  enemyStatus[0] = true;
  enemyStatus[1] = true;
  enemyStatus[2] = true;
  enemyStatus[3] = true;
  
  //START SCREEN //added in 7.0;
  background = loadImage("title_screen_blank.png");
  startB = loadImage("start_button.png");
  intro = new Movie(this, "title_screen_shortened.mp4");
  startButton = new Button (420, 370, 446, 154, startB);
  
  //End Screen
  endScreen = loadImage("end_screen.png");
  
  //main.addItem(cof);
}

void orthographic()
{
  //Orthographic/Perspective
  if (open)
  {
    float orthoScale1 = width/(2);
    float orthoScale2 = height/(2);
    ortho(-orthoScale1, orthoScale1, -orthoScale2, orthoScale2);
  } else if (battle)
  {
    float orthoScale1 = width/(20);
    float orthoScale2 = height/(20);
    ortho(-orthoScale1, orthoScale1, -orthoScale2, orthoScale2);
  } else if (charSelect || movieOpen || movieOpen2 || !title0 || level == 8)
  {
    float orthoScale1 = width/(2);
    float orthoScale2 = height/(2);
    ortho(-orthoScale1, orthoScale1, -orthoScale2, orthoScale2);
  } else
  {
    float orthoScale1 = width/(20+eCount);
    float orthoScale2 = height/(20+eCount);
    ortho(-orthoScale1, orthoScale1, -orthoScale2, orthoScale2);
  }
  noClip();
}

void draw() {
  //Orthographic
  orthographic();


  //Background Color, Lights, and Effects
  background(0xffffffff); 
  //background(100);
  //background(0);
  //lights();
  //light();
  noLights();

  //Camera Perspective
  cameraS();


  if (cut==1)
  {

    //Loads map models
    Map();

    cut++;
  }

  lights();
  light();
  
  
  if (!battle && !open && !movieOpen && !(level == 5) && !(level == 7))
  {
    movement();
  }
  
  if (round == 4)
  {
   level = 8; 
  }

  if (!open)
  {
    render();
  }

  //Drawing Models
  if (selected)
   {
   model();
   }
  enemyModel();


  main.display();
  
  if (ready3)
  {
   combat(); 
  }

  
}

void mouseWheel(MouseEvent event)
{
  if (!open && !movieOpen)
  {
    e = event.getCount();
    eCount = eCount + e;
    eCountSave = eCount;


    //Off For Testing
    /*
    if (eCount < -5)
     eCount = -5;
     
     if (eCountSave < -5)
     eCountSave = -5;
     */

    if (eCount > 30)
      eCount = 30;

    if (eCountSave > 30)
      eCountSave = 30;

    scrollFactorX = 22*eCount;
    scrollFactorY = 11*eCount;
  }
}


void light()
{
  //Loading lights
  //pointLight(255, 255, 255, 10, -10, 10);
  //directionalLight(155, 155, 155, 1+speedZ, 1+speedZ, 1+speedZ);
  //ambientLight(70,70,70);
  directionalLight(255, 255, 255, -7, 14, 14);
  //shininess(100);
}

void grid()
{
  //Loads a Test Grid
  pushMatrix();
  translate(0, 0, 0);
  stroke(#FF0000);
  line(0, 0, 1000, 0, 0, -1000);
  stroke(#0000FF);
  line(0, 1000, 0, 0, -1000, 0);
  stroke(0, 255, 0);
  line(1000, 0, 0, -1000, 0, 0);
  strokeWeight(2);
  popMatrix();
}
