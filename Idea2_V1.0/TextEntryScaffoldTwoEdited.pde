import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;

class Rectangle2D {
  private float x;
  private float y;
  private float w;
  private float h;
  
  public Rectangle2D(float x1, float y1, float w1, float h1) {
    x = x1;
    y = y1;
    w = w1;
    h = h1;
  }
  
  public float getX() {
    return x;
  }
  
  public float getY() {
    return y;
  }
  
  public float getWidth() {
    return w;
  }
  
  public float getHeight() {
    return h;
  }
  
}

class Line {
  private float x1;
  private float y1;
  private float x2;
  private float y2;
  
  public Line(float x1temp, float y1temp, float x2temp, float y2temp) {
    x1 = x1temp;
    y1 = y1temp;
    x2 = x2temp;
    y2 = y2temp;
  }
  
  public float getX1() {
    return x1;
  }
  
  public float getY1() {
    return y1;
  }
  
  public float getX2() {
    return x2;
  }
  
  public float getY2() {
    return y2;
  }
  
  public boolean equals(Object o) {
    if (o == this) return true;
    if (!(o instanceof Line)) {
      return false;
    }
    Line line = (Line) o;
    return (line.getX1() == getX1() &&
            line.getY1() == getY1() &&
            line.getX2() == getX2() &&
            line.getY2() == getY2()) ||
           (line.getX1() == getX2() &&
            line.getY1() == getY2() &&
            line.getX2() == getX1() &&
            line.getY2() == getY1());
  }
  
  public int hashCode() {
    double result = getX1() + getX2() + getY1() + getY2();
    return (int)result;
  }
}

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

//Variables for my silly implementation. You can delete this:
char currentLetter = 'a';

//You can modify anything in here. This is just a basic implementation.

float inputCenterX = 200 + sizeOfInputArea/2;
float inputCenterY = 200 + sizeOfInputArea/2;
float border = 170.0;
Rectangle2D[][] dotMatrix = new Rectangle2D[3][3];
float xSize = sizeOfInputArea - border;
float ySize = sizeOfInputArea - border;
float dotSize = 150;
Rectangle2D startDot;
HashSet<Line> letterLineSet = new HashSet<Line>();
boolean canDrawLine = false;

