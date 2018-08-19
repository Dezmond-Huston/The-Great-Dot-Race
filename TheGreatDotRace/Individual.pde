class Individual{
  
 PVector pos;
 PVector vel;
 PVector acc;
 
 
 
 float fitness = 0; // Fitness of the Dot
 
 Brain BRAIN;
 
 boolean isDead = false; // Control Dot life
 boolean reachedGoal = false;
 boolean isBest = false;
 
 
 Individual(){
   BRAIN = new Brain(400);
   
   pos = new PVector(width/2, height - 10); // Start pos in center of canvas
   
   // Initialize vel and acc at 0
   vel = new PVector(0, 0);
   acc = new PVector(0, 0);
   
 }

 // ----------------------------------------------------------------------
 
 void show(){
   // Draw best to canvas
   if(isBest){
      fill(255, 0, 0);
      ellipse(pos.x, pos.y, 8, 8);
   }else{
      // Draw ellipse to canvas
      fill(0);
      ellipse(pos.x, pos.y, 4, 4);
   }
   
   
 }
 
 // -----------------------------------------------------------------------
 
 void move(){
   // Check if there are any steps left to take
   if(BRAIN.directions.length > BRAIN.step){
     
     // Make acc equal the random direction at the current step
     acc = BRAIN.directions[BRAIN.step];
     BRAIN.step++; // Increment step
   } else{
     // Kill Dot if it runs out of steps
     isDead = true;
   }
   
  vel.add(acc); // Add acc to vel
  vel.limit(5.5); // Limit Vel
  pos.add(vel); // Add vel to pos
   
   
 }
 
 // --------------------------------------------------------------------------
 
 void update(){
   // Stop Dot if it is Dead or it reached its Goal
   if(!isDead && !reachedGoal){
     move(); // Move Dot if it is not dead and it hasn't reached its Goal
     
   
   
     // Check if touches eadge of screen
     if(pos.x < 2 || pos.y < 2 || pos.x > width - 2 || pos.y > height - 2){
        isDead = true; // Kill Dot
     } else if(dist(pos.x, pos.y, GOAL.pos.x, GOAL.pos.y) < 5){
       // if reached Goal
       reachedGoal = true;
       
     }else {
       
       if(pos.y > OBSTACLE.bottom && pos.y < OBSTACLE.top){ // Check if Dot has collided with OBSTACLE
         if(pos.x > OBSTACLE.left && pos.x < OBSTACLE.right){
           isDead = true; // Kill Dot if it does collide with OBSTACLE
         }
       }
       
     }
   
   }
 }
 
 // ---------------------------------------------------------------------------
 
 // Find out which Dot got closest
 void calculateFitness(){
   if(reachedGoal){
     // Recalculate fitness to be higher the fewer steps needed to reach the Goal
     fitness = 1.0/16.0 + 10000.0 / (float)(BRAIN.step * BRAIN.step); // Also make sure that all Dots that reach the goal are given a better fitness than those that don't
     
   } else{
     // Get distance to goal
     float distanceToGoal = dist(pos.x, pos.y, GOAL.pos.x, GOAL.pos.y);
     
     // Calculate fitness to be higher the closer the Dot is to the Goal
     fitness = 1.0 / (distanceToGoal * distanceToGoal);
  
   }
   
   
   
 }
 
 
 // ----------------------------------------------------------------------------
  
  // Clone Parent to make the child
  Individual getTheChild(){
    
   Individual child = new Individual(); // Create new Individual called child
   child.BRAIN = BRAIN.clone(); // clone Brain of parent and give it to child
   return child; // return child
   
  }
 
  
}
