Bar myBar;
Brick [][] myBrick;
Ball myBall;

int j;
int i;
//Game State
final int GAME_INITIAL = 1;
final int GAME_WAIT_START = 2 ;
final int GAME_RUN = 3 ;
final int GAME_WIN = 4 ;
final int GAME_LOSE = 5 ; 
int game_state ;
int life ;
int count ;


void setup(){
  size(640,480); 
  game_state = 1 ;
   myBar = new Bar();
   myBall = new Ball();
   myBrick = new Brick[10][5];
  for (int i=0; i<10; i++){
    for (int j=0; j<5; j++){
      int  a = 50+ i * 50;
      int  b = 50+ j * 40;
    myBrick[i][j] = new Brick(a,b);
    }
  }
}



void draw(){
  
  switch(game_state){
    case GAME_INITIAL :
      background(10,110,16);
      textAlign(CENTER);
      textSize(40);
      text("Press Enter to Start", width/2, height/2); 
      life = 3 ;
      for(int i = 0 ; i < 10 ; i++){
        for(int j = 0 ; j < 5 ; j++){
        myBrick[i][j].isHitted = 0 ;
        }
      }   
      break;
    case GAME_WAIT_START :
        background(0);
        myBar.move();       //Move Bar
        myBar.display();    //Draw Bar
        myBall.move_with_bar();       //Move Bar
        myBall.display();    //Draw Bar
        textSize(10);
        text("LIFE", 30, 450); 
        for(int i = 0 ; i < life ; i++){
          fill(255 , 0 , 0 );
          ellipse( 70 + i * 15 , 445 , 10 , 10);
        }
  
        for (int i=0; i<10; i++){
          for (int j=0; j<5; j++){
            if(myBrick[i][j].isHitted == 0)
            myBrick[i][j].display();   //Draw Brick
          }
        }
     break; 
    case GAME_RUN :
        background(0);
        myBar.move();
        myBar.display();
        myBall.move();
        myBall.display();
        text("LIFE", 30, 450); 
        for(int i = 0 ; i < life ; i++){
          fill(255 , 0 , 0 );
          ellipse( 70 + i * 15 , 445 , 10 , 10);
        }
        
        for (int i=0; i<10; i++){
          for (int j=0; j<5; j++){
            if(myBrick[i][j].isHitted == 0)
            myBrick[i][j].display();   //Draw Brick
          }
        }
        for(int i = 0 ; i < 10 ; i++){
          for(int j = 0 ; j < 5 ; j++){
            if(myBall.isHit(myBall.x , myBall.y , myBall.size , myBrick[i][j].bX , myBrick[i][j].bY , 35 , 35) == true){
              myBrick[i][j].isHitted = 1 ;
              //myBall.move_hit_brick();
            }
          }
        }
        count = 0 ;
        for(int i = 0 ; i < 10 ; i++){
          for(int j = 0 ; j < 5 ; j++){
            if(myBrick[i][j].isHitted == 0){
            count++;
            }
          }
        }
      
        if(count == 0){
          game_state = GAME_WIN ;
        }
        if(myBall.y > height - 50){
          life--;
          game_state = GAME_WAIT_START ;
        }
        if(life == 0){
          game_state = GAME_LOSE ;
        }
        
     break; 
     case GAME_WIN :
       background(10,110,16);
       textSize(40);
       text("GAME WIN", width/2, height/2);
       //game_state = GAME_INITIAL ;
     break; 
     case GAME_LOSE :
       background(10,110,16);
       textSize(40);
       text("GAME LOSE", width/2, height/2);
       //game_state = GAME_INITIAL ;       
     break;
       
     
      
        
      
    
  }
}
  void reset(){
   textSize(10);
        text("LIFE", 30, 450); 
        for(int i = 0 ; i < life ; i++){
          fill(255 , 0 , 0 );
          ellipse( 70 + i * 15 , 445 , 10 , 10);
        }
    life = 3 ;
      for(int i = 0 ; i < 10 ; i++){
        for(int j = 0 ; j < 5 ; j++){
        myBrick[i][j].isHitted = 0 ;
        }        
}
game_state = GAME_WAIT_START ;
  }




void keyPressed() {
  if(key == ENTER &&  (game_state == GAME_LOSE || game_state == GAME_WIN)){
    game_state = GAME_WAIT_START ;
    reset();
    //life = 3 ;
  }
  else if(key == ENTER && game_state == GAME_INITIAL){
    game_state = GAME_WAIT_START ;
    //life = 3 ;
    reset();
  }


}
void mousePressed(){
  if(mouseButton == RIGHT){
    game_state = GAME_RUN ;
  }
  
}



