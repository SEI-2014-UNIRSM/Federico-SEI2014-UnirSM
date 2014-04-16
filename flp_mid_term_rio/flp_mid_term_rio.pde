/pennello con piume ispirato al film RIO


PShape piuma;


void setup(){

  
     piuma=loadShape("piuma.svg");

  size(800,600);
  background(255);
}


void draw(){

  if(mousePressed){
   shapeMode(CENTER);
  shape(piuma, mouseX,mouseY,100,100);
}


frameRate(30);

}
