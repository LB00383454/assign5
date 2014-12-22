class Brick{
  int bSize = 35;
  int bX=50;
  int bY=60;
  int col;
  int row;
  int x = 50+col*50;
  int y = 50+row*40;
  int isHitted ;
  
  Brick(int a, int b){
    bX =  bX + a;
    bY =  b;
    isHitted = 0 ;
  }

  void display() {
    fill(255, 255, 255);
    rect(bX, bY, bSize, bSize);
  }  
}




