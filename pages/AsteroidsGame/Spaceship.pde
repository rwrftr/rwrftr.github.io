class Spaceship extends Floater  
{   
  int c1, c2;
  public Spaceship() {
    corners = 3;
    xCorners = new int[corners];
    xCorners[0] = 16;
    xCorners[1] = -8;
    xCorners[2] = -8;
    yCorners = new int[corners];
    yCorners[0] = 0;
    yCorners[1] = 8;
    yCorners[2] = -8;
    c1 = 0;
    c2 = 255;
    myColor = color(255, 255, 255);
    myCenterX = myCenterY = 250; 
    myXspeed = myYspeed = 0; 
    myPointDirection = 0;
  }
  public void setDirection() {
    myPointDirection = (int)(random(360));
  }
  public void setY() {
    myCenterY = (int)(random(20, 480));
  }
  public void setX() {
    myCenterX = (int)(random(20, 480));
  }
  public void setSpeed(int a) {

    myXspeed = a;
    myYspeed = a;
  }
  public Float getCenterX() {
    return (float)myCenterX;
  }
  public Float getCenterY() {
    return (float)myCenterY;
  }
  public Float getXSpeed() {
    return (float)myXspeed;
  }
  public Float getYSpeed() {
    return (float)myYspeed;
  }
  public double getPoint(){
    return myPointDirection;
  }
  public void bounce(int x){
  
  myXspeed = myXspeed / 5 + 4 * ((frank.get(x).myXspeed) / 5);
  myYspeed = myYspeed / 5 + 4 * ((frank.get(x).myYspeed) / 5);
  
  }
  
  public void show ()  //Draws the floater at the current position  
  {    
    //noFill();
    fill(c1);   
    stroke(c2);    

    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));

    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);

    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }
}
