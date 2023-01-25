class Loop {
  int pc;   // Point count
  float nm; // Max noise
  float ba; // Base amplitude
  float a;  // Amplitude
  float po;  // Phase
  float o;  // Velocity through noise space
  
  PVector[][] points;
  int f = 0;
  Loop(int pointCount, float baseAmp, float amplitude, float noiseMax, float phase, float omega) {
    this.pc = pointCount;
    this.nm = noiseMax;
    this.ba = baseAmp;
    this.a = amplitude;
    this.po = phase;
    this.o = omega;
    
    float dt = radians(360/pc);
    points = new PVector[floor(TAU/o)][floor(TAU/dt)];  // OUT OF BOUNDS ERROR WHY
    float p = po;
    for(int i = 0; i < points.length; i++) {
      float theta = 0;
      for(int j = 0; j < points[0].length; j++) {
        float xoff = map(cos(theta + p), -1, 1, 0, nm);
        float yoff = map(sin(theta), -1, 1, 0, nm);
        float r = ba + a*noise(xoff, yoff);
        float x = r * cos(theta);
        float y = r * sin(theta);
        points[i][j] = new PVector(x, y);
        theta += dt;
      }
      p += o;
    }
  }
  
  void update() {
    if (f > points.length - 2) { f = 0; }
    else { f++; }
  }
  
  void render() {    
    beginShape();
    for(PVector point : points[f]) {
      vertex(point.x,point.y);
    }
    endShape(CLOSE);
  }
  

}
