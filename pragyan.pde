//AUTHOR - PREM KUMAR R
//FOR THE PROJECT GUI FOR VENDING MACHINES
//PRAGYAAN 2021 

import processing.serial.*;
Serial myPort;
String val;
char row;
int col;
char state;
char pay;
PFont f;
String halo;
PImage redbull;
PImage pepsi;
PImage sprite;
PImage fanta;
PImage coke;
PImage bang;
PImage rich;
PImage monster;
PImage star;
PImage skittles;
PImage dairy;
PImage kitkat;
PImage orange;
PImage human;
PImage human2;
PImage lays;
PImage qrcode;
PImage leftlit;
PImage leftdim;
PImage rightdim;
PImage rightlit;
PImage banner;


void setup() {
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName,  9600);
  size(1200,680);
   f = createFont("Arial", 30, true);
  
  redbull= loadImage("redbull.jpg");
  pepsi = loadImage("drinkpepsi.jpg");
  coke= loadImage("drinkcoke.jpg");
  sprite= loadImage("drinksprite.jpg");
  fanta = loadImage("drinkfanta.jpg");
  bang = loadImage("redbang.jpg");
  rich= loadImage("redrich.jpg");
  monster= loadImage("redmonster.jpg");
  star= loadImage("choco5star.jpg");
  skittles= loadImage("chocoskittles.jpg");
  dairy= loadImage("chocodairy.jpg");
  kitkat= loadImage("chocokitkat.jpg");
  orange= loadImage("laysorange.jpg");
  human= loadImage("humanlays.jpg");
  human2= loadImage("humanlays2.jpg");
  lays= loadImage("lays.jpg");
  
  qrcode = loadImage("qrcode.jpg");
  leftlit = loadImage("leftlit.jpg");
  rightdim = loadImage("rightdim.jpg");
  leftdim = loadImage("leftdim.jpg");
  rightlit = loadImage("rightlit.jpg");
  banner = loadImage("banner.jpg");
 
  
  
}

void highlight(float arg, int select) {
  float z = arg*100;
  float s = 50 + (select-1)*105;
  strokeWeight(10);
  stroke(#5beb34);
  noFill();
  rect(s,z , 100, 100);
  textSize(30);
  textAlign(CENTER);
  text(row+" "+select, 900,425);
  strokeWeight(4);
  
}

void button(char state) {
  if ( state == 'M' ) {
     image(leftdim, 815, 480, 70,70);
     image(rightdim, 920, 480, 70,70);
  }
  
  else if ( state == 'L' ) {
     image(leftlit, 815, 480, 70,70);
     image(rightdim, 920, 480, 70,70);
  }
  
  else if ( state == 'R' ) {
     image(leftdim, 815, 480, 70,70);
     image(rightlit, 920, 480, 70,70);
  }
  
}

void display(char pay) {
   if (pay == 'N'){
    stroke(255);
    noFill();
    rect(800, 380, 200,70);
    image(banner, 800,100, 200,200); 
   }
    else if (pay == 'Y'){
    stroke(#5beb34);
    noFill();
    rect(800, 380, 200,70);
    image(qrcode, 800,100, 200,200); 
   }
     else {
        stroke(255);
    noFill();
    rect(800, 380, 200,70);
    image(banner, 800,100, 200,200); 
       
     }
     
}

void draw() {
   background(0);
   textFont(f, 30);
   fill(255);
   
   textAlign(CENTER);
   text("VENDING DISPLAY", width/2,50);
   //image(redbull, 50,100,100,100);
   
   /* for (int a =0; a<4; a++) { 
      int y = 100 + a*105;
      for (int i=0; i<4; i++) {
     int x = 50 + i*105;
     image(lays, x,y,100,100);
     
   }
    }*/
    
    //image(redbull, 700,200,100,100);
    
     if ( myPort.available() > 0) {
   val = myPort.readStringUntil('\n'); 
    
  }
  
  if ( val != null) {
    row = val.charAt(0);
    col = Character.getNumericValue(val.charAt(1));
    state = val.charAt(2);
    pay   =   val.charAt(3);
    display(pay);
   if (row == 'A') {
      highlight(1,col);
      button(state);
      
      
   }
   
    else if (row == 'B') {
      highlight(2.05,col);
      button(state);
   }
    
   else if ( row == 'C') {
      highlight(3.10,col);
      button(state);
   }
   
     else if ( row == 'D') {
      highlight(4.15,col);
      button(state);
   }
   
   
   
     
   }
  
  stroke(255);
  line(700, 100,700,580);
  //image(qrcode, 800,100, 200,200);
  textSize(24);
  textAlign(CENTER);
  text("QR CODE" ,900,330);
  image(redbull, 50,100,100,100);
  image(bang, 155,100,100,100);
  image(monster, 260,100,100,100);
  image(rich, 365,100,100,100);
  image(coke, 50,205,100,100);
  image(pepsi, 155,205,100,100);
  image(fanta, 260,205,100,100);
  image(sprite, 365,205,100,100);
  image(star, 50,310,100,100);
  image(dairy, 155,310,100,100);
  image(skittles,260,310,100,100);
  image(kitkat,365,310,100,100);
  image(lays,50,415,100,100);
  image(human,155,415,100,100);
  image(human2,260,415,100,100);
  image(orange,365,415,100,100);
  text("A", 30,160);
  text("B", 30,265);
  text("C", 30,370);
  text("D", 30,475);
  text("1", 100,85);
  text("2", 205,85);
  text("3", 310,85);
  text("4", 415,85);
  //textSize(30);
  //textAlign(CENTER);
  //text("A 4", 900,425);
  //image(leftlit, 815, 480, 70,70);
  //image(rightdim, 920, 480, 70,70);
  print(val);
}  
    
  
  
  
