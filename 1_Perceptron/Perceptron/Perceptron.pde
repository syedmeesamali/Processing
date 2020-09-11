class Perceptron {
  float[] weights = new float[2];
  Perceptron() {
    for (int i = 0; i < weights.length; i++) {
        weights[i] = random(-1, 1);
      }
  }
}
