void waterWheel(int x, int y) {
  FGear wheel = new FGear(x, y, 9, 0);

  FBox itasoko = new FBox(22.0, 10.0);
  itasoko.setName("itasoko");
  itasoko.setPosition(x+60.0, y+107.0);
  addbody(itasoko, true, 4);

  FBox itamigiue = new FBox(10.0, 100.0);
  itamigiue.setName("itamigiue");
  itamigiue.setPosition(x+66.0, y+-70.0);
  itamigiue.setRestitution(0);
  addbody(itamigiue, true, 4);

  FBox itamigisita = new FBox(10.0, 50.0);
  itamigisita.setName("itamigisita");
  itamigisita.setPosition(x+66.0, y+77.0);
  itamigisita.setRotation(0.0);
  addbody(itamigisita, true, 4);

  FBox kabeRU = new FBox(10.0, 100.0);
  kabeRU.setName("kabeRU");
  kabeRU.setPosition(x+-2.0, y+-95.0);
  kabeRU.setRotation(0.0);
  addbody(kabeRU, true, 4);

  FBox kabeRB = new FBox(10.0, 70.0);
  kabeRB.setName("kabeRB");
  kabeRB.setPosition(x+0.0, y+80.0);
  kabeRB.setRotation(0.0);
  addbody(kabeRB, true, 4);

  FPoly kabe = new FPoly();
  //左にあるカーブしている壁
  kabe.vertex(-100+95*cos(radians(80)), -130*sin(radians(80)));
  for (int i = 80; i >= 0; i-= 10) {
    kabe.vertex(-100+95*cos(radians(i)), -130*sin(radians(i)));
  }
  kabe.vertex(-5, 130);
  kabe.vertex(5, 130);
  for (int i = 0; i <= 80; i+= 10) {
    kabe.vertex(-100+105*cos(radians(i)), -140*sin(radians(i)));
  }
  kabe.setPosition(x+-63.0, y+-15.0);
  addbody(kabe, true, 4);

  gParts1(wheel, y-50);

  FBox itamigi = new FBox(20.0, 40.0);
  itamigi.setPosition(x+106.0, y+30);
  itamigi.setRotation(0.0);
  itamigi.setName("itamigi");
  addbody(itamigi, true, 4);

  FCircle c1 = new FCircle(20);
  c1.setPosition(x+80, y+30);
  c1.setDensity(50);
  c1.setRestitution(0);
  addbody(c1, false, 3);

  FBox hanekaesu = new FBox(75, 10.0);
  hanekaesu.setPosition(x+86.0, y+-148.0);
  hanekaesu.setRotation(5.373857);
  hanekaesu.setRestitution(0);
  hanekaesu.setName("hanekaesu");
  addbody(hanekaesu, true, 0);
}

FGear fgear2;
void kaiheisouti(int x, int y) {
  FGear fgear = new FGear(x-42, y-130, 9, 3);  
  fgear2 = new FGear(x+132, y-125, 12, 1);
  FGear fgear3 = new FGear(x+40, y-157, 12, 0);

  FPoly ballbox = new FPoly();
  ballbox.setName("ballbox");
  ballbox.setPosition(x+13, y+5);
  ballbox.vertex(-50, 60);
  ballbox.vertex(0, 60);
  ballbox.vertex(60, 20);
  ballbox.vertex(60, -15);
  ballbox.vertex(50, -15);
  ballbox.vertex(50, 15);
  ballbox.vertex(0, 50);
  ballbox.vertex(-50, 50);
  ballbox.setRestitution(-1);
  addbody(ballbox, true, 4);

  FBox kabehidari = new FBox(5.0, 93.0);
  kabehidari.setName("kabehidari");
  kabehidari.setPosition(x+-50.0, y+-35.0);
  kabehidari.setRotation(0.0);
  addbody(kabehidari, true, 4);

  FBox kabemigi = new FBox(5.0, 91.0);
  kabemigi.setName("kabemigi");
  kabemigi.setPosition(x+-34.0, y+-35.0);
  kabemigi.setRotation(0.0);
  addbody(kabemigi, true, 4);

  FBox huta = new FBox(10.0, 70.0);
  huta.setName("huta");
  huta.setPosition(x+-42, y+19);
  addbody(huta, false, 3);

  FDistanceJoint joint = new FDistanceJoint(fgear.haguruma, huta);
  joint.setAnchor1(2, 30);
  joint.setAnchor2(0, -30);
  joint.calculateLength();
  joint.setStrokeWeight(4);
  joint.setStrokeColor(cs[4]);
  joint.setFillColor(cs[4]);
  world.add(joint);
}

