class Bar{
// properties
float x;
float y;
float length = 120;


//methods
void display(){
  rectMode(CENTER);
  rect(x,y,length,10);
}

Bar(){
  x+=mouseX;
  y=height-50;
}


void move(){
  x=mouseX;
  y=height-50;
  if (x-length/2< 0){
   x = length/2;
 }
   if (x+length/2> width){
   x = width-length/2;
 }
}
}