HashSet<Line> a = new HashSet<Line>();
HashSet<Line> a1 = new HashSet<Line>();
HashSet<Line> a2 = new HashSet<Line>();
HashSet<Line> b = new HashSet<Line>();
HashSet<Line> b1 = new HashSet<Line>();
HashSet<Line> b2 = new HashSet<Line>();
HashSet<Line> c = new HashSet<Line>();
HashSet<Line> c1 = new HashSet<Line>();
HashSet<Line> c2 = new HashSet<Line>();
HashSet<Line> c3 = new HashSet<Line>();
HashSet<Line> c4 = new HashSet<Line>();
HashSet<Line> c5 = new HashSet<Line>();
HashSet<Line> c6 = new HashSet<Line>();
HashSet<Line> d = new HashSet<Line>();
HashSet<Line> d1 = new HashSet<Line>();
HashSet<Line> d2 = new HashSet<Line>();
HashSet<Line> d3 = new HashSet<Line>();
HashSet<Line> d4 = new HashSet<Line>();
HashSet<Line> e = new HashSet<Line>();
HashSet<Line> e1 = new HashSet<Line>();
HashSet<Line> e2 = new HashSet<Line>();
HashSet<Line> e3 = new HashSet<Line>();
HashSet<Line> e4 = new HashSet<Line>();
HashSet<Line> e5 = new HashSet<Line>();
HashSet<Line> f = new HashSet<Line>();
HashSet<Line> f1 = new HashSet<Line>();
HashSet<Line> f2 = new HashSet<Line>();
HashSet<Line> g = new HashSet<Line>();
HashSet<Line> g1 = new HashSet<Line>();
HashSet<Line> g2 = new HashSet<Line>();
HashSet<Line> g3 = new HashSet<Line>();
HashSet<Line> g4 = new HashSet<Line>();
HashSet<Line> g5 = new HashSet<Line>();
HashSet<Line> h = new HashSet<Line>();
HashSet<Line> h1 = new HashSet<Line>();
HashSet<Line> h2 = new HashSet<Line>();
HashSet<Line> h3 = new HashSet<Line>();
HashSet<Line> i = new HashSet<Line>();
HashSet<Line> i1 = new HashSet<Line>();
HashSet<Line> i2 = new HashSet<Line>();
HashSet<Line> i3 = new HashSet<Line>();
HashSet<Line> i4 = new HashSet<Line>();
HashSet<Line> i5 = new HashSet<Line>();
HashSet<Line> i6 = new HashSet<Line>();
HashSet<Line> j = new HashSet<Line>();
HashSet<Line> j1 = new HashSet<Line>();
HashSet<Line> j2 = new HashSet<Line>();
HashSet<Line> j3 = new HashSet<Line>();
HashSet<Line> k = new HashSet<Line>();
HashSet<Line> k1 = new HashSet<Line>();
HashSet<Line> l = new HashSet<Line>();
HashSet<Line> l1 = new HashSet<Line>();
HashSet<Line> l2 = new HashSet<Line>();
HashSet<Line> l3 = new HashSet<Line>();
HashSet<Line> m = new HashSet<Line>();
HashSet<Line> m1 = new HashSet<Line>();
HashSet<Line> m2 = new HashSet<Line>();
HashSet<Line> m3 = new HashSet<Line>();
HashSet<Line> n = new HashSet<Line>();
HashSet<Line> n1 = new HashSet<Line>();
HashSet<Line> n2 = new HashSet<Line>();
HashSet<Line> n3 = new HashSet<Line>();
HashSet<Line> n4 = new HashSet<Line>();
HashSet<Line> n5 = new HashSet<Line>();
HashSet<Line> n6 = new HashSet<Line>();
HashSet<Line> o = new HashSet<Line>();
HashSet<Line> o1 = new HashSet<Line>();
HashSet<Line> o2 = new HashSet<Line>();
HashSet<Line> o3 = new HashSet<Line>();
HashSet<Line> o4 = new HashSet<Line>();
HashSet<Line> o5 = new HashSet<Line>();
HashSet<Line> o6 = new HashSet<Line>();
HashSet<Line> p = new HashSet<Line>();
HashSet<Line> p1 = new HashSet<Line>();
HashSet<Line> p2 = new HashSet<Line>();
HashSet<Line> q = new HashSet<Line>();
HashSet<Line> q1 = new HashSet<Line>();
HashSet<Line> q2 = new HashSet<Line>();
HashSet<Line> q3 = new HashSet<Line>();
HashSet<Line> r = new HashSet<Line>();
HashSet<Line> r1 = new HashSet<Line>();
HashSet<Line> r2 = new HashSet<Line>();
HashSet<Line> r3 = new HashSet<Line>();
HashSet<Line> r4 = new HashSet<Line>();
HashSet<Line> r5 = new HashSet<Line>();
HashSet<Line> s = new HashSet<Line>();
HashSet<Line> s1 = new HashSet<Line>();
HashSet<Line> s2 = new HashSet<Line>();
HashSet<Line> t = new HashSet<Line>();
HashSet<Line> u = new HashSet<Line>();
HashSet<Line> u1 = new HashSet<Line>();
HashSet<Line> u2 = new HashSet<Line>();
HashSet<Line> u3 = new HashSet<Line>();
HashSet<Line> u4 = new HashSet<Line>();
HashSet<Line> u5 = new HashSet<Line>();
HashSet<Line> u6 = new HashSet<Line>();
HashSet<Line> v = new HashSet<Line>();
HashSet<Line> v1 = new HashSet<Line>();
HashSet<Line> v2 = new HashSet<Line>();
HashSet<Line> w = new HashSet<Line>();
HashSet<Line> w1 = new HashSet<Line>();
HashSet<Line> w2 = new HashSet<Line>();
HashSet<Line> w3 = new HashSet<Line>();
HashSet<Line> x = new HashSet<Line>();
HashSet<Line> y = new HashSet<Line>();
HashSet<Line> y1 = new HashSet<Line>();
HashSet<Line> y2 = new HashSet<Line>();
HashSet<Line> z = new HashSet<Line>();

