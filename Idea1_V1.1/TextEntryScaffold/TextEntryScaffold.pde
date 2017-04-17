import java.util.Arrays;
import java.util.Collections;

String[] phrases; //contains all of the phrases
int totalTrialNum = 4; //the total number of phrases to be tested - set this low for testing. Might be ~10 for the real bakeoff!
int currTrialNum = 0; // the current trial number (indexes into trials array above)
float startTime = 0; // time starts when the first letter is entered
float finishTime = 0; // records the time of when the final trial ends
float lastTime = 0; //the timestamp of when the last trial was completed
float lettersEnteredTotal = 0; //a running total of the number of letters the user has entered (need this for final WPM computation)
float lettersExpectedTotal = 0; //a running total of the number of letters expected (correct phrases)
float errorsTotal = 0; //a running total of the number of errors (when hitting next)
String currentPhrase = ""; //the current target phrase
String currentTyped = ""; //what the user has typed so far
final int DPIofYourDeviceScreen = 577; //you will need to look up the DPI or PPI of your device to make sure you get the right scale!!
                                      //http://en.wikipedia.org/wiki/List_of_displays_by_pixel_density
final float sizeOfInputArea = DPIofYourDeviceScreen*1; //aka, 1.0 inches square!

//Variables for idea 1
char[] chars = {'q','w','e','r','t','y','u','i','o','p','a','s','d','f','g','h','j','k','l','z','x','c','v','b','n','m',' '};
//char[] chars = {'Q','W','E','R','T','Y','U','I','O','P','A','S','D','F','G','H','J','K','L','Z','X','C','V','B','N','M',' '}; //incase we want to test the upper case keyboard
Button[] touches = new Button[chars.length];

int windowX = 200;
int windowY = 200;
int charVal = 97;
int xpos = 40+windowX;
int ypos = 80+windowY;
int keySize = 40;
String lastPress;
int enlargeFactor = 2; //change this to adjust the enlargment of design
int sVal = 1; //variable to store the current enlarge factor
int tranX = 0; //x coordinate shift amount
int tranY = 0; //y coordinate shift amount

//You can modify anything in here. This is just a basic implementation.
void setup()
{
  phrases = loadStrings("phrases2.txt"); //load the phrase set into memory
  Collections.shuffle(Arrays.asList(phrases)); //randomize the order of the phrases
    
  orientation(PORTRAIT); //can also be LANDSCAPE -- sets orientation on android device
  size(1440, 2560); //Sets the size of the app. You may want to modify this to your device. Many phones today are 1080 wide by 1920 tall.
  textFont(createFont("Arial", 24)); //set the font to arial 24
  noStroke(); //my code doesn't use any strokes.
  
  for (int i = 0; i < chars.length; i++) { 
    //chars[i] = char(charVal);
    charVal++;
     if (i==10 ){
      ypos += keySize+20;
      xpos = 65+windowX;
     }
     if (i==19 ){
      ypos += keySize+20;
      xpos = 90+windowX;
     }
     if (i==26 ){
      ypos += keySize+20;
      xpos = 125+windowX;
     }
    touches[i] = new Button(chars[i], xpos, ypos);
    xpos += 50;
  }
}

