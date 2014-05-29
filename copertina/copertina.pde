/* sketch creato per generare un img di copertina
per l'elaborato finale del corso
SEI 2014 @ UnirSM — Più info http://goo.gl/59obuO 
*/


import processing.pdf.*;
import java.util.Calendar;

boolean savePDF = false;

float diametroL=300;
float diametroR=300; 
float posX;
float posY;


void setup()
{
  size(displayWidth, displayHeight);
  background(255);
  noFill();
  stroke(0, 0, 0, 3);
  ellipse(width/2, height/2, diametroL, diametroL);
}

void draw()
{
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");

  noFill();
  float colore1=random(0, 255);
  float colore2=random(0, 255);
  float colore3=random(0, 255);
  stroke(colore1, colore2, colore3, 15);
  posX= random(width/2-100, width/2+100);
  posY=random(height/2-100, height/2+100);
  diametroL=random(400, 700);
  diametroR= random(300, 700);
  ellipse(posX, posY, diametroL, diametroR);

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
}

void keyReleased() {
  if (key == 's' || key == 'S') saveFrame(timestamp()+"_##.png");
  if (key == 'p' || key == 'P') savePDF = true;
}


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}