void seesaw(int x, int y) {  
  FCompound seesaw = new FCompound();
  FBox ita = new FBox(155, 10);
  ita.setPosition(0, 0);
  ita.setName("ita");
  ita.setRestitution(0.8);
  ita.setNoStroke();
  ita.setFillColor(cs[4]);
  seesaw.addBody(ita);
  FBox ball1 = new FBox(10, 20);
  ball1.setPosition(42, -15);
  ball1.setName("ball1");
  ball1.setNoStroke();
  ball1.setFillColor(cs[3]);
  seesaw.addBody(ball1);
  FBox ball2 = new FBox(10, 20);
  ball2.setPosition(72, -15);
  ball2.setName("ball2");
  ball2.setNoStroke();
  ball2.setFillColor(cs[3]);
  seesaw.addBody(ball2);
  seesaw.setPosition(x+38, y);
  world.add(seesaw);

  FMouseJoint j = new FMouseJoint(seesaw, x, y);
  j.setStrokeWeight(4);
  j.setStrokeColor(cs[0]);
  world.add(j);

  FBox itaosae = new FBox(20, 10);
  itaosae.setPosition(x+85, y+30);
  itaosae.setName("itaosae");
  addbody(itaosae, true, 2);
}

void right(int x, int y) {
  for (int i = 0; i < 7; i++) {
    int ColorNum = i%2  == 0 ? 4: 3;
    FBox domino1 = new FBox(9.0, 50.0);
    domino1.setPosition(x+140.0+20*i, y+103.0);
    domino1.setRotation(0.0);
    domino1.setName("domino1");
    domino1.setDensity(50);
    addbody(domino1, false, ColorNum);
  }

  FBox soko = new FBox(140.0, 10.0);
  soko.setPosition(x+200, y+130.0);
  soko.setFriction(100);
  soko.setName("soko");
  addbody(soko, true, 4);

  FBox soko2 = new FBox(30.0, 10.0);
  soko2.setPosition(x+115, y+135.0);
  soko2.setRotation(radians(-15));
  soko2.setName("soko2");
  addbody(soko2, true, 4);

  FBox hanetome = new FBox(55.0, 10.0);
  hanetome.setPosition(x+-46.0, y+-59.0);
  hanetome.setRotation(-5.8858128);
  hanetome.setName("hanetome");
  addbody(hanetome, true, 1);

  FBox saka2 = new FBox(30.0, 10.0);
  saka2.setPosition(x+85.0, y+78.0);
  saka2.setRotation(0.0);
  saka2.setName("saka2");
  addbody(saka2, true, 4);

  FBox saka1 = new FBox(180.0, 10.0);
  saka1.setPosition(x+-8.0, y+44.0);
  saka1.setRotation(-5.8858128);
  saka1.setName("saka1");
  addbody(saka1, true, 3);

  FBox kaitenL = new FBox(10.0, 330.0);
  kaitenL.setPosition(x+300.0, y-30.0);
  kaitenL.setRotation(-6.16055);
  kaitenL.setName("kaitenL");
  addbody(kaitenL, false, 1);

  FMouseJoint j = new FMouseJoint(kaitenL, x+300.0, y-30.0);
  j.setStrokeWeight(4);
  j.setStrokeColor(cs[2]);
  world.add(j);

  FBox osidasu = new FBox(100.0, 20.0);
  osidasu.setPosition(x+265.0, y+-194.0);
  osidasu.setDensity(100);
  osidasu.setFriction(0);
  osidasu.setName("osidasu");
  addbody(osidasu, false, 4);

  FBox osudai = new FBox(115.0, 10.0);
  osudai.setPosition(x+213.0, y+-178.0);
  osudai.setName("osudai");
  osudai.setFriction(0);
  addbody(osudai, true, 2);

  FBox osufuta = new FBox(100.0, 10.0);
  osufuta.setPosition(x+235.0, y+-210.0);
  osufuta.setName("osufuta");
  addbody(osufuta, true, 2);

  FCircle c2 = new FCircle(15);
  c2.setPosition(895, 130);
  c2.setDensity(100);
  c2.setRestitution(0);
  c2.setName("c2");
  addbody(c2, false, 3);

  FBox osae2 = new FBox(90, 10.0);
  osae2.setPosition(x+-55.0, y+-100.0);
  osae2.setRotation(8.301054);
  osae2.setName("osae2");
  osae2.setRestitution(-1);
  addbody(osae2, true, 1);

  FBox yuka2 = new FBox(200.0, 10.0);
  yuka2.setPosition(x+223.0, y+209.0);
  yuka2.setFriction(10);
  yuka2.setName("yuka2");
  addbody(yuka2, true, 4);

  for (int i = 0; i < 8; i++) {
    int ColorNum = i%2  == 0 ? 4: 3;
    FBox domino1 = new FBox(9.0, 50-i*4.0);
    domino1.setPosition(x+145.0+20*i, y+170.0);
    domino1.setName("domino1");
    domino1.setDensity(40-i*2);
    addbody(domino1, false, ColorNum);
  }

  FBox mawaritome = new FBox(13.0, 12.0);
  mawaritome.setPosition(x+159.0, y+22.0);
  mawaritome.setRotation(0.0);
  mawaritome.setName("mawaritome");
  addbody(mawaritome, true, 2);

  FBox sakaTop = new FBox(199.0, 10.0);
  sakaTop.setPosition(x+34.0, y+-242.0);
  sakaTop.setRotation(5.9638762);
  sakaTop.setName("sakaTop");
  addbody(sakaTop, true, 0);

  FPoly ballbox = new FPoly();
  ballbox.vertex(-75, 50);
  ballbox.vertex(-75, -50);
  ballbox.vertex(75, -50);
  ballbox.vertex(75, 50);
  ballbox.vertex(65, 50);
  ballbox.vertex(65, -40);
  ballbox.vertex(-65, -40);
  ballbox.vertex(-65, 50);
  ballbox.setPosition(x+180, y-360);
  addbody(ballbox, true, 0);

  FBox bboxB = new FBox(150, 5);
  bboxB.setPosition(x+180, y-285);
  bboxB.setName("bboxB");
  bboxB.setFriction(0);
  addbody(bboxB, true, 0);

  FBox bboxM = new FBox(140, 20);
  bboxM.setPosition(x+180, y-299);
  bboxM.setName("bboxM");
  addbody(bboxM, false, 4);

  FDistanceJoint open = new FDistanceJoint(osidasu, fgear2.haguruma);
  open.setAnchor1(-45, 0);
  open.setAnchor2(50, -20);
  open.calculateLength();
  open.setStrokeWeight(4);
  open.setStrokeColor(cs[2]);
  world.add(open);

  FDistanceJoint open2 = new FDistanceJoint(bboxM, fgear2.haguruma);
  open2.setAnchor1(-60, 0);
  open2.setAnchor2(-44, -1);
  open2.calculateLength();
  open2.setStrokeWeight(4);
  open2.setStrokeColor(cs[2]);
  world.add(open2);
}

