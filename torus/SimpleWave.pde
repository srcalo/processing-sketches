class SimpleWave extends Wave {
  float theta;  // Start angle
  float omega;  // Angular velocity
  float dx;   // Frequency
  
  String renderStyle;
  color col;
  

  SimpleWave(int pointCount, float t, float o, float amp, float period) {
    super(pointCount, amp);
    theta = t;
    omega = o;
    dx = (TWO_PI / period);
  }
  
  void changePeriod(float period) {
    dx = (TWO_PI / period);
  }
  
  void reset() {
    for(int i = 0; i < yvalues.length; i++) {  // Resets values for each frame
      yvalues[i] = 0;
      v[i] = 0;
      a[i] = 0;
    }
  }
  

  void calcWave() {
    // Increment theta (angular velocity)
    theta += omega;
    // For every x value, calculate a y value with sine function
    float x = theta;
    for (int i = 0; i < yvalues.length; i++) {
      yvalues[i] = amplitude*sin(x);
      v[i] = amplitude*cos(x);
      a[i] = -amplitude*sin(x);
      x+=dx;
    }
  }
}
