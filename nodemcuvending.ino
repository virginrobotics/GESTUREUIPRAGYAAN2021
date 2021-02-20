
int left = 4;
int right =14;
int trigPin = 16;
int echoPin = 5;
String row;
int col;
int pay = 12;
long duration;
int distance;





String getDistance() {
digitalWrite(trigPin, LOW);
delayMicroseconds(2);

digitalWrite(trigPin, HIGH);
delayMicroseconds(10);
digitalWrite(trigPin, LOW);

duration = pulseIn(echoPin, HIGH);

distance= duration*0.034/2;

delay(20);

if( distance >= 10 && distance < 14 ) {
  row = "A";
 
  delay(10);
}

else if( distance >= 14 && distance < 18 ) {
  row = "B";
  delay(10);
}

else if( distance >= 18 && distance < 22 ) {
  row = "C";
  delay(10);
}

else if( distance >= 22 && distance < 26 ) {
  row = "D";
  delay(10);
}

else if( distance >= 26 && distance < 30 ) {
  row = "E";
  delay(10);
}
return String(row);
  
}

void getDirection() {
  if (digitalRead(left)== 1 && digitalRead(right)== 1) {
    getDistance();
    if (digitalRead(pay)==1) {
    Serial.print(row);
    Serial.print(col);
    Serial.println("MN");
    delay(10);
    }
    else if(digitalRead(pay) == 0) {
    Serial.print(row);
    Serial.print(col);
    Serial.println("MY");
    delay(10000);
    }
  }
  else if (digitalRead(left)==0) {
    
    while( digitalRead(left) == 0) {
      if ( col == 1 ) {
      col = 1;
      Serial.print(row);
      Serial.print(1);
      Serial.println("L");
      delay(1000);
        }
      else if (col > 1) {
        Serial.print(row);
        Serial.print(col-1);
        Serial.println("L");
        col = col-1;
        delay(1000);
      }
      
    }
  }

 else if (digitalRead(right) == 0) {

  while(digitalRead(right) == 0) {
    if ( col == 4 ) {
      col = 4;
      Serial.print(row);
      Serial.print(4);
      Serial.println("R");
      delay(1000);
    }

    else if (col < 4) {
      Serial.print(row);
      Serial.print(col+1);
      Serial.println("R");
      col = col +1;
      delay(1000);
    }
  }
 }
    
}


void setup() {
  // put your setup code here, to run once:
pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
pinMode(echoPin, INPUT); // Sets the echoPin as an Input
pinMode(left, INPUT);
pinMode(right, INPUT);
pinMode(pay, INPUT);
Serial.begin(9600);
row = "A";
col = 4;
}
void loop() {
delay(50);
getDirection();



/*else {
  Serial.println("outofrange");
}
*/
}
