char[] chars = {'q','w','e','r','t','y','u','i','o','p','a','s','d','f','g','h','j','k','l','z','x','c','v','b','n','m',' '};
//char[] chars = {'Q','W','E','R','T','Y','U','I','O','P','A','S','D','F','G','H','J','K','L','Z','X','C','V','B','N','M',' '}; //incase we want to test the upper case keyboard
Button[] touches = new Button[chars.length];

int charVal = 97;
int xpos = 20;
int ypos = 20;
int keySize = 40;
String lastPress;
int enlargeFactor = 2; //change this to adjust the enlargment of design
int sVal = 1; //variable to store the current enlarge factor
int tranX = 0; //x coordinate shift amount
int tranY = 0; //y coordinate shift amount

void setup(){
  size(577,577);
  //set position of each key
  for (int i = 0; i < chars.length; i++) { 
    //chars[i] = char(charVal);
    charVal++;
     if (i==10 ){
      ypos += keySize+20;
      xpos = 40;
     }
     if (i==19 ){
      ypos += keySize+20;
      xpos = 60;
     }
     if (i==26 ){
      ypos += keySize+20;
      xpos = 100;
     }
    touches[i] = new Button(chars[i], xpos, ypos);
    xpos += 50;
  }
}

void draw(){
  
  background(0);
  pushMatrix();
  scale(sVal);//zoom in or out accordingly to the sVal value
  translate(tranX, tranY); //move the clicked point to the center of screen after zoom in
  for (int i = 0; i < touches.length; i++){
    touches[i].display(i);
  }
  popMatrix();
}

void mouseReleased(){
//zoom out after click the key
  if (sVal != 1){
   for (int i = 0; i < touches.length; i++){
   lastPress = touches[i].keyCheck(mouseX, mouseY,i);
   }
   tranX = 0;
   tranY = 0;
   sVal = 1;
   //println(lastPress); //prints "null"
   
 }
//zoom in when screen with full keyboard clicked
 else{
   sVal = enlargeFactor;
   tranX = -(mouseX - 577/(2*sVal)); 
   tranY = -(mouseY - 577/(2*sVal));
   //tranX = -mouseX*((sVal-1)/sVal);
   //tranY = -mouseY*((sVal-1)/sVal);
 }
}

class Button {

  String charString;
  int x;
  int y;

  Button(char keyVal, int x, int y){
    charString = Character.toString(char(keyVal));
    this.x = x;
    this.y = y;
  }

  void display(int i){
    if (i != 26){
    fill(255);
    rect(x,y,keySize,keySize);
    fill(0);
    textSize(30);
    text(charString,x+0.2*keySize,y+0.75*keySize);
    }
    else {
    fill(255);
    rect(x,y,6*keySize,keySize);
    fill(0);
    text(charString,x+0.3*keySize,y+0.7*keySize);
    }
  }

  String keyCheck(int Xmouse, int Ymouse, int i){
    //check if a-z key pressed
    if(Xmouse > (x+tranX)*sVal && Xmouse < (x+tranX+keySize)*sVal && Ymouse > (y+tranY)*sVal && Ymouse < (y+tranY+keySize)*sVal && i!=26){
      println(charString); 
      return charString;
    } 
    //check if space key pressed
    else if(Xmouse > x*sVal+tranX*sVal && Xmouse < x*sVal+tranX*sVal + 6*keySize*sVal && Ymouse > y*sVal+tranY*sVal && Ymouse < y*sVal+tranY*sVal + keySize*sVal && i==26){
      println(charString); //prints relevant char
      return charString;
    }  
    else {
    return null;
    }
  }
}