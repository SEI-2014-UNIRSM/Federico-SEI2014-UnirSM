/*
Basato su: P_2_2_4_01 Generative Gestaltung — Segue licenza originale.
Algoritmo modificato per esercizio durante il corso 
SEI 2014 @ UnirSM — Più info http://goo.gl/59obuO 

Griglia di "cerchi" con dimensione e colore variabile in base alla posizione
del mouse */


// P_2_1_3_01.pde
// 
// Generative Gestaltung, ISBN: 978-3-87439-759-9
// First Edition, Hermann Schmidt, Mainz, 2009
// Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
// Copyright 2009 Hartmut Bohnacker, Benedikt Gross, Julia Laub, Claudius Lazzeroni
//
// http://www.generative-gestaltung.de
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/**
 * changing circle amount, size and position in a grid
 * 	 
 * MOUSE
 * position x          : circle amount and size
 * position y          : circle position
 * left click          : random position
 * 
 * KEYS
 * s                   : save png
 * p                   : save pdf
 */

import processing.pdf.*;
import java.util.Calendar;

boolean savePDF = false;

float tileCountX = 10;
float tileCountY = 10;
float tileWidth, tileHeight;

int count = 0;
int colorStep = 15;
int circleCount;
float endSize, endOffset;

int actRandomSeed = 0;


void setup() { 
  size(800, 800);
  tileWidth = width / tileCountX;
  tileHeight = height / tileCountY;
} 


void draw() { 
  if (savePDF) beginRecord(PDF, timestamp()+".pdf");

  smooth();
  //noFill();
  stroke(255,255,255,45);
  background(255); 
  
  // inserisco dentro le variabili colore il valore 
// mappato della posizione del mouse. valori che mi andranno a determinare 
// il colore dei miei cerchi.
  int  colore1= int (map(mouseX, 0, width, 50, 255));
  int colore2= int (map(mouseY, 0, height, 50, 255));
  fill(colore1, colore2, (colore1+colore2)/3, 25);

  for (int gridY=0; gridY<=tileCountY; gridY++) {
    for (int gridX=0; gridX<=tileCountX; gridX++) {  
      pushMatrix();
      translate(tileWidth*gridX, tileHeight*gridY);
      ellipse(40, 40, mouseX, mouseY);
      
      popMatrix();
    }
  }

  if (savePDF) {
    savePDF = false;
    endRecord();
  }
} 


void mousePressed() {
  actRandomSeed = (int) random(100000);
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
