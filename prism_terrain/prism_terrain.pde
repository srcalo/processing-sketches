float r = 0;

void setup() {
    size(700,700,P3D);
    fill(255,255,0);
    lights();
    stroke(0);
}

void draw() {
    background(52);
    translate(width/2,height/2,0);
    rotateZ(r);
    rotateX(r);
    box(100);

    r += radians(1);
}
