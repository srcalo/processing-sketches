class Wave {
  float theta;  // Start angle
  float amplitude;  // Height of the wave
  float[] yvalues;  // Height for all values in the wave
  float[] v;  // Velocities for all points in the wave
  float dx;
  
  Wave(int pointCount, float t, float a, float period) {
    theta = t;
    amplitude = a;
    yvalues = new float[pointCount];
    v = new float[pointCount];
    dx = (TWO_PI / period);
  }
  
  void calcWave() {
    // Increment theta (try different values for 'angular velocity' here
    theta += .01;
    
    // For every x value, calculate a y value with sine function
    float x = theta;
    for (int i = 0; i < yvalues.length; i++) {
      yvalues[i] = amplitude*sin(x);
      v[i] = amplitude*cos(x);
      x+=dx;
    }
  }
  
}
