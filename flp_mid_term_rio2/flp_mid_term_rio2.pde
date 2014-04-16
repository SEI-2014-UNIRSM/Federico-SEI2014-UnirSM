/* Drawing tool for movie poster and opening credits
© Federico Lo Porto for the course SEI2014 @ UnirSM
Didactic purpose, MIT License, March 2014, San Marino

Now this is a brush, but it is work in progress.
When work will finish, it will an interactive brush.

*/

PVector theMouse;

PShape piuma;
int lung=0;

void setup(){

  
     piuma=loadShape("piuma.svg");

  size(800,600);
  background(255);
  theMouse = new PVector();
}


void draw(){
 // lett.update();
  
  if(mousePressed){
      theMouse.set(mouseX,mouseY);

   shapeMode(CENTER);
  shape(piuma, mouseX,mouseY,100,100);
  //int lung=theMouse.length;
 lung=lung+1;



frameRate(30);

//if(keyPressed =="d")
//background(255);
  //if (key == DELETE || key == BACKSPACE) background(255);

}
