/**
 * Sine Wave
 * by Daniel Shiffman.  
 * 
 * Render a simple sine wave. 
 */
 
int xspacing = 1;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 75.0;  // Height of wave
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave
// asin(theta)

float pDir = 1;
float pMax = 600;
float pMin = 10;
float period = pMax;  // How many pixels before the wave repeats

void setup() {
  size(640, 360);
  w = width+16;
  yvalues = new float[w/xspacing];
  dx = (TWO_PI / period) * xspacing;
}

void draw() {
  background(0);
  text(period, 10, 20);
  //updateParams();
  calcWave();
  renderWave();
}

void updateParams() {
 if (period <= pMin || period > pMax) {
   pDir *= -1;
 }
  period += pDir;
  dx = (TWO_PI / period) * xspacing;

}

void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += .01;
  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = amplitude*sin(x);
    x+=dx;
  }
}

void renderWave() {
  noStroke();
  fill(255);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    ellipse(x*xspacing, height/2+yvalues[x], 2, 2);
  }
}
