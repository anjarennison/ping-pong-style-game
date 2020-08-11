int x;
int y;
int xspeed;
int yspeed;
int counter;
int highscore;

boolean on = true;

void setup() {
  size (1000, 700);

  x = 0;
  y = 0;
  counter = 0;
  highscore = 0;
  xspeed = 10;
  yspeed = 10;
}

void draw() {
  background(#000000);

  for (int i = 0; i < 100; i++) {
    int x = 20 + i * 20;
    int y = 20 + i * 20;
    fill(#ff66a3);
    ellipse(x, height - 40, 10, 10);
  } 

  for (int i = 0; i < 100; i++) {
    int x = 20 + i * 20;
    int y = 20 + i * 20;
    fill(#99ffcc);
    ellipse(x, height - 620, 10, 10);
  } 
  //Loops.

  fill(#ffff00);
  int paddleX = constrain(mouseX, 0, width - 100);
  rect(paddleX, 680, 100, 20);
  //Begrænser paddle til at være indenfor bredden (width - paddle bredde).

  x = x + xspeed;
  y = y + yspeed;

  if (x > width || x < 0) {
    xspeed = - xspeed;
    on = !on;
  }
  //Begrænser elipse til bredden og skifter retning.

  if (y < 0) {
    yspeed = - yspeed;
  }
  // Begrænser elipse til højden øverst og skifter retning.

  else if (y > height - 20 && y < height && x > mouseX && x < mouseX + 100) {
    yspeed = -yspeed;
    counter += 1;
  }
  // Begrænser elipsen HVIS den rammer paddle og skifter retning, og påvirker counter.

  if (counter > highscore) {
    highscore = counter;
  }
  // Counter påvirker highscore så highscore følger counter, HVIS counter er større end highscore.

  fill (#ffffff);
  text("Score: " + counter, 20, 20);
  text ("Highscore: " + highscore, 20, 40);
  fill(#ffff00);
  text ("Press R to restart", 20, 60);
  //Tekst indsat.

  fill(#9999ff);
  ellipse(x, y, 50, 50);
}

void keyPressed () {
  if (key == 'r') {
    restartGame();
  }
}

void restartGame() {
  x = (int) random (0, 1000);
  y = 0;
  counter=0;
}
// Funktion defineret af mig selv - genstart ved R. 