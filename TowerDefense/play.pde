//This function draws the PLAY screen

int waves = 1;
int i;
int m = 0;
boolean enemy;


void play() {
  drawMap();
  animateThings();
  drawPlayInterface();
  //handleButtonClicks();
  whatButton();
}



void drawMap() {
  //background
  fill(dGreen);
  rect(500, 400, width, height);

  //path
  stroke(floor);
  strokeWeight(30);
  line( 0, 100, 200, 100);
  line( 200, 100, 200, 600);
  line( 200, 600, 400, 600);
  line( 400, 600, 400, 500);
  line( 400, 500, 300, 500);
  line( 300, 500, 300, 700);
  line( 300, 700, 500, 700);
  line( 500, 700, 500, 300);
  line( 500, 300, 700, 300);
  line( 700, 300, 700, 700);
  line( 700, 700, 800, 700);
  line( 800, 700, 1000, 700);
  strokeWeight(1);


  int i = 0;
  while (i < 10) {
    nodes[i].show();
    i++;
  }
}


void drawPlayInterface() {
  stroke(white);
  fill(black);
  rect(900, height/2, 200, height);

  fill(white);
  textSize(15);
  text("NEXT WAVE:"+waves, 900, 20);
  nextWave.show();
}

void animateThings() {
  int i = 0;
  while ( i < mobs.size()) {
    Mob myMob = mobs.get(i);
    myMob.act();
    myMob.show();
    if (myMob.hp <= 0) {
      mobs.remove(i);
    } else {
      i++;
    }
  }

  i = 0;
  while (i < towers.size()) {
    Tower myTower = towers.get(i);
    myTower.act();
    myTower.show();
    i++;
  }

  i = 0;
  while (i < bullets.size()) {
    Bullet myBullet = bullets.get(i);
    myBullet.act();
    myBullet.show();
    if (myBullet.hp <= 0) {
      bullets.remove(i);
    } else {
      i++;
    }
  }
}

void whatButton() {
  nextWave.show();
  if (mobs.size() == 0) {
    enemy = false;
    i = 0;
    if (nextWave.clicked && mobs.size() == 0) {
      enemy = true;
      m++;
      waves++;
    }
  }
  while (enemy == true && i < m) {
    mobs.add(new Mob(0 - 50*i, 100, 1, 0));
    i++;
  }
}


//void handleButtonClicks() {
//  if (nextWave.clicked) {
//    mobs.add(new Mob(0, 100, 1, 0));
//  }
//}
