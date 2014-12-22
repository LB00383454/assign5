class Ball{
 float x;
 float y;
  float xSpeed;
  float ySpeed;
  float size;
  
  void move(){
    x+=xSpeed;
    y+=ySpeed;
    
    if (x<size/2 || x>width-size/2){
      xSpeed *= -1;
    }
    if (y<size/2){
      ySpeed *= -1;
    }
    if (y>height-size/2){
      y = size/2;
    }
    
    float bottom = y+size/2;
    float bl = myBar.y - 10/2;
    float bLeft = myBar.x-myBar.length/2;
    float bRight = myBar.x+myBar.length/2;
    if (bottom >= bl && x>bLeft && x<bRight){
        ySpeed *= -1;
        y = bl;
    }
   
  }
  void move_hit_brick(){
    xSpeed *= -1;
    ySpeed *= -1;
  
  }
  void move_with_bar(){
    x = mouseX;
    y = height - 50 - size;
    if(x < 60)
      x = 60 ;
    if(x > 600)
      x = 600 ;
    
  }
  
  
  void display(){
    ellipse(x,y,size,size);
  }
  
  boolean isHit(
        float circleX,
        float circleY,
        float radius,
        float rectangleX,
        float rectangleY,
        float rectangleWidth,
        float rectangleHeight)
  {
      float circleDistanceX = abs(circleX - rectangleX);
      float circleDistanceY = abs(circleY - rectangleY);
   
      if (circleDistanceX > (rectangleWidth/2 + radius)) { return false; }
      if (circleDistanceY > (rectangleHeight/2 + radius)) { return false; }
   
      if (circleDistanceX <= (rectangleWidth/2)) { return true; }
      if (circleDistanceY <= (rectangleHeight/2)) { return true; }
   
      float cornerDistance_sq = pow(circleDistanceX - rectangleWidth/2, 2) +
                           pow(circleDistanceY - rectangleHeight/2, 2);
   
      return (cornerDistance_sq <= pow(radius,2));
  }
  
  Ball(){
    x = random(width);
    y = random(height);
    xSpeed = 5;
    ySpeed = 6;
    size = 10;
  }
  
  Ball(float size, float xSpeed){
    x = random(width);
    y = random(height);
    this.xSpeed = xSpeed;
    this.ySpeed = size;
    this.size = size;
  }
}
