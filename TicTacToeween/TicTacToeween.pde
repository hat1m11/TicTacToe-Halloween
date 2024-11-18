int [][] board = new int[3][3];
PImage Ximg, Oimg;
int currentPlayer = 1;
boolean gameOver = false;


void setup(){
  
size(500, 500); 
background(0);
stroke(255,99,71);
strokeWeight(2);

  
drawLayout();


  Ximg = loadImage("X.png");
  Oimg = loadImage("O.png");
  
  
  Ximg.resize(100, 100);
  Oimg.resize(100, 100);

}


void draw(){  
  
  for(int i = 0; i < 3; i++){
  for(int j = 0; j < 3; j++){
    float x = j*(width/3) + (width/6);
    float y = i*(height/3)+(height/6);
    
    if (board[i][j] == 1) {
        image(Ximg, x - 50, y - 50); // Adjust to center the image
      } else if (board[i][j] == 2) {
        image(Oimg, x - 50, y - 50); // Adjust to center the image
      }
    }  
  }
  
   int winner = checkWinner();
   if (winner != 0 && !gameOver) {
   gameOver = true;
   println("Player " + winner + " wins!");
  
  }
}

void mousePressed() {
  int row = mouseY / (height / 3);
  int col = mouseX / (width / 3);

 
  if (board[row][col] == 0) {
    board[row][col] = currentPlayer;
    currentPlayer = (currentPlayer == 1) ? 2 : 1; // Switch players
  }
}



void drawLayout(){
  
line(0, 150, 500, 150);
line(0, 330, 500, 330);
line(160, 0, 160, 500);
line(340, 0, 340, 500);

}



int checkWinner() {
  
  for (int i = 0; i < 3; i++) {
    if (board[i][0] == board[i][1] && board[i][1] == board[i][2] && board[i][0] != 0) {
      return board[i][0];
    }
    if (board[0][i] == board[1][i] && board[1][i] == board[2][i] && board[0][i] != 0) {
      return board[0][i];
    }
  }
  if (board[0][0] == board[1][1] && board[1][1] == board[2][2] && board[0][0] != 0) {
    return board[0][0];
  }
  if (board[0][2] == board[1][1] && board[1][1] == board[2][0] && board[0][2] != 0) {
    return board[0][2];
  }
  return 0;
}