//You can modify anything in here. This is just a basic implementation.
void draw()
{
  background(0); //clear background

 // image(watch,-200,200);
  fill(100);
  rect(200, 200, sizeOfInputArea, sizeOfInputArea); //input area should be 2" by 2"
  
  
  //ideal1 draw codes
  pushMatrix();
  scale(sVal);//zoom in or out accordingly to the sVal value
  translate(tranX, tranY); //move the clicked point to the center of screen after zoom in
  for (int i = 0; i < touches.length; i++){
  touches[i].display(i);
  }
  popMatrix();
  if (sVal == 1){
    fill(255,0,0);
    rect(windowX, windowY+0.6*sizeOfInputArea,0.5*sizeOfInputArea,0.4*sizeOfInputArea);
    textAlign(CENTER);
    fill(255);
    text("BACKSPACE", windowX+0.25*sizeOfInputArea, windowY+0.8*sizeOfInputArea);
    
  }
  
  
  fill(0);
  rect(0,0,1440,windowY);
  rect(0,0,windowX,2560);
  rect(windowX+sizeOfInputArea,0,1440,2560);
  rect(0,windowY+sizeOfInputArea,1440,2560);
  if (finishTime!=0)
  {
    fill(255);
    textAlign(CENTER);
    text("Finished", 280, 150);
    return;
  }

  if (startTime==0 & !mousePressed)
  {
    fill(255);
    textAlign(CENTER);
    text("Click to start time!", 280, 150); //display this messsage until the user clicks!
  }

  if (startTime==0 & mousePressed)
  {
    nextTrial(); //start the trials!
  }

  if (startTime!=0)
  {
    //you will need something like the next 10 lines in your code. Output does not have to be within the 2 inch area!
    textAlign(LEFT); //align the text left
    fill(128);
    text("Phrase " + (currTrialNum+1) + " of " + totalTrialNum, 70, 50); //draw the trial count
    fill(255);
    text("Target:   " + currentPhrase, 70, 100); //draw the target string
    text("Entered:  " + currentTyped, 70, 140); //draw what the user has entered thus far 
    fill(255, 0, 0);
    rect(800, 00, 200, 200); //drag next button
    fill(255);
    text("NEXT > ", 850, 100); //draw next label
  }

    ////my draw code
    //textAlign(CENTER);
    //text("" + currentLetter, 200+sizeOfInputArea/2, 200+sizeOfInputArea/3); //draw current letter
    //fill(255, 0, 0);
    //rect(200, 200+sizeOfInputArea/2, sizeOfInputArea/2, sizeOfInputArea/2); //draw left red button
    //fill(0, 255, 0);
    //rect(200+sizeOfInputArea/2, 200+sizeOfInputArea/2, sizeOfInputArea/2, sizeOfInputArea/2); //draw right green button

}


//idea1 functions
void mouseReleased(){
  if (mouseX > windowX && mouseX < windowX+sizeOfInputArea && mouseY>windowY && mouseY<windowY+sizeOfInputArea){
    //zoom out after click the key
    if (sVal != 1){
     for (int i = 0; i < touches.length; i++){
     lastPress = touches[i].keyCheck(mouseX, mouseY,i);
     }
     tranX = 0;
     tranY = 0;
     sVal = 1;
    }
    //zoom in when screen with full keyboard clicked
   
   else{
     if (mouseX > windowX && mouseX < windowY+sizeOfInputArea*0.5 && mouseY > windowY+0.5*sizeOfInputArea && mouseY <windowY + sizeOfInputArea ){
       if(currentTyped.length()>0){
         currentTyped = currentTyped.substring(0, currentTyped.length()-1);
       }
     }
     else{
     sVal = enlargeFactor;
     tranX = -(mouseX - int(sizeOfInputArea)/(2*sVal)-windowX/sVal); 
     tranY = -(mouseY - int(sizeOfInputArea)/(2*sVal)-windowY/sVal);
     //tranX = -mouseX*((sVal-1)/sVal);
     //tranY = -mouseY*((sVal-1)/sVal);
     }
   }
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
    if(Xmouse > (x+tranX)*sVal && Xmouse < (x+tranX+keySize)*sVal && Ymouse > (y+tranY)*sVal && Ymouse < (y+tranY+keySize)*sVal && i != 26){
      println(charString); 
      currentTyped += charString;
      return charString;
    } 
    //check if space key pressed
    else if(Xmouse > (x+tranX)*sVal && Xmouse < (x+tranX+keySize*6)*sVal && Ymouse > (y+tranY)*sVal && Ymouse < (y+tranY+keySize)*sVal && i==26){
      println(charString); //prints relevant char
      currentTyped += charString;
      return charString;
    }  
    else {
    return null;
    }
  }
}



//original code
boolean didMouseClick(float x, float y, float w, float h) //simple function to do hit testing
{
  return (mouseX > x && mouseX<x+w && mouseY>y && mouseY<y+h); //check to see if it is in button bounds
}


void mousePressed()
{

  //if (didMouseClick(200, 200+sizeOfInputArea/2, sizeOfInputArea/2, sizeOfInputArea/2)) //check if click in left button
  //{
  //  currentLetter --;
  //  if (currentLetter<'_') //wrap around to z
  //    currentLetter = 'z';
  //}

  //if (didMouseClick(200+sizeOfInputArea/2, 200+sizeOfInputArea/2, sizeOfInputArea/2, sizeOfInputArea/2)) //check if click in right button
  //{
  //  currentLetter ++;
  //  if (currentLetter>'z') //wrap back to space (aka underscore)
  //    currentLetter = '_';
  //}

  //if (didMouseClick(200, 200, sizeOfInputArea, sizeOfInputArea/2)) //check if click occured in letter area
  //{
  //  if (currentLetter=='_') //if underscore, consider that a space bar
  //    currentTyped+=" ";
  //  else if (currentLetter=='`' & currentTyped.length()>0) //if `, treat that as a delete command
  //    currentTyped = currentTyped.substring(0, currentTyped.length()-1);
  //  else if (currentLetter!='`') //if not any of the above cases, add the current letter to the typed string
  //    currentTyped+=currentLetter;
  //}

  //You are allowed to have a next button outside the 2" area
  if (didMouseClick(800, 00, 200, 200)) //check if click is in next button
  {
  nextTrial(); //if so, advance to next trial
  }
}
//

