class Goal{
  PVector pos;
  
  Goal(){
   
    pos = new PVector(400, 10); // Initialize position for Goal
    
  }
  
  void show(){
   
    fill(0, 255, 0); // Color Goal
    ellipse(pos.x, pos.y, 10, 10); // Show Goal at its position at a certain size
    
  }
  
  
}