FGear powerUnit;
void Left(int x, int y) {
  powerUnit = new FGear(x, y+50, x, y, 10, 3);
  powerUnit.haguruma.setStatic(true);

  FGear g52 = new FGear(x-88, y-50, 15, 4);
  FGear g53 = new FGear(x-185, y-18, 10, 0);
  FGear g54 = new FGear(x-190, y-155, 20, 1);
}

FBox geartome;
void BallDrop(int x, int y) {
  FBox hakoL = new FBox(10.0, 70.0);
  hakoL.setPosition(x-133.0, y-45);
  hakoL.setName("hakoL");
  addbody(hakoL, true, 2);

  FBox hakoB = new FBox(130.0, 10.0);
  hakoB.setPosition(x-67, y-10);
  hakoB.setRotation(radians(10));
  hakoB.setName("hakoB");
  addbody(hakoB, true, 2);  

  FBox hakoT = new FBox(120.0, 10.0);
  hakoT.setPosition(x-68, y-75);
  hakoT.setName("hakoT");
  addbody(hakoT, true, 2);

  FBox hakoR = new FBox(13.0, 85.0);
  hakoR.setPosition(x, y-35);
  hakoR.setName("hakoR");
  addbody(hakoR, false, 0);

  FMouseJoint tj = new FMouseJoint(hakoR, x, y);
  tj.setStrokeWeight(4);
  tj.setStrokeColor(cs[0]);
  world.add(tj);

  FGear g71 = new FGear(x-250, y-47, 15, 3);

  FDistanceJoint joint = new FDistanceJoint(g71.haguruma, hakoR);
  joint.setAnchor1(-55, 8);
  joint.setAnchor2(0, -30);
  joint.setLength(280);
  joint.setStrokeWeight(4);
  joint.setStrokeColor(cs[0]);
  world.add(joint);

  FGear g72 = new FGear(x-250, y-150, 10, 1);

  geartome = new FBox(10, 10);
  geartome.setPosition(x-305, y-80);
  addbody(geartome, true, 0);
}

FGear [] powerUnits = new FGear[8];
FGear PU2;
FPoly gearStand, leterBox;

