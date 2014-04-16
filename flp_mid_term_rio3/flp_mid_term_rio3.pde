/* Drawing tool for movie poster and opening credits
© Federico Lo Porto for the course SEI2014 @ UnirSM
Didactic purpose, MIT License, March 2014, San Marino

Now this is a brush, but it is work in progress.
When work will finish, it will an interactive brush.



 
 * KEYS
 * g                   : save png
 * p                   : save pdf
 *s                    : save frame
 
 
 */
 
import processing.pdf.*;
import java.util.Calendar;


boolean recordPDF = false;


ArrayList<Circle> circles; 
PShape piuma;


float Newx;
float Newy;
int conta=0;

void setup() {
  piuma=loadShape("piuma.svg");

  size(800, 800);
  // Create an empty array list called circles that stores circle objects.
  circles = new ArrayList<Circle>();
  // background(255);
}

void draw() {
  if (recordPDF) beginRecord(PDF, timestamp()+".pdf");

  background(255);

  /*  
   if (circles.size() > 1) {
   for (int i = 1; i < circles.size(); i++) {
   Circle c = circles.get(i);
   Circle cwaffle = circles.get(i-1);
   // stroke(36, 83, 197);
   //strokeWeight(12);
   //line(c.x, c.y, cwaffle.x, cwaffle.y);
   //stroke(255);
   //strokeWeight(2);
   //line(c.x, c.y, cwaffle.x, cwaffle.y);
   
   }
   }
   */

  // Go through the array and call functions (display and grow) for each object.
  for (int i = 0; i<circles.size(); i++) {
    Circle c = circles.get(i);
    //c.displayStroke();
    c.display();
  }


  // When the mouse is pressed, go to the last item in the array and call the grow function
  /* if (mousePressed) {
   circles.get(circles.size()-1).grow();
   }
   */
  frameRate(20);
}





// When the mouse is pressed add a new circle object to the array 'circles'
void mouseDragged() {
  circles.add(new Circle());
  // Print the number of objects in the array list
  println(circles.size());
  // conta=conta+1;
}
void mousePressed() {
  conta=conta+1;
}

// Create a class called circle
class Circle {
  int x, y;   
  int previousX, previousY;
  float size;
  // Constructor
  // This runs when you create the object which is why…
  //…you need to set x & y to the mouse position and the size here…
  // and not in your functions.
  Circle() {
    // set x and y to mouseX and mouseY respectively.
    x = mouseX;
    y = mouseY;
  }

  // Function that, when called, displays the object
  void display() {
    //  fill(36, 83, 197);
    // stroke(255);
    //strokeWeight(2);
    // if (mousePressed) conta=conta+1;
    shapeMode(CENTER); 
    shape(piuma, x, y, 100, 100);
    // if(conta==4) background(255);
    //if(key == 'm' || key=='M')//&&
    if (conta>4)
    {
      //background(255);
      shape(piuma, x+Newx, y+Newy, 100, 100);

      //ellipse(x+Newx, y, size, size);
      Newx = random(1, 3);
      Newy = random(1, 3);
    }
  


//save frame for animation
  if (key =='s' || key =='S') {
    saveFrame("Animation/anim-####.tga");
    println(frameCount);
  }
}



void keyReleased() {
  if (key == 'g' || key == 'G') saveFrame(timestamp()+"_##.png");
 // if (key == 'p' || key == 'P') savePDF = true;
  if (key == DELETE || key == BACKSPACE){
     background(255);}
 
  // ------ pdf export ------
  // press 'r' to start pdf recording and 'e' to stop it
  // ONLY by pressing 'e' the pdf is saved to disk!

  if (key =='r' || key =='R') {
    if (recordPDF == false) {
      beginRecord(PDF, "####.pdf");
      println("recording started");
      recordPDF = true;
    }
  }
  else if (key == 'e' || key =='E') {
    if (recordPDF) {
      println("recording stopped");
      endRecord();
      recordPDF = false;
    }
  }
}
 
     
}

// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


/*  void displayStroke() {
 noFill();
 stroke(36, 83, 197);
 strokeWeight(12);
 ellipse(x, y, size, size);
 } */

// Fucntion that, when called, sets the size of the circle to the…
//…distance between the centre of the circle and the position of the mouse.
/* void grow() {
 if (mousePressed) {
 // size = (dist(x, y, mouseX, mouseY))*2;
 }
 }
 */
