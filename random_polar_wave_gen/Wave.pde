class Wave {
  float theta;  // Start angle
  float omega;  // Angular velocity
  float amplitude;
  int period;
  
  Wave(float theta, float omega, float amplitude, int period) {
    this.amplitude = amplitude;
    this.theta = theta;
    this.omega = omega;
    this.period = period;
  }
  
  void update() {
    this.theta += this.omega;
  }

  float evaluate(float x) {
    return this.amplitude * sin(this.theta + (TWO_PI * x) / this.period);
  }
}
