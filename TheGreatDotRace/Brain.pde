class Brain{
  
  PVector[] directions;
  int step = 0;
  
  
  Brain(int size){
    directions = new PVector[size];  // Set direction equal to PVector array of variable size
    randomize(); // Call randomize()
    
  }
  
  // -------------------------------------------------------------------
  
  
  // randomize all elements in directions
  void randomize(){
    
    for(int i=0; i < directions.length; i++){
      float randomAngle = random(2 * PI); // Make random angle
      directions[i] = PVector.fromAngle(randomAngle); // Turn randomAngle into a PVector
      
      
    }
    
    
    
  }
  
  
  // ------------------------------------------------------------------------------
  
  // Method clone which returns a type of Brain
  Brain clone(){
    // Create a new brain with the same amout of directions as the old brain
    Brain brainClone = new Brain(directions.length);
    
    for(int i=0; i < directions.length; i++){
      
      // Make each brain directions clone equal to the copy of directions
       brainClone.directions[i] = directions[i].copy();
    }
    
    return brainClone; // return the clone of the brain
    
    
    
  }
  
  
  // -----------------------------------------------------------------------------
  
  void mutate(){
    float mutationRate = 0.01; // Set chance of mutation happening
    
    for(int i=0; i < directions.length; i++){
      float rand = random(1);
      if(rand < mutationRate){
        // Mutate the direction randomly
        float randomAngle = random(2 * PI); // Random direction
        directions[i] = PVector.fromAngle(randomAngle); // Set direction equal to the random direction
      }
    }
    
    
    
    
  }
  
  
  
}
