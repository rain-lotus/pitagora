class FEdit {
  color []c = {color(255, 0, 0), color(0, 255, 0), color(0, 0, 255), color(0), color(100)};
  int n = 4;
  int x, y;
  float bodyrotation;
  FBody body;

  FBox box;
  FCircle circle;

  void disp(int x, int y) {
    fill(c[n]);
    rect(x, y, 50, 50);
  }

  void keyCount() {
    if (keyCode == ENTER) encode(200, 400);
    else {
    //  n++;
    //  n = n % c.length;
    }
  }

  void encode(float x, float y) {
    int count = 0;
    for (int i = 0; i < world.getBodies().size(); i++) {
      FBody recievedBody = (FBody)world.getBodies().get(i);      
      
      String type = world.getBodies().get(i).getClass().getTypeName().substring(7); 
      float posx = recievedBody.getX()-x;
      float posy = recievedBody.getY()-y;
      float rad = recievedBody.getRotation();
      String name = recievedBody.getName();

      if (type.equals("FBox")) {
        FBox box = (FBox)recievedBody;
        float sx = box.getWidth();
        float sy = box.getHeight();
        if (name == null) {
          name = "box"+count;
          println(type+" "+name+" = new "+type+"("+sx+","+sy+");");
          println(name+".setPosition(x+"+posx+",y+"+posy+");");
          println(name+".setRotation("+rad+");");
          println(name+".setName("+char(34)+name+char(34)+");");
          println("addbody("+name+",true,(int)random(cs.length));");
        }

        count++;
      } /*else if (type.equals("FCircle")) {
       FCircle circle = (FCircle)recievedBody;
       float r = circle.getSize();
       if (name == null) {
       name = "circle"+count;
       println(type+" "+name+" = new "+type+"("+r+");");
       println(name+".setPosition("+posx+","+posy+");");
       println(name+".setName("+char(34)+name+char(34)+");");
       println("world.add("+name+");");
       }
       }*/
      /*else if (type.equals("FPoly")) {
       FPoly box = (FPoly)recievedBody;
       if (name == null) name = "poly"+count;
       println("//////////////////");
       println(name+".setPosition("+posx+","+posy+");");
       println(name+".setRotation("+rad+");");
       println(name+".setStatic(true);");
       println("//////////////////");
       count++;
       }*/
    }
  }

  void mPressed() {
    x = mouseX;
    y = mouseY;
    //body = world.getBody(mouseX, mouseY+100); 
    body = world.getBody(mouseX, mouseY);
    if (body != null) bodyrotation = body.getRotation();
    if (n == 3) {
      FBody removebody = world.getBody(mouseX, mouseY); 
      world.removeBody(removebody);
    }

    fill(255, 0, 0);
    if (world.getBody(mouseX, mouseY) != null) {
      //ポジションが一瞬見える
      ellipse(world.getBody(mouseX, mouseY).getX(), world.getBody(mouseX, mouseY).getY(), 10, 10);
      //クリックしたbodyの詳細を表示
      FBody body = world.getBody(mouseX, mouseY);
      println("name:"+body.getName());
      println("position:"+body.getX(), body.getY());
      //if (num < 5) body.setFillColor(cs[num]);
    }
    println(mouseX, mouseY);
  }

  void newBox() {
    if (mouseX - x > 0 && mouseY -y > 0) {
      box = new FBox(abs(mouseX - x), abs(mouseY - y));
      box.setPosition(x+(mouseX - x)/2, y+(mouseY - y)/2);
      box.setStatic(true);
      world.add(box);
    }
  }

  void newBall() {
    circle = new FCircle(15);
    //circle.setFriction(20);
    circle.setDensity(500);
    circle.setPosition(mouseX, mouseY);
    world.add(circle);
  }

  void rotateBody() {
    float rad = atan2(mouseX-body.getX(), mouseY-body.getY());
    body.setRotation(bodyrotation-rad);
  }

  void draw(boolean mousePressing) {
    switch (n) {
    case 0:
      if (mousePressing) {
        fill(255);
        rect(x, y, mouseX-x, mouseY-y);
      }
      break;
    case 2:
      fill(255, 0, 0);
      ellipse(mouseX, mouseY+100, 10, 10);
      if (mousePressing && body != null) rotateBody();
      break;
    }
  }

  void mReleased() {
    switch(n) {
    case 0:
      newBox();
      break;
    case 1:
      newBall();
      break;
    default:
    }
  }
}