void setup()
{
  phrases = loadStrings("phrases2.txt"); //load the phrase set into memory
  Collections.shuffle(Arrays.asList(phrases)); //randomize the order of the phrases
    
  orientation(PORTRAIT); //can also be LANDSCAPE -- sets orientation on android device
  size(1000, 1000); //Sets the size of the app. You may want to modify this to your device. Many phones today are 1080 wide by 1920 tall.
  textFont(createFont("Arial", 24)); //set the font to arial 24
  noStroke(); //my code doesn't use any strokes.
  
  print(inputCenterX - xSize/2);
  
    ellipse(0, 0, 50, 50);
    ellipse(xSize/2, 0, 50, 50);
    ellipse(2*xSize/2, 0, 50, 50);
    
  float xVal = 0.0;
  for(int x = 0; x < 3; x++) {
    float yVal = 0.0;
    for(int y = 0; y < 3; y++) {
      Rectangle2D dot = new Rectangle2D(xVal, yVal, dotSize, dotSize);
      dotMatrix[x][y] = dot;
      yVal += ySize/2;
    }
    xVal += xSize/2;
  }
  
  a.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));a.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));a.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));a.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));a.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));a.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));a.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));a.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));
  b.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));b.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));b.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));b.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));b.add(new Line((float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));b.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));b.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));
  c.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));c.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));c.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));c.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));c.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));c.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));
  d.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));d.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));d.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));d.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));d.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));d.add(new Line((float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));d.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));
  e.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));e.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));e.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));e.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));e.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));e.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));e.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));e.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));
  f.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));f.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));f.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));f.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));f.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));f.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));
  g.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));g.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));g.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));g.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));g.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));g.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));g.add(new Line((float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));g.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));
  h.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));h.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));h.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));h.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));h.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));h.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));
  i.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));i.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));
  j.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));j.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));j.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));j.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));
  k.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));k.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));k.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));k.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));
  l.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));l.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));l.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));l.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));
  m.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));m.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));m.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));m.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));m.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));m.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));
  n.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));n.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));n.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));n.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));n.add(new Line((float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));n.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));
  o.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));o.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));o.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));o.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));o.add(new Line((float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));o.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));o.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));o.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));
  p.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));p.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));p.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));p.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));p.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));p.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));p.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));
  q.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));q.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));q.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));q.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));q.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));q.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));q.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));
  r.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));r.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));r.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));r.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));r.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));r.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));
  s.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));s.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));s.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));s.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));s.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));s.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));s.add(new Line((float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));s.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));
  t.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));t.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));t.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));t.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));
  u.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));u.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));u.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));u.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));u.add(new Line((float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));u.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));
  v.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));v.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));
  w.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));w.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));w.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));w.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));w.add(new Line((float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));w.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));
  x.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));x.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));x.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));x.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));
  y.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));y.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));y.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));
  z.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));z.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));z.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));z.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));z.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));z.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));
  a1.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));a1.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));a1.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));a1.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));a1.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));
  a2.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));a2.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));a2.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));a2.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));a2.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));
  b1.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));b1.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));b1.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));b1.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));b1.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));
  b2.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));b2.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));b2.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));b2.add(new Line((float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));b2.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));
  c1.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));c1.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));c1.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));c1.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));
  c2.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));c2.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));c2.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));c2.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));
  c3.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));c3.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));c3.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));
  c4.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));c4.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));c4.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));
  c5.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));c5.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));c5.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));
  c6.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));c6.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));c6.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));
  d1.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));d1.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));d1.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));d1.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));d1.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));
  d2.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));d2.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));d2.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));d2.add(new Line((float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));d2.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));
  d3.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));d3.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));d3.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));d3.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));
  d4.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));d4.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));d4.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));d4.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));
  e1.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));e1.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));e1.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));e1.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));e1.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));
  e2.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));e2.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));e2.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));e2.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));e2.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));
  e3.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));e3.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));e3.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));e3.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));e3.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));e3.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));e3.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));e3.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));e3.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));
  e4.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));e4.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));e4.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));e4.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));e4.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));e4.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));
  e5.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));e5.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));e5.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));e5.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));e5.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));e5.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));
  f1.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));f1.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));f1.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));f1.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));
  f2.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));f2.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));f2.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));f2.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));
  g1.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));g1.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));g1.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));g1.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));g1.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));
  g2.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));g2.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));g2.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));g2.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));g2.add(new Line((float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));
  g3.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));g3.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));g3.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));g3.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));g3.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));g3.add(new Line((float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));g3.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));
  h1.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));h1.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));h1.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));h1.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));
  h2.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));h2.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));h2.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));h2.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));
  h3.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));h3.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));h3.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));h3.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));h3.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));
  i.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));i.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));i.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));i.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));i.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));i.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));
  i1.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));
  i2.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));
  i3.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));
  i4.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));
  i5.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));
  i6.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));
  j1.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));j1.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));j1.add(new Line((float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));j1.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));
  j2.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));j2.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));j2.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));j2.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));j2.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));j2.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));
  j3.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));j3.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));j3.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));j3.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));j3.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));
  k1.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));k1.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));k1.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));k1.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));
  l1.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));l1.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));l1.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));
  l2.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));l2.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));l2.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));
  l3.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));l3.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));
  m1.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));m1.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));m1.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));m1.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));m1.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));m1.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));m1.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));m1.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));
  m2.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));m2.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));m2.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));m2.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));m2.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));
  m3.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));m3.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));m3.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));m3.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));m3.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));
  n1.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));n1.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));n1.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));n1.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));n1.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));
  n2.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));n2.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));n2.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));n2.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));n2.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));
  n3.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));n3.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));n3.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));
  n4.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));n4.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));n4.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));
  n5.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));n5.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));n5.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));
  n6.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));n6.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));n6.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));
  o1.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));o1.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));o1.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));o1.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));o1.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));o1.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));
  o2.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));o2.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));o2.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));o2.add(new Line((float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));o2.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));o2.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));
  o3.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));o3.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));o3.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));o3.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));
  o4.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));o4.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));o4.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));o4.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));
  o5.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));o5.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));o5.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));o5.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));
  o6.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));o6.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));o6.add(new Line((float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));o6.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));
  p1.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));p1.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));p1.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));p1.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));p1.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));
  p2.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));p2.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));p2.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));p2.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));p2.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));
  q1.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));q1.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));q1.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));q1.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));q1.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));
  q2.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));q2.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));q2.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));q2.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));q2.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));
  q3.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));q3.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));q3.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));q3.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));q3.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));q3.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));
  r1.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));r1.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));r1.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));r1.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));r1.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));r1.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));
  s1.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));s1.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));s1.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));s1.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));s1.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));
  s2.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));s2.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));s2.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));s2.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));s2.add(new Line((float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));
  u1.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));u1.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));u1.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));u1.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));u1.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));
  u2.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));u2.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));u2.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));u2.add(new Line((float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));u2.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));
  u3.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));u3.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));u3.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));
  u4.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));u4.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));u4.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));
  u5.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));u5.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));u5.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));
  u6.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));u6.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));u6.add(new Line((float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));
  v1.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));v1.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));
  v2.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));v2.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));
  w1.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));w1.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));w1.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));w1.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));w1.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));w1.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));w1.add(new Line((float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));w1.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));
  w2.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));w2.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));w2.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));w2.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));w2.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));
  w3.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));w3.add(new Line((float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));w3.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));w3.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));w3.add(new Line((float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));
  g4.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY()));g4.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));g4.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));g4.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));g4.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));g4.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));
  g5.add(new Line((float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));g5.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));g5.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));g5.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));g5.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));g5.add(new Line((float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));
  r2.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));r2.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));
  r3.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));r3.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));
  r4.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));r4.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));
  r5.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));r5.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));
  y1.add(new Line((float)dotMatrix[0][0].getX(), (float)dotMatrix[0][0].getY(), (float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY()));y1.add(new Line((float)dotMatrix[0][1].getX(), (float)dotMatrix[0][1].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));y1.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY()));y1.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));y1.add(new Line((float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY(), (float)dotMatrix[0][2].getX(), (float)dotMatrix[0][2].getY()));
  y2.add(new Line((float)dotMatrix[1][0].getX(), (float)dotMatrix[1][0].getY(), (float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY()));y2.add(new Line((float)dotMatrix[1][1].getX(), (float)dotMatrix[1][1].getY(), (float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY()));y2.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][0].getX(), (float)dotMatrix[2][0].getY()));y2.add(new Line((float)dotMatrix[2][1].getX(), (float)dotMatrix[2][1].getY(), (float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY()));y2.add(new Line((float)dotMatrix[2][2].getX(), (float)dotMatrix[2][2].getY(), (float)dotMatrix[1][2].getX(), (float)dotMatrix[1][2].getY()));
  

}

