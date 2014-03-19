/*sketch 10_print modificato a scopo didattico*/


int w = 16;
int h = 16;
int index = 0;
int colore=1;
void setup() {
size(640, 384);
background(#325F5E);

strokeWeight(3);
//stroke(224);
smooth();
}
void draw() {
int x1 = w*index;
int x2 = x1 + w;
int y1 = h*23;
int y2 = h*24;

int dimensione = int (map(mouseY, 0, height, 3, 7)); //mappo il valore del
//mouseY da 3 a 7 che mi servirà per deteminare lo spessore della linea

int valore =int( map(mouseX, 0, width, 0, 255)); //mappo il valore del mouseX
// da 0 a 255 per determinare il valore massimo colore

//serie di random per il colore
int col1= int (random(50, valore)); 
int col2= int (random(50, valore));
int col3= int (random(50, valore));
int col4= int (random(100, valore));


strokeWeight(dimensione); //spessore della linea

//stroke (col1*colore,col2*colore,col3*colore);
stroke (col1,col2,col3,col4);

//stroke (t*10,t*50,t*30);

if (random(2) < 1) {
line(x2, y1, x1, y2);
} else {
line(x1, y1, x2, y2);
}
index++;
colore++;
if (index == width/w) {
PImage p = get(0, h, width, h*23);
background(#325F5E);
set(0, 0, p);
index = 0;
colore=1;

}
}
