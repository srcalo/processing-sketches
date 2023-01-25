import gifAnimation.*;

float radius = 100;
int pointCount = 600;
int n = 10;
int waveCount = 3;
float startScale = 2;
float scaleI = .07;
int pMax = 1000;

float Xinc = TWO_PI/pointCount;
ArrayList<Wave> waves;
Wave wave;
Wave wave2;

int p = 2;
int genPeriod() {
  p = round(random(1,100));
  return 1000;
}

Wave genWave() {
   return new Wave(random(0,width), random(-0.15,0.15), random(1, 35), genPeriod());
}

void setup() {
  size(700,700);
  noStroke();
  waves = new ArrayList<Wave>();
  
  waves.add(genWave());
  for(int x = 1; x < waveCount; x++) {
    waves.add(genWave());

  }
  
  for(Wave w : waves) {
     print(String.format("%f   %f   %f   %d", w.theta, w.omega, w.amplitude, w.period), "\n");
  }
}

void draw() {
  background(255);
  translate(width/2, height/2);
  float s = startScale;
  for(Wave w : waves) {
    w.update(); 
  }
  for(int i = 0; i < n; i++) {
    pushMatrix();
    float c = map(i, 0, n, 0, 250);
    scale(s);
    fill(c);
    renderWaves();
    popMatrix();
    s -= scaleI;
  }
}


void renderWaves() {
  float t = 0;
  for(float x = 0; x < TWO_PI; x += Xinc) {
    t = map(x, 0, TWO_PI, 0, pMax);
    float r = radius;
    for(Wave w : waves) {
      r += w.evaluate(t); 
    }
    ellipse(r*cos(x), r*sin(x), 2, 2);
  }
}
