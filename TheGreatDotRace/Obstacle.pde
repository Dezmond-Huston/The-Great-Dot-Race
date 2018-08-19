class Obstacle{
  PVector pos;
  
  
  float wid;
  float len;
  
  
  float left, right, top, bottom;
  
  
 Obstacle(int X, int Y){
   
   // Create an obstacle at the position designated later
   pos = new PVector(X, Y);
   
 }
 
 // ------------------------------------------------------------------------
  
  
  void show(float X, float Y){
    
    wid = X;
    len = Y;
    
    fill(0, 0, 255); // Color Obstacle
    getSides(); // Get the sides of the Obstacle
    rect(pos.x, pos.y, wid, len);
    
  }
  
  // -----------------------------------------------------------------------------
  
  // Initialize left, right, top, and bottom -----------------
  void getSides(){
    left = pos.x - (wid / 2); // Set left side
    right = pos.x + (wid / 2); // Set right side
    top = pos.y + (len / 2); // Set top side
    bottom = pos.y - (len / 2); // Set bottom side
  }
  
  
}
