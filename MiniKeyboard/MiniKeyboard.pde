char[] chars = {'q','w','e','r','t','y','u','i','o','p','a','s','d','f','g','h','j','k','l','z','x','c','v','b','n','m',' '};
Button[] touches = new Button[chars.length];

int charVal = 97;
int xpos = 20;
int ypos = 20;
int keySize = 40;
String lastPress;

void setup(){
  size(577,577);
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
  for (int i = 0; i < touches.length; i++){
    touches[i].display(i);
  }
}

void mouseReleased(){
 for (int i = 0; i < touches.length; i++){
 lastPress = touches[i].keyCheck(mouseX, mouseY,i);
 }
 //println(lastPress); //prints "null"
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
    if(Xmouse > x && Xmouse < x + keySize && Ymouse > y && Ymouse < y + keySize && i!=26){
      println(charString); //prints relevant char
      return charString;
    }  
    else if(Xmouse > x && Xmouse < x + 6*keySize && Ymouse > y && Ymouse < y + keySize && i==26){
      println(charString); //prints relevant char
      return charString;
    }  
    else {
    return null;
    }
  }
}