//You can modify anything in here. This is just a basic implementation.
void draw()
{
  background(0); //clear background

 // image(watch,-200,200);
  stroke(0, 0, 0);
  fill(100);
  rect(200, 200, sizeOfInputArea, sizeOfInputArea); //input area should be 2" by 2"

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
    stroke(0, 0, 0);
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

    //MY draw code
    strokeWeight(0);
    translate(inputCenterX - xSize/2, inputCenterY - ySize/2);
    for(int x = 0; x < 3; x++) {
      for(int y = 0; y < 3; y++) {
        Rectangle2D dot = dotMatrix[x][y];
        ellipse((float)dot.getX(), (float)dot.getY(),(float) dot.getWidth(), (float)dot.getHeight());
      }
    }
    
    stroke(0, 255, 0);
    strokeWeight(15);
    for (Line line : letterLineSet) {
      line((float)line.getX1(),(float)line.getY1(), (float)line.getX2(), (float)line.getY2());
    }
    if(canDrawLine)
      line((float)startDot.getX(), (float)startDot.getY(), mouseX - (inputCenterX - xSize/2), mouseY - (inputCenterY - ySize/2));
  }
  
}

boolean didMouseClick(float x, float y, float w, float h) //simple function to do hit testing
{
  return (mouseX > x && mouseX<x+w && mouseY>y && mouseY<y+h); //check to see if it is in button bounds
}


