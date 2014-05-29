/* Quando viene rilevato del rumore comparira la 
scritta "rumore", la posizione della scritta è data
dal volume del rumore */

import ddf.minim.*;
Minim minim;
AudioPlayer player;
AudioInput input;

float posizioneX;
float posizioneY;
float volume;
PFont myFont;

void setup() {
  size (800, 600);
  background(0, 0, 0);
  //font= loadFont ("Sequi_regular.otf");
  //textFont(font,12);
  myFont = createFont("Dia", 120);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  minim = new Minim(this);
  input = minim.getLineIn();
}
void draw() {
//mappo il rumore in ingresso
  posizioneX= map(input.left.get(100), 0, 5, width/2, width/2 +500);
  posizioneY= map(input.left.get(100), 0, 5, height/2, height/2 +500);
  volume= map(input.left.get(100), 0, 5, 0, 100);
  //int posRandomX= int(random(width/2, posizioneX));
  //int posRandomY= int(random(height/2, posizioneY));
  noStroke();
  fill(255, 255, 255, 10);
  if (volume> 10)
    //text("RUMORE", posRandomX, posRandomY);
    text("RUMORE", posizioneX, posizioneY);
}
