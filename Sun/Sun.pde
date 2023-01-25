import gifAnimation.*;

int br;
int pc = 150;
float nm = 10;
float o = .0075;

Loop a;
Loop b;
Loop c;
Stars s;

GifMaker gif;
float ft = TAU/o;
boolean gs = false;

void setup() {
  size(700, 700);
  frameRate(30);
  noStroke();
  br = width/6;
  a = new Loop(pc, width/5, 220, nm+2, 0, o);
  b = new Loop(pc, width/7, 110, nm, 0, o);
  c = new Loop(pc, br, 10, nm, 0, o);
  
  s = new Stars(500);
  
  gif = new GifMaker(this, "star.gif");
  gif.setRepeat(0);
}

void draw() {
  print(frameRate, "\n");
  background(0);
  s.render();
  translate(width/2,height/2);
  
  fill(255, 255, 0, 150);
  a.render();
  fill(255, 100, 0, 255);
  b.render();
  fill(255,50,0,255);
  c.render();
  
  a.update();
  b.update();
  c.update();
  
  handleGif();
}

void handleGif() {
  gif.setDelay(1000/30);
  gif.addFrame();
  if(frameCount > ft && !gs) {
   gs = gif.finish();
   if(gs) {
     print("Gif successfully exported");
    }
    else {
      print("Gif failed to export");
    }
  }
}
