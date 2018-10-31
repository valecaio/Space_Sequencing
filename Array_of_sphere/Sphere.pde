class Sphere { //<>//
  float x; 
  float y;
  float r;

  float Yspeed;
  float acceleration;

  //link to the animation of the planets
  boolean hasJustBounced;

  // 0. Shpere receives a reference to the Planet it is bouncing on.
  Sphere (float tempX, float tempY, float tempR, float g) {
    x = tempX;
    y = tempY;
    r = tempR;
    acceleration = g / 40;
    Yspeed = 1;
    hasJustBounced = false;
  }

  void display () {
    stroke(255);
    strokeWeight(2);
    fill(255);
    ellipse(x, y, r, r);
  }

  void bounce () {

    y = y + Yspeed + acceleration/2;
    Yspeed = Yspeed + acceleration;


    if (y > (height/2-(r/2)) ) {

      //Rallenta leggermente alla fine della finestra
      Yspeed = Yspeed * -1;
      //y = (height/2-(r/2));
    }

    hasJustBounced = false;
    //Play!!
    //mercury
    if (y > (height/2-(r/2)-1) && (x > xPlan && x < xPlan+100)) {
      file.play();
      file.rate(r/10);
      file.pan(-1);
      acceleration = 0.37;
      hasJustBounced = true;
    } 
    //venus
    else if (y > (height/2-(r/2)-1) && (x > xPlan+100 && x < xPlan+200)) {
      file2.play();
      file2.rate(r/10);
      file2.pan(-0.75);
      acceleration = 0.887;
      hasJustBounced = true;
    } 

    //earth
    else if (y > (height/2-(r/2)-1) && (x > xPlan+200 && x < xPlan+300)) {
      file3.play();
      file3.rate(r/10);
      file3.pan(-0.5);
      acceleration = 0.980;
      hasJustBounced = true;
    } 

    // mars
    else if (y > (height/2-(r/2)-1) && (x > xPlan+300 && x < xPlan+400)) {
      file4.play();
      file4.rate(r/10);
      file4.pan(-0.25);
      acceleration = 0.371;
      hasJustBounced = true;
    } 

    //jupiter
    else if (y > (height/2-(r/2)-1) && (x > xPlan+400 && x < xPlan+500)) {
      file5.play();
      file5.rate(r/10);
      file5.pan(0.25);
      acceleration = 2.479;
      hasJustBounced = true;
    }

    //saturn
    else if (y > (height/2-(r/2)-1) && (x > xPlan+500 && x < xPlan+600)) {
      file6.play();
      file6.rate(r/10);
      file6.pan(0.5);
      acceleration = 1.044;
      hasJustBounced = true;
    }

    //uranus
    else if (y > (height/2-(r/2)-1) && (x > xPlan+600 && x < xPlan+700)) {
      file7.play();
      file7.rate(r/10);
      file7.pan(0.75);
      acceleration = 0.887;
      hasJustBounced = true;
    }

    //neptune
    else if (y > (height/2-(r/2)-1) && (x > xPlan+700 && x < xPlan+800)) {
      file8.play();
      file8.rate(r/10);
      file8.pan(1);
      acceleration = 1.115;
      hasJustBounced = true;
    }
  }
}