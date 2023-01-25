void setup() {
  size(600, 600);
  background(0);
  strokeWeight(1);
  stroke(255);
}

int xCount = 50;
int yCount = 50;
float amp = 1;
float xPeriod = 1;
float yPeriod = 1;
float speed = 0.1;

QuantumWavePacket packet = new QuantumWavePacket(xCount, yCount, amp, xPeriod, yPeriod, speed);

void draw() {
  background(0);
  translate(width/2, height/2);  // Move to center of screen
  packet.calcWave(frameCount * 0.1);
  packet.renderWave();
}
