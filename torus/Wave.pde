class Wave {
  float[] yvalues;  // Height for all values in the wave
  float[] v;  // Velocities for all points in the wave
  float[] a;  // Accelerations for all points in the wave
  float amplitude;  // Height of the wave

  String renderStyle;
  color col;
  

  Wave(int pointCount, float amp) {
    yvalues = new float[pointCount];
    v = new float[pointCount];
    a = new float[pointCount];
    
    amplitude = amp;
  }

  void reset() {
    for(int i = 0; i < yvalues.length; i++) {  // Resets values for each frame
      yvalues[i] = 0;
      v[i] = 0;
      a[i] = 0;
    }
  }
  
  void calcWave() {
    return;
  }
  
  void renderWave() {
    if(renderStyle == "dots") {
       noStroke();
       for (int x = 0; x < yvalues.length; x++) {
        float vel = v[x];
        float acc = a[x];
        
        // Convert to polar
        float thetaL = x;
        float r = rBase + yvalues[x];
        float xP = r*cos(thetaL);
        float yP = r*sin(thetaL);
        
        // Coloring
        int alpha = (col >> 24) & 0xFF;
        int red = (col >> 16) & 0xFF;  // Faster way of getting red(argb)
        int green = (col >> 8) & 0xFF;   // Faster way of getting green(argb)
        int blue = col & 0xFF;          // Faster way of getting blue(argb)
        
        //float c = map(vel, -75, 75, 1, 0);
        float opacity = map(vel, -75, 75, 255, 100);

        fill(abs(red), abs(green),abs(blue),opacity);
        
        
        // Sizing
        float size = map(vel, -75, 75, 9, 2);
    
        // Shape
        ellipse(xP, yP, size, size);
      }
    }
    else if (renderStyle == "lines") {
      stroke(255);
      noFill();
      beginShape();
       for (int x = 0; x < yvalues.length; x++) {
        float vel = v[x];
        float acc = a[x];
        
        // Convert to polar
        float thetaL = x;
        float r = rBase + yvalues[x];
        float xP = r*cos(thetaL);
        float yP = r*sin(thetaL);
        
        // Coloring
        //float c = map(vel, -75, 75, 0, 215);
        //stroke(abs(255-c));
        
        // Sizing
        //float size = map(vel, -75, 75, 9, 2);
    
        // Shape
        vertex(xP,yP);
      }
      endShape(CLOSE);
    }
  }
}
