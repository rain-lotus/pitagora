class FGear {
  FPoly haguruma;
  FMouseJoint joint;
  FDistanceJoint Djoint;
  float norm = 40*10;
  float rad, max, r, R;
  float x, y, jx, jy;
  float speed = 1;
  int numOfTooth;
  int colorNum = 0;

  FGear() {
  }
  FGear(float _x, float _y, int _numOfTooth, int colornum) {
    x = _x;
    y = _y;
    colorNum = colornum;
    numOfTooth = _numOfTooth;
    makeGiar();
    addMouseJoint();
  }
  FGear(float _x, float _y, float _jx, float _jy, int _numOfTooth, int colornum) {
    x = _x;
    y = _y;
    jx = _jx;
    jy = _jy;
    colorNum = colornum;
    numOfTooth = _numOfTooth;
    makeGiar();
    addDistanceJoint();
  }

  void makeGiar() {
    //中心のジョイントつきで自力で動かない歯車を作る関数
    haguruma = haguruma(numOfTooth);
    haguruma.setPosition(x, y);
    haguruma.setNoStroke();
    haguruma.setFillColor(cs[colorNum]);
  }

  void addMouseJoint() {
    int jointc = colorNum+1;
    jointc = jointc%5;
    joint = new FMouseJoint(haguruma, x, y);
    joint.setStrokeWeight(4);
    joint.setStrokeColor(cs[jointc]);
    world.add(haguruma);
    world.add(joint);
  }

  void addDistanceJoint() {
    int jointc = colorNum+1;
    jointc = jointc%5;
    
    FCircle point = new FCircle(8);
    point.setPosition(jx, jy);
    addbody(point, true, jointc);

    Djoint = new FDistanceJoint(haguruma, point);
    Djoint.setLength(sqrt(sq(jx-x)+sq(jy-y)));
    Djoint.setStrokeWeight(4);
    Djoint.setStrokeColor(cs[jointc]);
    world.add(haguruma);
    world.add(Djoint);
  }

  void move() {
    haguruma.setRotation(radians(rad));
    rad+=speed;
  }

  void move(float Speed) {
    haguruma.setRotation(radians(rad));
    rad+=Speed;
  }

  void Calculation(int numOfTooth) {
    rad = 360.0/(4.0*numOfTooth);
    max = rad*4;
    r = norm/rad;
    R = r;
  }

  FPoly haguruma(int numOfTooth) {
    Calculation(numOfTooth);
    //歯の数を指定するとちょうどいい大きさの歯車を作ってくれる関数  
    FPoly result = new FPoly();
    for (float i = 0; i < 360; i += rad) {
      if (i % max < rad+2) R = r;
      else R = r - 10;
      result.vertex(R*cos(radians(i)), R*sin(radians(i)));
    }  
    return result;
  }
}

void gParts1(FGear gear, float y) {
  float x = gear.x+gear.r;

  FPoly result;
  result = new FPoly();
  result.vertex(0, 0);
  result.vertex(0, 30);
  for (int i = 0; i < 4*4; i++) {
    if (i%4 < 2) result.vertex(-10, 35+6*i);
    else result.vertex(0, 35+6*i);
  }
  result.vertex(0, 35+6*4*4+20);
  result.vertex(20, 35+6*4*4+20);

  result.vertex(20, 35+6*4*4+20-50);
  result.vertex(55, 35+6*4*4+20-50);
  result.vertex(55, 35+6*4*4+20-55);
  result.vertex(30, 35+6*4*4+20-75);
  result.vertex(20, 35+6*4*4+20-75);

  result.vertex(20, 0);

  result.setPosition(x, y);
  addbody(result, false, 2);
}

void addbody(FBody body, boolean setStatick, int colorNum) {
  if (setStatick) body.setStatic(true);
  body.setFillColor(cs[colorNum]);
  body.setNoStroke();
  world.add(body);
}

FPoly endBox() {
  FPoly leterBox = new FPoly();
  leterBox.vertex(-50, -30);
  leterBox.vertex(-50, 30);
  leterBox.vertex(50, 30);
  leterBox.vertex(50, -30);
  leterBox.vertex(45, -30);
  leterBox.vertex(45, 25);
  leterBox.vertex(-45, 25);
  leterBox.vertex(-45, -30);
  leterBox.setName("leterBox");
  leterBox.setFriction(0);
  leterBox.setDensity(100);
  return leterBox;
}

FPoly gparts2() {
  int numOfTooth = 13;
  FPoly gParts2 = new FPoly();
  gParts2.vertex(0, 0);
  gParts2.vertex(0, 30);
  for (int i = 0; i < 4*numOfTooth; i++) {
    if (i%4 < 2) gParts2.vertex(-10, 35+6*i);
    else gParts2.vertex(0, 35+6*i);
  }
  gParts2.vertex(0, 35+6*4*numOfTooth+20);
  gParts2.vertex(20, 35+6*4*numOfTooth+20);

  gParts2.vertex(20, 60);
  gParts2.vertex(60, 60);
  gParts2.vertex(60, 50);
  gParts2.vertex(20, 50);

  gParts2.vertex(20, 40);
  gParts2.vertex(60, 40);
  gParts2.vertex(60, 30);
  gParts2.vertex(20, 30);

  gParts2.vertex(20, 0);
  gParts2.setRotation(-PI/2);
  gParts2.setFriction(0);
  return gParts2;
}

FPoly Bswitch() {
  FPoly result = new FPoly();
  result.vertex(-70, 5);
  result.vertex(-70, -45);
  result.vertex(-65, -45);
  result.vertex(-65, -10);
  result.vertex(-25, -10);
  result.vertex(-25, -45);
  result.vertex(-20, -45);
  result.vertex(-20, -5);
  result.vertex(55, -5);
  result.vertex(70, -45);
  result.vertex(75, -45);
  result.vertex(60, 5);

  return result;
}