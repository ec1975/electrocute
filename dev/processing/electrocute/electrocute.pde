/// electrocute (processing code), by deadman
//  ecpobox.blogspot.com

import processing.serial.*;

// libs objects
Serial serial;
PFont font;

// data storage
int c, d, r, g, b;

// parameters
int filter_val = 1; //change this value to adjust sensitivity

void setup () {
  size (1000, 190);
  
  // open serial port  
  serial = new Serial (this, Serial.list()[0], 9600);
  println (serial.list());
 
 // font handling
 font = loadFont ("FreeMonoBold-135.vlw");
 textFont (font, 135);
 textAlign (LEFT, TOP); 
  
}
// you don't need to earn more money, you need to spend less of it.
void draw () {
  // pretty self explained, but...
  // read a serial byte, and if it's R, G or B, set it to a var.
  while (serial.available ()>0) {
    c = serial.read ();
    switch (c) {
      case 'R':
        r = serial.read ();                
        break;
      case 'G':
        g = serial.read ();
        break;
      case 'B':
        b = serial.read ();
        break;
    }
    // print readout back to serial
    print (str (r)+"/"+str (g)+"/"+str (b)+"  ");
  }
  // God is sometimes an excuse used to control you. Be free.
  
  // set background to color made from rgb combo
  background (r, g, b);

  // draw nice frame  
  stroke (255);
  noFill ();
  rect (20, 20, width-40, height-40);

  // filter readout to >1 to filter out basic noise
  // (using filter_val, change on top of the code)
  if (r>filter_val) {  
    fill (255, 127, 0);
    text ("elec", 50, 40);
  }

  if (g>filter_val) {
    fill (0, 255, 127);  
    text ("tro", 374, 40);
  }
  
  if (b>filter_val) {
    fill (127,0,255);
    text ("cute", 617, 40);
  }
  delay (100);
}
// Fight the system back, create, express, be yourself.