void BeltConveyor(int x, int y) {
  for (int i = 0; i < powerUnits.length; i++) {
    int colorNum;
    if (i%2 == 0) colorNum = 1;
    else colorNum = 2;
    powerUnits[i] = new FGear(x-380+i*100, y+50, 10, colorNum);
    powerUnits[i].haguruma.setRotation(radians(9));
  }

  gearStand = gparts2();
  gearStand.setPosition(x, y);
  addbody(gearStand, false, 4);

  leterBox = endBox();
  leterBox.setPosition(x+200, y-48);
  addbody(leterBox, false, 2);

  FDistanceJoint j1 = new FDistanceJoint(gearStand, leterBox);
  j1.setAnchor1(13, 150);
  j1.setAnchor2(-50, 28);
  j1.setStrokeWeight(4);
  j1.setStrokeColor(cs[2]);
  j1.setLength(10);
  world.add(j1);

  FDistanceJoint j2 = new FDistanceJoint(gearStand, leterBox);
  j2.setAnchor1(13, 250);
  j2.setAnchor2(50, 28);
  j2.setStrokeWeight(4);
  j2.setStrokeColor(cs[2]);
  j2.setLength(10);
  world.add(j2);

  FBox Key = new FBox(10, 60);
  Key.setPosition(x+45, y-45);
  addbody(Key, false, 2);

  PU2 = new FGear(x+45, y-150, 10, 2);
  PU2.haguruma.setRotation(radians(8));

  FDistanceJoint j3 = new FDistanceJoint(Key, PU2.haguruma);
  j3.setAnchor1(0, -23);
  j3.setAnchor2(8, 38);
  j3.setStrokeColor(cs[4]);
  j3.setStrokeWeight(4);
  j3.calculateLength();
  j3.setFrequency(100);
  world.add(j3);
  PU2.haguruma.setStatic(true);

  FBox slope = new FBox(35, 10);
  slope.setPosition(x+485, y+3);
  slope.setName("Slope");
  slope.setRotation(radians(-16));
  addbody(slope, true, 0);

  FBox slope2 = new FBox(70, 10);
  slope2.setPosition(x+470, y+20);
  slope2.setName("slope2");
  slope2.setRotation(radians(-16));
  addbody(slope2, true, 0);

  FBox slope3 = new FBox(15, 10);
  slope3.setPosition(x+442, y+16);
  slope3.setName("slope3");
  slope3.setRotation(radians(-16));
  addbody(slope3, true, 0);

  FGear g10 = new FGear(x+460, y+150, 15, 2);

  FBox osu1 = new FBox(10, 30);
  osu1.setPosition(x+542, y-11.5);
  osu1.setName("osu1");
  osu1.setDensity(50);
  addbody(osu1, false, 3); 

  FDistanceJoint josu = new FDistanceJoint(g10.haguruma, osu1);
  josu.setAnchor1(55, -30);
  josu.setAnchor2(0, 10);
  josu.setFrequency(10);
  josu.setStrokeWeight(4);
  josu.setStrokeColor(cs[4]);
  josu.setLength(110);

  world.add(josu);

  FPoly osu2 = new FPoly();
  osu2.vertex(-20, -47);
  osu2.vertex(-20, -20);
  osu2.vertex(-5, -20);
  osu2.vertex(-5, 20);
  osu2.vertex(5, 20);
  osu2.vertex(5, -20);
  osu2.vertex(20, -20);
  osu2.vertex(20, -47);
  osu2.vertex(15, -47);
  osu2.vertex(15, -25);
  osu2.vertex(-15, -25);
  osu2.vertex(-15, -47);
  osu2.setPosition(x+410, y+85);
  addbody(osu2, false, 3);

  FBox osukabe3 = new FBox(10, 10);
  osukabe3.setPosition(x+400, y+70);
  osukabe3.setName("osukabe3");
  osukabe3.setFriction(30);
  addbody(osukabe3, true, 2); 

  FBox osukabe4 = new FBox(10, 10);
  osukabe4.setPosition(x+420, y+70);
  osukabe4.setName("osukabe4");
  osukabe4.setFriction(30);
  addbody(osukabe4, true, 2); 

  FDistanceJoint josu2 = new FDistanceJoint(g10.haguruma, osu2);
  josu2.setAnchor1(-53, -10);
  josu2.setAnchor2(0, 30);
  josu2.setStrokeWeight(4);
  josu2.setStrokeColor(cs[4]);
  josu2.calculateLength();
  world.add(josu2);

  FBox huta = new FBox(28, 3);
  huta.setPosition(x+410, y+38);
  huta.setName("huta");
  huta.setFriction(30);
  addbody(huta, true, 4);
}