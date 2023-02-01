boolean saveGif = false;

int n = 100;       // How many cubes
int dim = 1000;     // How large the plane is
float w = dim*2/n;

void setup() {
    size(700,700,P3D);
    frameRate(30);
    ortho(-width/2, width/2, -height/2, height/2, -1500, 10000);
    float cameraZ = (height/2) / tan(PI/6);
    rectMode(CENTER);
    stroke(150);
    fill(100);
    colorMode(HSB, 360, 100, 100);
    noiseDetail(3);
}

float h = 10;
float hmax = 800;
float scale = .03;

float t = 0;
float dt = .005;

void draw() {
    background(200);
    lights();
    whiteLight();
    translate(width/2,height*7/8,0);  // Move to center of screen
    rotateX(-atan(1/sqrt(2)));  // Rotations for isometric projection
    rotateY(PI/4);

    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) {
            pushMatrix();
            float x = map(i, 0, n, -dim, dim);
            float z = map(j, 0, n, -dim, dim);
            float noise = noise(scale*i + t, scale*j + t);

            float brightness = map(noise, 0, 1, 20, 100);
            fill(216, 100, brightness);

            float dh = hmax*noise;
            translate(x, -dh/2, z); // ALl prisms on same plane
            box(w, h + dh, w);
            popMatrix();
        }
    }
    t += dt;
  if(saveGif && frameCount < 600) {
    saveFrame("###.jpg");
  }   
}

void whiteLight() {
    // directionalLight(150, 150, 150, 0, 0, -1);    // X Face
    directionalLight(255, 255, 255, 1, 0, 0);    // Z Face
    directionalLight(200, 200, 200, 0, 1, 0);   // Y Light
}

void colorLight() {
    directionalLight(0, 96, 153, 1, 0, 0);    // X Face
    directionalLight(0, 160, 255, 0, 0, -1);    // Z Face
    directionalLight(84, 191, 255, 0, 1, 0);   // Y Light
}
