class Stars {
  PVector[] stars;
  
  Stars(int starCount) {
    stars = new PVector[starCount];
    for(int s = 0; s < stars.length; s++) {
      float x = random(0, width);
      float y = random(0, height);
      stars[s] = new PVector(x,y);
    }
    
  }
  
  void render() {
    for(PVector star : stars) {
      fill(255, random(100,255));
      ellipse(star.x, star.y, 2, 2);
    }
  }
}
