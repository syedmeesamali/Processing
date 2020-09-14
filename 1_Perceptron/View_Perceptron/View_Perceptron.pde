//This is the activation function
int sign(float n) {
  if (n >= 0) {
    return 1;
  } else {
    return -1;
  }
}

class Perceptron {
  float[] weights = new float[2];
  //Constructor
  Perceptron() {
    for (int i = 0; i < weights.length; i++) { //Initialize the weights randomly
        weights[i] = random(-1, 1);
      }
  }
  
  int guess(float[] inputs) {
    float sum = 0;
    for (int i=0; i < weights.length; i++) {
         sum += inputs[i] * weights[i];
    }
    int output = sign(sum);
    return output;
  } //End of guess function
  
  void train(float[] inputs, int target) {
    int guess = guess(inputs);
    int error = target - guess;
    for (int i=0; i<weights.length; i++) {
      weights[i] +=  error * inputs[i];
    }
  }
  
  
} //End of class

//------------------END OF THE PERCEPTRON DEFINITION

Perceptron p;
Point[] points = new Point[100];    //Array of 100 points

void setup() {
  size(400, 400);
  p = new Perceptron();
  for (int i = 0; i < points.length; i++ ) {
    points[i] = new Point();
  }
  
  float[] inputs = {-1, 0.5};
  int guess = p.guess(inputs);
  println(guess);
}

void draw() {
  background(255);
  stroke(0);
  line(0, 0, width, height);
  for (Point p : points) {
    p.show();
  }
}