int prevX = 0;
int prevY = 0;

void mousePressed()
{
  float translateMouseX = mouseX - (inputCenterX - xSize/2);
  float translateMouseY = mouseY - (inputCenterY - ySize/2);
  for (int x = 0; x < 3; x++) {
    for (int y = 0; y < 3; y++) {
      Rectangle2D dot = dotMatrix[x][y];
      if (translateMouseX >= dot.getX() - dot.getWidth()/2 && translateMouseX <= dot.getX() + dot.getWidth()/2
          && translateMouseY >= dot.getY() - dot.getHeight()/2 && translateMouseY <= dot.getY() + dot.getHeight()/2) {
        startDot = dot;
        prevX = x;
        prevY = y;
        canDrawLine = true;
      }
    }
  }
  
  //You are allowed to have a next button outside the 2" area
  if (didMouseClick(800, 00, 200, 200)) //check if click is in next button
  {
    nextTrial(); //if so, advance to next trial
  }
}

void mouseDragged() 
{
  float translateMouseX = mouseX - (inputCenterX - xSize/2);
  float translateMouseY = mouseY - (inputCenterY - ySize/2);
  for (int x = 0; x < 3; x++) {
    for (int y = 0; y < 3; y++) {
      Rectangle2D dot = dotMatrix[x][y];
      if (canDrawLine && translateMouseX >= dot.getX() - dot.getWidth()/2 && translateMouseX <= dot.getX() + dot.getWidth()/2
          && translateMouseY >= dot.getY() - dot.getHeight()/2 && translateMouseY <= dot.getY() + dot.getHeight()/2
          && !(translateMouseX >= startDot.getX() - startDot.getWidth()/2 && translateMouseX <= startDot.getX() + startDot.getWidth()/2
          && translateMouseY >= startDot.getY() - startDot.getHeight()/2 && translateMouseY <= startDot.getY() + startDot.getHeight()/2)) {
        Line line = new Line((float)startDot.getX(), (float)startDot.getY(), (float)dot.getX(), (float)dot.getY());
        
        if(!letterLineSet.contains(line)) {
          print("l3.add(new Line(" + "(float)dotMatrix[" + prevX + "][" + prevY + "].getX(), " + "(float)dotMatrix[" + prevX + "][" + prevY + "].getY(), " + "(float)dotMatrix[" + x + "][" + y + "].getX(), " + "(float)dotMatrix[" + x + "][" + y + "].getY()));");
          letterLineSet.add(line);
        }
        startDot = dot; 
        prevX = x;
        prevY = y;
      }
    }
  }
}

