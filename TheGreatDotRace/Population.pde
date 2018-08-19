class Population{
 Individual[] INDIVIDUAL;
 UI ui;
 
 float fitnessSum;
 
 
 int bestDot = 0;
 int maxSteps = 400;
 int gen = 1;
 
  
  Population(int size){
    INDIVIDUAL = new Individual[size]; // Create an array of Individuals of variable size
    ui = new UI();
    
    // Loop through size of Individuals array
    for(int i=0; i < size; i++){
       INDIVIDUAL[i] = new Individual(); // Create new Indivudual at each index
    }
    
  }
  
  
  Population(){
    
  }
  
  
  // ----------------------------------------------------------
  
  void show(){
   
    // Loop through Individual array
    for(int i= 0; i < INDIVIDUAL.length; i++){
       INDIVIDUAL[i].show(); // Show each Individual
    }
    INDIVIDUAL[0].show();
    
    
    
    // Show the UI
    ui.show();
    
  }
  
  // ----------------------------------------------------------
  
  // Move entire Population of Dots
  void update(){
   
    for(int i= 0; i < INDIVIDUAL.length; i++){
      // Check is the Dots have passed the maximum allowed steps
      if(INDIVIDUAL[i].BRAIN.step >= maxSteps){
         INDIVIDUAL[i].isDead = true; // Kill the Dots that pass the maximum steps
      }else{
         INDIVIDUAL[i].update(); // Update each Individual that hasn't passed the max steps
      }
    }
    
    
  }
  
  
  // ---------------------------------------------------------------------
  
  void calculateFitness(){
    
   for(int i=0; i < INDIVIDUAL.length; i++){
      INDIVIDUAL[i].calculateFitness(); // Calculate Fitness for entire Population
   }
    
    
  }
  
  // -------------------------------------------------------------------------
  
  // Check if all Dots have died
  boolean populationDead(){
    
   for(int i=0; i < INDIVIDUAL.length; i++){
     // As long as a Dot is not dead return false
      if(!INDIVIDUAL[i].isDead && !INDIVIDUAL[i].reachedGoal){
       return false; 
        
      }
   }
    
    return true;
    
  }
  
  
  // --------------------------------------------------------------------------------
  
  
  void selection(){
    Individual[] NewIndividuals = new Individual[INDIVIDUAL.length]; // Create the next generation
    getBestDot(); //Get the best Dot of the old generation
    calculateFitnessSum(); // Calculate fitness sum before selection
    
    // Save the best Dot in the first index of the new generation
    NewIndividuals[0] = INDIVIDUAL[bestDot].getTheChild();
    NewIndividuals[0].isBest = true;
    
    // Set i to 1 so that the best dot isn't overwritten
    for(int i=1; i < NewIndividuals.length; i++){
       
      // Select parent based on fitnes
      Individual parent = getTheParent(); 
      
      // Get child from parent and populate the new Population
      NewIndividuals[i] = parent.getTheChild();
      
    }
    
    // Replace the old population with the new one
    INDIVIDUAL = NewIndividuals.clone();
    gen += 1; // Increment the generation
    ui.currentGen = gen; // Set gen in UI to gen
    
    
  }
  
  // ---------------------------------------------------------------------------
  
  
  
  void calculateFitnessSum(){
    fitnessSum = 0; // Initialize fitnessSum at 0
    for(int i=0; i < INDIVIDUAL.length; i++){
       fitnessSum += INDIVIDUAL[i].fitness; // Add up the fitnesses of all Individuals
    }
    
    
    
  }
  
  
  
  // ---------------------------------------------------------------------------
  
  Individual getTheParent(){
    
    float rand = random(fitnessSum); // Create random number from 0 to the fitnessSum
    
    
    float currentSum = 0; //
    
    for(int i=0; i < INDIVIDUAL.length; i++){
       currentSum += INDIVIDUAL[i].fitness; // Add the fitnesses of all Individuals so far
       
       // If an Individual causes the currentSum to be greater than the random number, return that Individual
       if(currentSum > rand){
          return INDIVIDUAL[i];
       } 
    }
    
    // If there is no one in the Population fit enough to be selected return null
    return null;
    
  }
  
  
  // -----------------------------------------------------------------------------
  
  // Start mutation at 1 so that the best isn't mutated
  void mutateChild(){
    
    for(int i = 1; i < INDIVIDUAL.length; i++){
       INDIVIDUAL[i].BRAIN.mutate(); // Mutate the brain to introduce variation
    }
    
    
    
  }
  
  
  // -----------------------------------------------------------------------------
  
  
  // Geet the best dot in each generation
  void getBestDot(){
    
    float max = 0;
    int maxIndex = 0;
    
    for(int i=0; i < INDIVIDUAL.length; i++){
       if(INDIVIDUAL[i].fitness > max){
          max += INDIVIDUAL[i].fitness; // Update max with the new max
          maxIndex = i; // Save how far into the population the max is
       }
       
    }
    
    bestDot = maxIndex; // Save bestDot as the final maxIndex
    
    
    if(INDIVIDUAL[bestDot].reachedGoal){
      // Set the maximum allowed steps equal to the number of steps taken by the best Dot
       maxSteps = INDIVIDUAL[bestDot].BRAIN.step; 
    }
    
    
    
  }
  
  // -------------------------------------------------------------------------------
  
  void showBest(){
   
    INDIVIDUAL[0].show();
    
  }
  
  
  
  
  
}
