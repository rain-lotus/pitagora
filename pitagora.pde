//pitagora.pde
//2_3_48 Reina Nozaki
//2017_5_30

import fisica.*;
boolean mousePressing = false, beltisMove = false, open = false;
color [] cs = {color(92, 166, 180), color(32, 89, 129), color(255, 180, 57), color(222, 76, 31), color(0, 29, 74)};

FWorld world;
FEdit edit = new FEdit();
FCircle switchBall;
PImage box, end;

void setup() {
  size(1024, 576);
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 400);

  box = loadImage("box.png");
  end = loadImage("end.png");

  waterWheel(510, 330);
  kaiheisouti(550, 130);
  seesaw(850, 295);
  right(700, 330);
  BallDrop(300, 150);
  Left(200, 400);
  BeltConveyor(285, 530);

  for (int i = 0; i < 15; i++) {
    FCircle circle = new FCircle(15);
    circle.setDensity(400);
    circle.setPosition(220+random(-20, 20), 100);
    addbody(circle, false, (int)random(cs.length));
  }

  for (int i = 0; i < 15; i++) {
    FCircle circle = new FCircle(17);
    circle.setDensity(200);
    circle.setPosition(870+random(-10, 10), -15);
    addbody(circle, false, (int)random(cs.length));
  }

  switchBall = new FCircle(20);
  switchBall.setPosition(946, 258);
  switchBall.setDensity(1);
  switchBall.setRestitution( 0);
  addbody(switchBall, false, 4);

  noStroke();
  textSize(20);
}

int t = 0;
void draw() {
  background(255, 252, 240); 
  world.step();
  world.draw();
  //edit.disp(180,250);
  //edit.draw(mousePressing);

  powerUnit.move(0.5);
  if (switchBall.getY() > 540) {
    beltisMove = true;
    open = true;
  }
  if (open && PU2.haguruma.getRotation() < radians(180))PU2.move(3);
  if (beltisMove) {
    fill(#39C1A5);
    for (int i = 0; i < powerUnits.length; i++) {
      powerUnits[i].move(-1);
    }
    text("ON", 679, 468);
    text("ON", 314, 270);
  } else {
    removeCircle();
    fill(#E0303E);
  }

  ellipse(693, 484, 20, 20);
  ellipse(329, 286, 20, 20);

  fill(255, 180, 57);
  image(box, leterBox.getX()-50, leterBox.getY()-30);

  ending();
}

int num = 0;
void keyPressed() {
  edit.keyCount();
  if (key == ' ') {
    powerUnit.haguruma.setPosition(powerUnit.jx, powerUnit.jy);
    world.removeBody(geartome);
  }
  num = int(key-48);
  println(num);
}

void mousePressed() {
  println(mouseX, mouseY);
  //edit.mPressed();
  // mousePressing = true;
}

void mouseReleased() {
  //edit.mReleased();
  //mousePressing = false;
}

void removeCircle() {
  for (int i = 430; i < 520; i++) {
    for (int j = 470; j < 500; j++) {
      FBody body = world.getBody(i, j);
      if (body != null && body.getClass() == switchBall.getClass())
        world.removeBody(body);
    }
  }
}

int ix = 0-400, iy = height+500;
boolean move = false;
void ending() {
  image(end, ix, iy);
  if (gearStand.getX() < -310) move =true;
  if (move) {
    ix+=3;
    iy-=2;
  }
}