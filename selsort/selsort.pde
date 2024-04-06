int numberOfNumbers = 200;
int [] values = new int[numberOfNumbers];
int deltaX = 1;
int step = 0;

void setup() {
  size(1000, 500);
  deltaX = width/numberOfNumbers;

  for (int i = 0; i < values.length; i++) {
    int randomValue = int(random(0, height));
    values[i] = randomValue;
  }
}

void draw() {
  background(255);
  stroke(180);

  if (step < numberOfNumbers) {
    selectionSortStep();
  }

  for (int i = 0; i < values.length; i++) {
    if (i < step) {
      fill(values[i], 255, numberOfNumbers);
    } else {
      fill(values[i], 255, numberOfNumbers, 150);
    }
    rect(i*deltaX, height-values[i], deltaX, values[i]);
  }
}

void selectionSortStep() {
  int smallSpot = step;
  for (int j = step; j < values.length; j++) {
    if (values[smallSpot] > values[j]) {
      smallSpot = j;
    }
  }

  swap(values, smallSpot, step);
  step++;
}

void swap(int[] array, int index1, int index2) {
  int temp = array[index1];
  array[index1] = array[index2];
  array[index2] = temp;
}
