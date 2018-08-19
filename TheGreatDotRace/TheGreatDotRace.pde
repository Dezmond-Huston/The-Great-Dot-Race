Population test;
Goal GOAL;
Obstacle OBSTACLE;
Individual individual;
UI ui;



void setup() {
   //delay(10000); // Delay the start of the program
   size(800, 800);
   rectMode(CENTER); // Set rectangle mode to center
   
   
   test = new Population(1000); // Create new Population of 100 with the name of test
   GOAL = new Goal(); // Create new Goal with the name of GOAL
   OBSTACLE = new Obstacle(400, 200);// Create new Obstacle at position
   individual = new Individual(); // Create new Individual object
   ui = new UI(); // Create new UI object
   OBSTACLE.wid = 600; // Designate OBSTACLE width
   OBSTACLE.len = 10; // Designate OBSTACLE length
   
   
}

void draw() {
  background(255);
  
  GOAL.show(); // Call show() method in Goal class
  OBSTACLE.show(600, 10); // Call show() method in Obstacle class
  
  
  //  After  Population is Dead stop moving and showing old  Dots
  if(test.populationDead()){
    
     // Genetic Algorithm
     test.calculateFitness(); // Calculate the fitness; the Dot that got the closest to the Goal, or reached it in the fewest steps
     test.selection(); // Select based off of the fitness
     test.mutateChild(); // Mutate all but the bestDot
     
     
  }else{
    test.update(); // Call update() method in Population class
    test.show(); // Call show() method in Population class
  }
}
