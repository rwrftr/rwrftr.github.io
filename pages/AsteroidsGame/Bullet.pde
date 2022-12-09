class Bullet extends Floater {

  public Bullet(Spaceship ship) {
    corners = 4;
    xCorners = new int[corners];
    xCorners[0] = -5;
    xCorners[1] = 0;
    xCorners[2] = 5;
    xCorners[3] = 0;
    yCorners = new int[corners];
    yCorners[0] = 0;
    yCorners[1] = 7;
    yCorners[2] = 7;
    yCorners[3] = 0;
    myCenterX = (double)ship.getCenterX();
    myCenterY = (double)ship.getCenterY();
    myXspeed = ((6) * Math.cos(ship.getPoint()*(Math.PI/180)));
    myYspeed = ((6) * Math.sin(ship.getPoint()*(Math.PI/180)));
    myPointDirection = ship.getPoint();
    myColor = color(255, 255, 255);
  }
  
   public Float getCenterX() {
    return (float)myCenterX;
  }
  public Float getCenterY() {
    return (float)myCenterY;
  }
  
}