void nextTrial()
{
  if (currTrialNum >= totalTrialNum) //check to see if experiment is done
    return; //if so, just return

    if (startTime!=0 && finishTime==0) //in the middle of trials
  {
    System.out.println("==================");
    System.out.println("Phrase " + (currTrialNum+1) + " of " + totalTrialNum); //output
    System.out.println("Target phrase: " + currentPhrase); //output
    System.out.println("Phrase length: " + currentPhrase.length()); //output
    System.out.println("User typed: " + currentTyped); //output
    System.out.println("User typed length: " + currentTyped.length()); //output
    System.out.println("Number of errors: " + computeLevenshteinDistance(currentTyped.trim(), currentPhrase.trim())); //trim whitespace and compute errors
    System.out.println("Time taken on this trial: " + (millis()-lastTime)); //output
    System.out.println("Time taken since beginning: " + (millis()-startTime)); //output
    System.out.println("==================");
    lettersExpectedTotal+=currentPhrase.length();
    lettersEnteredTotal+=currentTyped.length();
    errorsTotal+=computeLevenshteinDistance(currentTyped.trim(), currentPhrase.trim());
  }

  //probably shouldn't need to modify any of this output / penalty code.
  if (currTrialNum == totalTrialNum-1) //check to see if experiment just finished
  {
    finishTime = millis();
    System.out.println("==================");
    System.out.println("Trials complete!"); //output
    System.out.println("Total time taken: " + (finishTime - startTime)); //output
    System.out.println("Total letters entered: " + lettersEnteredTotal); //output
    System.out.println("Total letters expected: " + lettersExpectedTotal); //output
    System.out.println("Total errors entered: " + errorsTotal); //output
    
    float wpm = (lettersEnteredTotal/5.0f)/((finishTime - startTime)/60000f); //FYI - 60K is number of milliseconds in minute
    System.out.println("Raw WPM: " + wpm); //output
    
    float freebieErrors = lettersExpectedTotal*.05; //no penalty if errors are under 5% of chars
    
    System.out.println("Freebie errors: " + freebieErrors); //output
    float penalty = max(errorsTotal-freebieErrors,0) * .5f;
    
    System.out.println("Penalty: " + penalty);
    System.out.println("WPM w/ penalty: " + (wpm-penalty)); //yes, minus, becuase higher WPM is better
    System.out.println("==================");
    
    currTrialNum++; //increment by one so this mesage only appears once when all trials are done
    return;
  }

  if (startTime==0) //first trial starting now
  {
    System.out.println("Trials beginning! Starting timer..."); //output we're done
    startTime = millis(); //start the timer!
  }
  else
  {
    currTrialNum++; //increment trial number
  }

  lastTime = millis(); //record the time of when this trial ended
  currentTyped = ""; //clear what is currently typed preparing for next trial
  currentPhrase = phrases[currTrialNum]; // load the next phrase!
  //currentPhrase = "abc"; // uncomment this to override the test phrase (useful for debugging)
}



//=========SHOULD NOT NEED TO TOUCH THIS METHOD AT ALL!==============
int computeLevenshteinDistance(String phrase1, String phrase2) //this computers error between two strings
{
  int[][] distance = new int[phrase1.length() + 1][phrase2.length() + 1];

  for (int i = 0; i <= phrase1.length(); i++)
    distance[i][0] = i;
  for (int j = 1; j <= phrase2.length(); j++)
    distance[0][j] = j;

  for (int i = 1; i <= phrase1.length(); i++)
    for (int j = 1; j <= phrase2.length(); j++)
      distance[i][j] = min(min(distance[i - 1][j] + 1, distance[i][j - 1] + 1), distance[i - 1][j - 1] + ((phrase1.charAt(i - 1) == phrase2.charAt(j - 1)) ? 0 : 1));

  return distance[phrase1.length()][phrase2.length()];
}