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
  float lr = 0.1;    //Learning rate variable to be used in guess
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
      weights[i] +=  error * inputs[i] * lr;      //Error multiplied with inputs as well as the learning rate (Defined at top)
    }
  }
  
  
} //End of Perceptron class

//------------------END OF THE PERCEPTRON DEFINITION

Perceptron brain;
Point[] points = new Point[100];    //Array of 100 points

void setup() {
  size(700, 700);
  brain = new Perceptron();
  for (int i = 0; i < points.length; i++ ) {
    points[i] = new Point();
  }
  
  float[] inputs = {-1, 0.5};
  int guess = brain.guess(inputs);
  println(guess);
} //End of setup

//Main draw function for drawing in output canvas
void draw() {
  background(255);
  stroke(0);
  line(0, 0, width, height);
  for (Point pt : points) {
    pt.show();
  } 
  
  for (Point pt : points) 
  {
    float[] inputs = {pt.x, pt.y};
    int target = pt.label;
    brain.train(inputs, target);
    int guess = brain.guess(inputs);
    if (guess == target) {
        fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }
      noStroke();
      ellipse(pt.x, pt.y, 16, 16);
    
    }
    
} //End of draw
