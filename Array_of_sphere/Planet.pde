class Planet {
  float x, y; 
  float tempxpos, tempypos; 

  int w;
  int h;

  //a boolean keeps track of the object state
  boolean over;
  int me;
  Planet[] friends;

  //text variables
  int yTesto = 60;

  //animations
  Sphere sphere;
  float timeSinceLastBounce = 0.0; // Seconds
  float lastTime = 0.0; // Number of seconds since execution of the previous frame;
  int totalNumberOfBounces = 0;
  float totalAnimationTime = 0.15;
  float life=255;






  Planet (float x_, float y_, int w_, int h_, Planet[] others, int id) {
    this.x = tempxpos = x_;
    y  = tempypos = y_;
    x= x_;
    y = y_;
    w = w_;
    h = h_;
    me = id;

    sphere = null;
    friends = others;
  }



  void update () {
    if (overEvent() && !otherOver()) { 
      over = true;
    } else { 
      over = false;
    }


    if (sphere == null) {
      return;
    }

    float currTime = float(millis()) / 1000.0;
    timeSinceLastBounce += currTime - lastTime;
    lastTime = currTime;
    if (totalNumberOfBounces == 0) {
      timeSinceLastBounce = 0.0;
    }
    if (sphere.hasJustBounced) {
      totalNumberOfBounces++; // totalNumberOfBounces = totalNumberOfBounces + 1;
      timeSinceLastBounce = 0.0;
    }
  }


  // Text to see if mouse is over this planet
  boolean overEvent() {
    float mx = mouseX;
    float my = mouseY;
    if ((mx > x && mx < x + w) && 
      (my > y && my < y + h)  ) {
      return true;
    } else {
      return false;
    }
  }

  // Make sure no other planets are active
  boolean otherOver() {
    for (int i=0; i<planets.length; i++) {
      if (i != me) {
        if (friends[i].over == true) {
          return true;
        }
      }
    }
    return false;
  }



  void displayAnimation () {

    pushMatrix();
    if (this.me == 0) {
      mercury();
    } else if (this.me == 1) {
      venus();
    } else if (this.me == 2) {
      earth();
    } else if (this.me == 3) {
      mars();
    } else if (this.me == 4) {
      jupiter();
    } else if (this.me == 5) {
      saturn();
    } else if (this.me == 6) {
      uranus();
    } else if (this.me == 7) {
      neptune();
    } 
    popMatrix();



    if ((planets[0].over) && !otherOver()) {
      fill(0, 255, 0);
    } else if ((planets[1].over) && !otherOver() ) {
      fill(0, 255, 0);
    } else if ((planets[2].over) && !otherOver() ) {
      fill(0, 255, 0);
    } else if ((planets[3].over) && !otherOver() ) {
      fill(0, 255, 0);
    } else if ((planets[4].over) && !otherOver() ) {
      fill(0, 255, 0);
    } else if ((planets[5].over) && !otherOver() ) {
      fill(0, 255, 0);
    } else if ((planets[6].over) && !otherOver() ) {
      fill(0, 255, 0);
    } else if ((planets[7].over) && !otherOver() ) {
      fill(0, 255, 0);
    } else {
      noFill();
      strokeWeight(3);
    }

    stroke(255);
    rect(x, y, w, h);
  }



  //info planets
  //mercury
  void txt0 () {
    if ((planets[0].over) && !otherOver() ) {
      fill(0, 255, 0);
    } else {
      fill(255);
    }
    textAlign(LEFT);
    textFont(b);
    text("Mercury", 20, 50+yTesto);
    textFont(t);
    text("Gravity:3,7 m/s²\nMass:3.3011×1023 kg[8]", 20, 70+yTesto);
  }


  //venus
  void txt1 () {
    if ((planets[1].over) && !otherOver() ) {
      fill(0, 255, 0);
    } else {
      fill(255);
    }
    textAlign(LEFT);
    textFont(b);
    text("Venus", 20, 120+yTesto);
    textFont(t);
    text("Gravity:8,87 m/s²\nMass:4.8675×1024 kg[6]", 20, 140+yTesto);
  }
  

  //earth
  void txt2 () {
    if ((planets[2].over) && !otherOver() ) {
      fill(0, 255, 0);
    } else {
      fill(255);
    }
    textAlign(LEFT);
    textFont(b);
    text("Earth", 20, 190+yTesto);
    textFont(t);
    text("Gravity:9,807 m/s²\nMass:5.97237×1024 kg", 20, 210+yTesto);
  }
  

  //mars
  void txt3 () {
    if ((planets[3].over) && !otherOver() ) { 
      fill(0, 255, 0);
    } else {
      fill(255);
    }
    textAlign(LEFT);
    textFont(b);
    text("Mars", 20, 260+yTesto);
    textFont(t);
    text("Gravity:3,711 m/s²\nMass:6.4171×1023 kg", 20, 280+yTesto);
  }


  //jupiter
  void txt4 () {
    if ((planets[4].over) && !otherOver() ) {
      fill(0, 255, 0);
    } else {
      fill(255);
    }
    textAlign(LEFT);
    textFont(b);
    text("Jupiter", 20, 330+yTesto);
    textFont(t);
    text("Gravity:24,79 m/s²\nMass:1.8982×1027 kg", 20, 350+yTesto);
  }

  //saturn
  void txt5 () {
    if ((planets[5].over) && !otherOver() ) {
      fill(0, 255, 0);
    } else {
      fill(255);
    }
    textAlign(LEFT);
    textFont(b);
    text("Saturn", 20, 400+yTesto);
    textFont(t);
    text("Gravity:10,44 m/s²\nMass:5.6834×1026 kg", 20, 420+yTesto);
  }


  //uranus
  void txt6 () {
    if ((planets[6].over) && !otherOver() ) {
      fill(0, 255, 0);
    } else {
      fill(255);
    }
    textAlign(LEFT);
    textFont(b);
    text("Uranus", 20, 470+yTesto);
    textFont(t);
    text("Gravity:8,87 m/s²\nMass:8.6810±0×1025 kg", 20, 490+yTesto);
  }


  //neptune
  void txt7 () {
    if ((planets[7].over) && !otherOver() ) {
      fill(0, 255, 0);
    } else {
      fill(255);
    }
    textAlign(LEFT);
    textFont(b);
    text("Neptune", 20, 540+yTesto);
    textFont(t);
    text("Gravity:11, 15 m/s²\nMass:1.0243×1026 kg[4]", 20, 560+yTesto);
  }



  //planet animations
  void mercury() {
    if (sphere == null) {
      return;
    }
    pushMatrix();
    if (sphere.hasJustBounced) {
      println();
      stroke(255);
      strokeWeight(4);
      line(xPlan-15, height/2+15, xPlan-16, height/2+75);
    } else {
      stroke(0);
      strokeWeight(0);
    }
    popMatrix();
  }
  
  

  void venus() {
    if (sphere == null) {
      return;
    }
    pushMatrix();
    if (sphere.hasJustBounced) {
      stroke(255);
      strokeWeight(4);
      line(xPlan+115, height/2+70, xPlan+150, height/2+70);
      line(xPlan+115, height/2+70, xPlan+115, height/2+35);
    } else {
      stroke(0);
      strokeWeight(0);
    }
    popMatrix();
  }



  void earth() {
    if (sphere == null) {
      return;
    }
    pushMatrix();
    if (sphere.hasJustBounced) {
      stroke(255);
      strokeWeight(4);
      noFill();
      rect(x+20, y+20, w-40, h-40);
    } 
    popMatrix();
  }



  void mars() {
    if (sphere == null) {
      return;
    }
    pushMatrix();
    if (sphere.hasJustBounced) {
      stroke(255);
      strokeWeight(4);
      line(xPlan+325, height/2+30, xPlan+355, height/2+60);
      line(xPlan+355, height/2+30, xPlan+325, height/2+60);
    } 
    popMatrix();
  }



  void jupiter() {
    if (sphere == null) {
      return;
    }
    pushMatrix();
    if (sphere.hasJustBounced) {
      stroke(255);
      strokeWeight(7);
      point(xPlan+440, height/2+25);
      point(xPlan+440, height/2+45);
      point(xPlan+440, height/2+65);
    } 
    popMatrix();
  }



  void saturn() {
    if (sphere == null) {
      return;
    }
    pushMatrix();
    if (sphere.hasJustBounced) {
      stroke(255);
      strokeWeight(4);
      line(xPlan+520, height/2+45, xPlan+560, height/2+45);
    } 
    popMatrix();
  }



  void uranus() {
    if (sphere == null) {
      return;
    }
    pushMatrix();
    if (sphere.hasJustBounced) {
      stroke(255);
      strokeWeight(4);
      noFill();
      arc(xPlan+640, height/2+40, 40, 40, 0, HALF_PI*2, OPEN);
    } 
    popMatrix();
  }



  void neptune() {
    if (sphere == null) {
      return;
    }
    pushMatrix();
    if (sphere.hasJustBounced) {
      stroke(255);
      strokeWeight(4);
      line(xPlan+795, height/2+15, xPlan+795, height/2+75);
    } 
    popMatrix();
  }
}