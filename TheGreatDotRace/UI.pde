class UI{
  
  PVector pos;
  PFont generation;
  
  int currentGen = 1;
  
  
  
  UI(){
    
    pos = new PVector(100, 50);
    
    // Create Font to display the generation
    generation = createFont("Arial", 16, true);
    textFont(generation, 26);
    
  }
  
  
  void show(){
    // Create background for text
    fill(255, 182, 193);
    rect(pos.x, pos.y, 150, 50);
    
    // Create text
    fill(0); // Color text
    text("Gen: " + currentGen, pos.x - 45, pos.y + 10); // Show text
    
  }
  
}
