Sphere[] spheres = new Sphere[50];
Planet[] planets = new Planet[8];

float r;
int totalSpheres = 0;
int numPlanet = 8;

final int xPlan = 250;
final int distanceBetweenPlanets = 100;
final int xPlanRight = xPlan + distanceBetweenPlanets * planets.length;


boolean green =false;

//importing sounds
import processing.sound.*;

SoundFile file;
SoundFile file2;
SoundFile file3;
SoundFile file4;
SoundFile file5;
SoundFile file6;
SoundFile file7;
SoundFile file8;


//font variables
PFont b; //bold
PFont reg; //regular
PFont t; //thin
int yTesto = 60;


//buttons
int ybuttonpos =-120;
boolean buttonOver1 = false;
boolean buttonOver2 = false;
boolean buttonOver3 = false;
boolean buttonOver4 = false;
boolean buttonOver5 = false;
boolean buttonOver6 = false;
int circleY =350+ybuttonpos;
int circle2Y =420+ybuttonpos;
int circle3Y =490+ybuttonpos;
int circle4Y =560+ybuttonpos;
int circle5Y =630+ybuttonpos;
int circle6Y =700+ybuttonpos;

color selectedCircle = color(0, 255, 0);
color currentColor1 = color(0);
color currentColor2 = color(0);
color currentColor3 = color(0);
color currentColor4 = color(0);
color currentColor5 = color(0);
color currentColor6 = color(0);

int circleSize = 20;
int circleX = 1220;


void setup () {
  size(1280, 750);
  //size(500, 500);
  r=0;


  //initializing planets
  planets[0] = new Planet(xPlan, height/2+5, 80, 80, planets, 0);
  planets[1] = new Planet(xPlan+100, height/2+5, 80, 80, planets, 1);
  planets[2] = new Planet(xPlan+200, height/2+5, 80, 80, planets, 2);
  planets[3] = new Planet(xPlan+300, height/2+5, 80, 80, planets, 3);
  planets[4] = new Planet(xPlan+400, height/2+5, 80, 80, planets, 4);
  planets[5] = new Planet(xPlan+500, height/2+5, 80, 80, planets, 5);
  planets[6] = new Planet(xPlan+600, height/2+5, 80, 80, planets, 6);
  planets[7] = new Planet(xPlan+700, height/2+5, 80, 80, planets, 7);

  //initializing sounds
  file = new SoundFile(this, "Clap [ zip ].wav");
  file2 = new SoundFile(this, "DMV3_Vox 7.wav");
  file3 = new SoundFile(this, "Funky Cm7 [c ebm g bbm].wav");
  file4 = new SoundFile(this, "Hi Hat [ zone ].wav");
  file5 = new SoundFile(this, "Open Hat [ lazer ].wav");
  file6 = new SoundFile(this, "Pad Stab.wav");
  file7 = new SoundFile(this, "Pray Riser.wav");
  file8 = new SoundFile(this, "The Champion Snare 01.wav");


  //create the font
  printArray(PFont.list());
  b = createFont("SuisseIntlMono-Bold", 12);
  reg = createFont("SuisseIntlMono-Regular", 11);
  t = createFont("SuisseIntlMono-Thin", 11);
}



void draw () {
  noStroke();
  fill(0, 99.99);
  rect(0, 0, width, height);
  buttonUpdate(mouseX, mouseY);


  //background grid
  pushMatrix();
  translate(mouseX*0.01, mouseY*0.01);
  for (int i = 0; i < width +50; i = i +80) {
    for (int j = -30; j < height + 50; j = j+80) {
      stroke(90);
      strokeWeight(3);    
      point(i, j);
    }
  }
  popMatrix();




  //top text 
  textAlign(CENTER);
  fill(255);
  textFont(b);
  text("SPACE SEQUENCING", width/2+5, 30);

  //bottom text -- instructions
  textFont(reg);
  String instruction2 = "Make the circle bounce over the planet and create you own music. Press any key to reset.";
  text(instruction2, width/2-180, height-45, 380, 100);




  //right text
  textAlign(RIGHT);
  textFont(reg);
  text("Set 01", width-40, 330+ybuttonpos);
  text("Set 02", width-40, 400+ybuttonpos);
  text("Set 03", width-40, 470+ybuttonpos);
  text("Set 04", width-40, 540+ybuttonpos);
  text("Set 05", width-40, 610+ybuttonpos);
  text("Set 06", width-40, 680+ybuttonpos);




  //date
  fill(255);
  int d = day();    // Values from 1 - 31
  int m = month();  // Values from 1 - 12
  int y = year();   // 2003, 2004, 2005, etc.
  String date = String.valueOf(d);
  date = String.valueOf(m);
  date = String.valueOf(y);
  date = d + "-" + m + "-" + y;
  textAlign(CENTER);
  text(date, width/2+5, 50);




  //clock
  int sec = second();
  int mins = minute();
  int hr = hour();
  String om = "";
  String o = "";
  if (mins < 10) om = "0";
  else om = "";
  if (sec < 10) o = "0";
  else o = "";
  String time = hr+":"+mins+":"+sec;
  if (hour() > 24) hr-=24;
  else hr = hour();
  time = hr + ":" + om + mins + ":" +  o +sec;
  textAlign(CENTER);
  text(time, width/2+5, 70);




  // display planets
  for (int i = 0; i < numPlanet; i++) {
    pushMatrix();
    translate(mouseX*0.01, mouseY*0.01);
    planets[i].update();
    planets[i].displayAnimation();
    popMatrix();

    planets[0].txt0();
    planets[1].txt1();
    planets[2].txt2();
    planets[3].txt3();
    planets[4].txt4();
    planets[5].txt5();
    planets[6].txt6();
    planets[7].txt7();
  }




  //using spheres variables
  for (int i = 0; i < totalSpheres; i++) {
    pushMatrix();
    translate(mouseX*0.01, mouseY*0.01);
    spheres[i].display();
    spheres[i].bounce();
    popMatrix();
  }




  //growing radius when mouse is pressed 
  //non creare sfere sottola metà schermo
  if (mousePressed && (mouseY<height/2 && mouseY>200) && (mouseX>xPlan && mouseX<width-xPlan)) {  
    noFill();
    ellipse(mouseX, mouseY, r, r);
    r=r+1;

    //limit the radius growth
    if (r >= 60) {
      r = 60;
    }
  }
}





