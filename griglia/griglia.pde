/* Griglia di "cerchi" con dimensione e colore variabile in base alla posizione
del mouse */

//dichiarazione numero righe e colonne della mia griglia
int righe=10;
int colonne=10;
//singola cella
int singoloX;
int singoloY;


void setup() {

  size (800, 800);
}


void draw() {

  //trovo la dimensione della mia cella
  singoloX= width/colonne;
  singoloY=height/righe;


  background(255);
  stroke(255, 255, 255, 45);

// inserisco dentro le variabili colore il valore 
// mappato della posizione del mouse. valori che mi andranno a determinare 
// il colore dei miei cerchi.
  int  colore1= int (map(mouseX, 0, width, 50, 255));
  int colore2= int (map(mouseY, 0, height, 50, 255));
  fill(colore1, colore2, (colore1+colore2)/3, 25);

  for (int i=0; i<colonne; i++) {
    for (int j=0; j<righe; j++) {
      pushMatrix();
      translate(singoloX*i, singoloY*j);
      ellipse(40, 40, mouseX, mouseY);
      popMatrix();
    }
  }
}