void mouseReleased(MouseEvent mouseE) {
  canDrawLine = false;
  print("\n");
  if (mouseE.getClickCount() == 2 && currentTyped.length() > 1 && letterLineSet.isEmpty()) {
    currentTyped = currentTyped.substring(0, currentTyped.length() - 2);
    print("delete\n");
  } else if (mouseE.getClickCount() == 1 && letterLineSet.isEmpty()) {
    currentTyped+=" ";
    print(" \n");
  } else if (letterLineSet.equals(a) || letterLineSet.equals(a1) || letterLineSet.equals(a2)){
    currentTyped+="a";
    print("a\n");
  } else if (letterLineSet.equals(b) || letterLineSet.equals(b1) || letterLineSet.equals(b2)){
    currentTyped+="b";
    print("b\n");
  } else if (letterLineSet.equals(c) || letterLineSet.equals(c1) || letterLineSet.equals(c2) || letterLineSet.equals(c3) || letterLineSet.equals(c4) || letterLineSet.equals(c5) || letterLineSet.equals(c6)){
    currentTyped+="c";
    print("c\n");
  } else if (letterLineSet.equals(d) || letterLineSet.equals(d1) || letterLineSet.equals(d2) || letterLineSet.equals(d3) || letterLineSet.equals(d4)){
    currentTyped+="d";
    print("d\n");
  } else if (letterLineSet.equals(e) || letterLineSet.equals(e1) || letterLineSet.equals(e2) || letterLineSet.equals(e3) || letterLineSet.equals(e4) || letterLineSet.equals(e5)){
    print("e\n");
    currentTyped+="e";
    print("e\n");
  } else if (letterLineSet.equals(f) || letterLineSet.equals(f1) || letterLineSet.equals(f2)){
    currentTyped+="f";
    print("f\n");
  } else if (letterLineSet.equals(g) || letterLineSet.equals(g1) || letterLineSet.equals(g2) || letterLineSet.equals(g3) || letterLineSet.equals(g4) || letterLineSet.equals(g5)){
    currentTyped+="g";
    print("g\n");
  } else if (letterLineSet.equals(h) || letterLineSet.equals(h1) || letterLineSet.equals(h2) || letterLineSet.equals(h3)){
    currentTyped+="h";
    print("h\n");
  } else if (letterLineSet.equals(i) || letterLineSet.equals(i1) || letterLineSet.equals(i2) || letterLineSet.equals(i3) || letterLineSet.equals(i4) || letterLineSet.equals(i5) || letterLineSet.equals(i6)){
    currentTyped+="i";
    print("i\n");
  } else if (letterLineSet.equals(j) || letterLineSet.equals(j1) || letterLineSet.equals(j2) || letterLineSet.equals(j3)){
    currentTyped+="j";
    print("j\n");
  } else if (letterLineSet.equals(k) || letterLineSet.equals(k1)){
    currentTyped+="k";
    print("k\n");
  } else if (letterLineSet.equals(l) || letterLineSet.equals(l1) || letterLineSet.equals(l2) || letterLineSet.equals(l3)){
    currentTyped+="l";
    print("l\n");
  } else if (letterLineSet.equals(m) || letterLineSet.equals(m1) || letterLineSet.equals(m2) || letterLineSet.equals(m3)){
    currentTyped+="m";
    print("m\n");
  } else if (letterLineSet.equals(n) || letterLineSet.equals(n1) || letterLineSet.equals(n2) || letterLineSet.equals(n3) || letterLineSet.equals(n4) || letterLineSet.equals(n5) || letterLineSet.equals(n6)){
    currentTyped+="n";
    print("n\n");
  } else if (letterLineSet.equals(o) || letterLineSet.equals(o1) || letterLineSet.equals(o2) || letterLineSet.equals(o3) || letterLineSet.equals(o4) || letterLineSet.equals(o5) || letterLineSet.equals(o6)){
    currentTyped+="o";
    print("o\n");
  } else if (letterLineSet.equals(p) || letterLineSet.equals(p1) || letterLineSet.equals(p2)){
    currentTyped+="p";
    print("p\n");
  } else if (letterLineSet.equals(q) || letterLineSet.equals(q1) || letterLineSet.equals(q2) || letterLineSet.equals(q3)){
    currentTyped+="q";
    print("q\n");
  } else if (letterLineSet.equals(r) || letterLineSet.equals(r1) || letterLineSet.equals(r2) || letterLineSet.equals(r3) || letterLineSet.equals(r4) || letterLineSet.equals(r5)){
    currentTyped+="r";
    print("r\n");
  } else if (letterLineSet.equals(s) || letterLineSet.equals(s1) || letterLineSet.equals(s2)){
    currentTyped+="s";
    print("s\n");
  } else if (letterLineSet.equals(t)){
    currentTyped+="t";
    print("t\n");
  } else if (letterLineSet.equals(u) || letterLineSet.equals(u1) || letterLineSet.equals(u2) || letterLineSet.equals(u3) || letterLineSet.equals(u4) || letterLineSet.equals(u5) || letterLineSet.equals(u6)){
    currentTyped+="u";
    print("u\n");
  } else if (letterLineSet.equals(v) || letterLineSet.equals(v1) || letterLineSet.equals(v2)){
    currentTyped+="v";
    print("v\n");
  } else if (letterLineSet.equals(w) || letterLineSet.equals(w1) || letterLineSet.equals(w2) || letterLineSet.equals(w3)){
    currentTyped+="w";
    print("w\n");
  } else if (letterLineSet.equals(x)){
    currentTyped+="x";
    print("x\n");
  } else if (letterLineSet.equals(y) || letterLineSet.equals(y1) || letterLineSet.equals(y2)){
    currentTyped+="y";
    print("y\n");
  } else if (letterLineSet.equals(z)){
    currentTyped+="z";
    print("z\n");
  }
  
  print("\n");
  letterLineSet.clear();
}

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