// creating sphere when mouse is released 
//non creare sfere sottola metà schermo
void mouseReleased() {
  if ((mouseY<height/2 && mouseY>200) && (mouseX>xPlan && mouseX<width-xPlan)) {  
    totalSpheres = totalSpheres +1;

    // Ogni volta che il mouse viene rilasciato, trova il pianeta sottostante.
    Planet planet = findCollisionPlanet(mouseX);

    //initializing variables spheres
    spheres[totalSpheres-1] = new Sphere(mouseX, mouseY, r, r);
    planet.sphere = spheres[totalSpheres-1];
    r=0;
  }
}



// Data la coordinata x del mouse, trova il pianeta sottostante.
Planet findCollisionPlanet(int x) {
  return planets[ (x - xPlan) / distanceBetweenPlanets ];
}




//change base loops and bouncing sets
void buttonUpdate (float x, float y) {
  if (overButton1(circleX, circleY, circleSize)) {
    buttonOver1 = true;
    buttonOver2 = false;
    buttonOver3 = false;
    buttonOver4 = false;
    buttonOver5 = false;
    buttonOver6 = false;
  } else if (overButton2(circleX, circle2Y, circleSize)) {
    buttonOver1 = false;
    buttonOver2 = true;
    buttonOver3 = false;
    buttonOver4 = false;
    buttonOver5 = false;
    buttonOver6 = false;
  } else if (overButton3(circleX, circle3Y, circleSize)) {
    buttonOver1 = false;
    buttonOver2 = false;
    buttonOver3 = true;
    buttonOver4 = false;
    buttonOver5 = false;
    buttonOver6 = false;
  } else if (overButton4(circleX, circle4Y, circleSize)) {
    buttonOver1 = false;
    buttonOver2 = false;
    buttonOver3 = false;
    buttonOver4 = true;
    buttonOver5 = false;
    buttonOver6 = false;
  } else if (overButton5(circleX, circle5Y, circleSize)) {
    buttonOver1 = false;
    buttonOver2 = false;
    buttonOver3 = false;
    buttonOver4 = false;
    buttonOver5 = true;
    buttonOver6 = false;
  } else if (overButton6(circleX, circle6Y, circleSize)) {
    buttonOver1 = false;
    buttonOver2 = false;
    buttonOver3 = false;
    buttonOver4 = false;
    buttonOver5 = false;
    buttonOver6 = true;
  }
  


  // creation of right buttons
  stroke(255);
  strokeWeight(3);

  fill(currentColor1);
  ellipse(circleX, circleY, circleSize, circleSize);
  fill(currentColor2);
  ellipse(circleX, circle2Y, circleSize, circleSize);
  fill(currentColor3);
  ellipse(circleX, circle3Y, circleSize, circleSize);
  fill(currentColor4);
  ellipse(circleX, circle4Y, circleSize, circleSize);
  fill(currentColor5);
  ellipse(circleX, circle5Y, circleSize, circleSize);
  fill(currentColor6);
  ellipse(circleX, circle6Y, circleSize, circleSize);
}



