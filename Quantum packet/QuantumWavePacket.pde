class QuantumWavePacket {
  float[][] yvalues;
  float[][] v;
  float[][] a;
  float amplitude;
  float dx;
  float dy;
  float speed;

  QuantumWavePacket(int xCount, int yCount, float amp, float xPeriod, float yPeriod, float s) {
    yvalues = new float[xCount][yCount];
    v = new float[xCount][yCount];
    a = new float[xCount][yCount];
    amplitude = amp;
    dx = (TWO_PI / xPeriod);
    dy = (TWO_PI / yPeriod);
    speed = s;
  }

  void reset() {
    for (int i = 0; i < yvalues.length; i++) {
      for (int j = 0; j < yvalues[i].length; j++) {
        yvalues[i][j] = 0;
        v[i][j] = 0;
        a[i][j] = 0;
      }
    }
  }

  void calcWave(float t) {
    for (int i = 0; i < yvalues.length; i++) {
      for (int j = 0; j < yvalues[i].length; j++) {
        yvalues[i][j] = amplitude * sin(i * dx + j * dy + t * speed);
      }
    }
  }
  void renderWave() {
    for (int i = 0; i < yvalues.length; i++) {
      for (int j = 0; j < yvalues[i].length; j++) {
        float x = map(i, 0, yvalues.length - 1, -width/2, width/2);
        float y = map(yvalues[i][j], -amplitude, amplitude, -height/2, height/2);
        ellipse(x, y, 5, 5);
      }
    }
  }
}
  
