class ComplexWave extends Wave{
  ArrayList<Wave> subWaves;
 
  ComplexWave(Wave wave1, Wave wave2) {
    super(pointCount, wave1.amplitude + wave2.amplitude);
    subWaves = new ArrayList<Wave>();
    subWaves.add(wave1);
    subWaves.add(wave2);
  }
 
   // Wave Addition
  void addWave(Wave wave) {
   subWaves.add(wave); 
  }
  
  void add(Wave wave) {
    wave.calcWave();
    for(int i = 0; i < wave.yvalues.length; i++) {
      yvalues[i] += wave.yvalues[i];
      v[i] += wave.v[i];
      a[i] += wave.a[i];
    }
    amplitude += wave.amplitude;
  }
  
  void calcWave() {
    this.reset();
    for(Wave wave : subWaves) {
      add(wave);
    }
  }
}
