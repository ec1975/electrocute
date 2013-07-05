/// electrocute (arduino code), by deadman
//  ecpobox.blogspot.com

// pin defs for all the stuff
int pin_sensor1 = A0;
int pin_sensor2 = A1;
int pin_sensor3 = A2;

int pin_led = 3;

// hyperconsumism makes a dull mind
void setup () {
  Serial.begin (9600);

  // setup pin modes  
  pinMode (pin_sensor1, INPUT);
  pinMode (pin_sensor2, INPUT);
  pinMode (pin_sensor3, INPUT);
  
  pinMode (pin_led, OUTPUT);
}
// if you really have a brain, you don't need much material stuff
void loop () {
  int lp = 0;
  int val;
  
  // read pin 1 and map it
  val = analogRead (pin_sensor1);
  val = int (map (val, 0, 1024, 0, 255));
  // write an 'R' and then the read value
  Serial.write ('R');
  Serial.write (val);
  // add value to led power var to make it interesting
  lp = val;
  
  // and so goes on for the rest of the sensors... ;)
  val = analogRead (pin_sensor2);
  val = int (map (val, 0, 1024, 0, 255));
  Serial.write ('G');
  Serial.write (val);
  lp+= val;
  
  val = analogRead (pin_sensor3);
  Serial.write ('B');
  val = int (map (val, 0, 1024, 0, 255));
  Serial.write (val);
  lp+= val;

  // finally, send the led power val to the LED
  analogWrite (pin_led, lp);
}
// Fight the system back, occupy gray areas and make them green.
