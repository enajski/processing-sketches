int reso = 40;
float[] wave = new float[reso];

void drawWave() {
  beginShape();
  for (int i = 0; i < reso; ++i) {
    float rad = PI * 90 * i / reso;
    curveVertex(cos(rad) * wave[i],
                sin(rad) * wave[i]);
  }
  endShape();
}

void setup() {
  size(500, 500);
  noFill();
}

void draw() {
  background(230, 160);

  translate(width / 2, height / 2);
  rotate(millis() * 0.0002);

  strokeWeight(2);
  stroke(100);
  drawWave();

  for (int i = 0; i < reso; ++i) {
    float rad = PI * i / reso;
    wave[i] = sin(millis() * rad / 1200);
    wave[i] *= sin(millis() * rad * rad / 300);
    wave[i] = (0.6 * wave[i] + 0.6) * width / 3;
  }

  strokeWeight(1);
  stroke(0);
  drawWave();
}
