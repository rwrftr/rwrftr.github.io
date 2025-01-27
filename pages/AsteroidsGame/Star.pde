class Star //note that this class does NOT extend Floater
{

  int starX, starY, starSize; 

  public Star() {
    starX = (int)(Math.random()*1280)+10;
    starY = (int)(Math.random()*720)+10;
    starSize = (int)(Math.random()*10);
  }

  public void show() {
    noFill();
    stroke(255,255,255,60);
    ellipse(starX, starY, starSize, starSize);
  }
}