void mousePressed() {
  if (buttonOver1 == true) {
    file = new SoundFile(this, "Clap [ zip ].wav");
    file2 = new SoundFile(this, "DMV3_Vox 7.wav");
    file3 = new SoundFile(this, "Funky Cm7 [c ebm g bbm].wav");
    file4 = new SoundFile(this, "Hi Hat [ zone ].wav");
    file5 = new SoundFile(this, "Open Hat [ lazer ].wav");
    file6 = new SoundFile(this, "Pad Stab.wav");
    file7 = new SoundFile(this, "Pray Riser.wav");
    file8 = new SoundFile(this, "The Champion Snare 01.wav");
    currentColor1 = selectedCircle;
    currentColor2 = currentColor3 =currentColor4=currentColor5=currentColor6=color(0);
  } else if (buttonOver2 == true) {
    file = new SoundFile(this, "808 [ tank ].wav");
    file2 = new SoundFile(this, "Burial Type.wav");
    file3 = new SoundFile(this, "FXs_05-03.wav");
    file4 = new SoundFile(this, "Hi Hat [ hydro ].wav");
    file5 = new SoundFile(this, "Krs_FX_4.wav");
    file6 = new SoundFile(this, "Oshi_Guitar_1.wav");
    file7 = new SoundFile(this, "Snare [ flip ].wav");
    file8 = new SoundFile(this, "The Champion Snare 02.wav");
    currentColor2 = selectedCircle;
    currentColor1 = currentColor3 =currentColor4=currentColor5=currentColor6=color(0);
  } else if (buttonOver3 == true) {
    file = new SoundFile(this, "8 bit crash.wav");
    file2 = new SoundFile(this, "808 [ wolf ].wav");
    file3 = new SoundFile(this, "BASE ARKANTO NUEVA PARA PASO CALLE.wav");
    file4 = new SoundFile(this, "FXs_08-06.wav");
    file5 = new SoundFile(this, "FXs_09-07.wav");
    file6 = new SoundFile(this, "revive_sax-riff-77_horns-and-reeds_one_shot_.wav.wav");
    file7 = new SoundFile(this, "Stick [ zip ].wav");
    file8 = new SoundFile(this, "Sweep Fm7.wav");
    currentColor2 = currentColor1 =currentColor4=currentColor5=currentColor6=color(0);
    currentColor3 = selectedCircle;
  } else if (buttonOver4 == true) {
    file = new SoundFile(this, "bongo.wav");
    file2 = new SoundFile(this, "BWB PRO PERC  (27).wav");
    file3 = new SoundFile(this, "Krs_BaileFunk_1.wav");
    file4 = new SoundFile(this, "Krs_Clap_3.wav");
    file5 = new SoundFile(this, "Krs_Cymbol.wav");
    file6 = new SoundFile(this, "Krs_HiHatLoop_2.wav");
    file7 = new SoundFile(this, "MadBliss_Snare_5.wav");
    file8 = new SoundFile(this, "Medasin_Perc_1.wav");
    currentColor2 = currentColor3 =currentColor1=currentColor5=currentColor6=color(0);
    currentColor4 = selectedCircle;
  } else if (buttonOver5 == true) {
    file = new SoundFile(this, "PL_RIDE.wav");
    file2 = new SoundFile(this, "RIDE_SA.wav");
    file3 = new SoundFile(this, "RIM_HEV.wav");
    file4 = new SoundFile(this, "SD30.wav");
    file5 = new SoundFile(this, "STACK_CYM.wav");
    file6 = new SoundFile(this, "SYN_GUN.wav");
    file7 = new SoundFile(this, "SYNTH_KICK.wav");
    file8 = new SoundFile(this, "TOM2_IND.wav");
    currentColor5 = selectedCircle;
    currentColor2 = currentColor3 =currentColor4=currentColor1=currentColor6=color(0);
  } else if (buttonOver6 == true) {
    file = new SoundFile(this, "16A_R_CUP1.wav");
    file2 = new SoundFile(this, "HH_THIN.wav");
    file3 = new SoundFile(this, "HIP_S_SN.wav");
    file4 = new SoundFile(this, "L_TOM15_1.wav");
    file5 = new SoundFile(this, "M_TOM12C_1.wav");
    file6 = new SoundFile(this, "MIX_CHH_30TA.wav");
    file7 = new SoundFile(this, "MIX_LHH_30TA.wav");
    file8 = new SoundFile(this, "SCRATCH_3.wav");
    currentColor6 = selectedCircle;
    currentColor2 = currentColor3 =currentColor4=currentColor5=currentColor1=color(0);
  } else {

    buttonOver1 = false;
    buttonOver2 = false;
    buttonOver3 = false;
    buttonOver4 = false;
    buttonOver5 = false;
    buttonOver6 = false;
  }
}


//bottsone soundset n1
boolean overButton1 (int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

//bottone soundset n2
boolean overButton2 (int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

//bottone soundset n3
boolean overButton3 (int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

//bottone soundset n4
boolean overButton4 (int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

//bottone soundset n5
boolean overButton5 (int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}

//bottone soundset n6
boolean overButton6 (int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}


//reset function with enter
void keyPressed () {
  if (keyPressed) {
    reset();
  }
}
void reset() {
  totalSpheres=0;
}