int w;                      // Width of entire wave
float[] points;
float[] v;
ArrayList<Wave> waves;

static final int pointCount = 1024;         // How far apart should each horizontal location be spaced
static final int r = 150;     // Radius of circle in pixels

void setup() {
  size(600, 600);
  noStroke();
  w = 100;
  points = new float[pointCount];
  v = new float[pointCount];

  Wave wave1 = new Wave(pointCount, 0, 75, (PI*74)/4);
  //Wave wave2 = new Wave(pointCount, PI/4, 120 , PI*4);
 
  waves = new ArrayList<Wave>();
  waves.add(wave1);
  //waves.add(wave2);
}

void draw() {
  background(20);
  translate(width/2, height/2);
  addWaves();
  renderWave();
}

void addWaves() {
  for(int i = 0; i < points.length; i++) {
   points[i] = 0; 
   v[i] = 0;
  }
  
  for(Wave wave : waves) {
    wave.calcWave();
    for(int i = 0; i < wave.yvalues.length; i++) {
      points[i] += wave.yvalues[i];
      v[i] += wave.v[i];
    }
  }
}

void renderWave() {
  //stroke(220);
  //beginShape(LINES);
  for (int x = 0; x < points.length; x++) {
    float thetaL = x;
    float rL = r + points[x];
    float xP = rL*cos(thetaL);
    float yP = rL*sin(thetaL);
    
    float vel = v[x];
    float c = map(vel, -75, 75, 0, 210);
    fill(abs(255-c));
    ellipse(xP, yP, 4, 4);
  }
  //endShape();
}
