//Tower Defense Game
//Kieran Smith
//Programming 12

// ================ GLOBAL VARIABLES =================

final int INTRO    = 0;
final int PLAY     = 1;
final int BUILD    = 2;
final int GAMEOVER = 3;
int mode;

//Pallette
color white = #ffffff;
color black = #000000;
color floor = #E2DE84;
color dGreen = #3F4739;
color mGreen = #A6A670;
color red = #A4031F;
color blue = #2A4494;


//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;

//Buttons
Button start, nextWave;

//Collections of objects
Node[] nodes;
ArrayList<Mob> mobs;
ArrayList<Tower> towers;
ArrayList<Bullet> bullets;

//Images and Gifs
Gif backrooms;
//Fonts
PFont blur;

// ===================== SETUP =========================

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  size(1000, 800);
  initializeModes();
  initializeVariables();
  makeButtons();
  makeNodes();
}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
}

void initializeVariables() {
  //Load Images & Gifs
  backrooms = new Gif("backrooms/frame_", "_delay-0.03s.gif", 27, 2, 500, 400, width, height);
  //Load Fonts
  blur = createFont("Blur.ttf", 200);

  //Create Collections of Objects
  mobs = new ArrayList<Mob>();
  towers = new ArrayList<Tower>();
  bullets = new ArrayList<Bullet>();
  
  //test towers
  towers.add(new Tower(300, 400, 0, 60));
}

void makeButtons() {
  //INTRO - Start
  start = new Button("START", width/2, 3*height/4, 200, 100, white, black);

  //PLAY - Next Wave, To Build Mode
  nextWave = new Button("WAVE", 900, 100, 140, 100, blue, white);
  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE

  //GAMEOVER - Reset
}

void makeNodes() {
  //Plot the nodes on the map
  nodes = new Node[10];

  nodes[0] = new Node( 200, 100, 0, +1);
  nodes[1] = new Node(200, 600, +1, 0);
  nodes[2] = new Node(400, 600, 0, -1);
  nodes[3] = new Node(400, 500, -1, 0);
  nodes[4] = new Node(300, 500, 0, +1);
  nodes[5] = new Node(300, 700, +1, 0);
  nodes[6] = new Node(500, 700, 0, -1);
  nodes[7] = new Node(500, 300, +1, 0);
  nodes[8] = new Node(700, 300, 0, +1);
  nodes[9] = new Node(700, 700, +1, 0);
}


// ===================== DRAW ===========================

void draw() {
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == PLAY) {
    play();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameOver();
  }
}
