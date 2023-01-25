ArrayList<Wave> waves;

static final int pointCount = 1024;  // How many points for each wave
static final int rBase = 150;     // Radius of circle in pixels

void setup() {
  size(600, 600);
  noStroke();
  
  waves = new ArrayList<Wave>();
  
  // -- Create waves here --
  // Wave(pointCount, theta, omega, amplitude, period);
  SimpleWave wave1 = new SimpleWave(pointCount, 0, .01, 50, 43);
  SimpleWave wave2 = new SimpleWave(pointCount, 0, .01, 2, .01);
  
  ComplexWave redWave = new ComplexWave(wave1, wave2);
  redWave.renderStyle = "dots";
  redWave.col = color(255, 0, 0);
  
  SimpleWave wave3 = new SimpleWave(pointCount, 0, -.01, 40, (PI/8));
  ComplexWave wave63 = new ComplexWave(wave1, wave3);
  wave63.renderStyle = "dots";
  wave63.col = color(255,255,255);
  
  SimpleWave wave5 = new SimpleWave(pointCount, 0, .01, 2, .01);
  
  ComplexWave wave45 = new ComplexWave(wave1, wave5);
  wave45.renderStyle = "dots";
  wave45.col = color(0, 255, 0);

  waves.add(wave63);
  //waves.add(redWave);  
  //waves.add(wave45);
}

void draw() {
  background(20);  // Clears frame
  translate(width/2, height/2);  // Move to center of screen
  generateWaves();
}

void generateWaves() {
 for(Wave wave : waves) {
   wave.calcWave();
   wave.renderWave();
 }
}
