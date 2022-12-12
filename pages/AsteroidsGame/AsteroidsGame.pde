//global declarations

Spaceship roger = new Spaceship();
boolean charge, forward, leftturn, rightturn, backup, destroybuffer, launch = false; // my toggles when pressing keybuttons + buffer
boolean launchdelay = true;
int storedenergy, blah = 0;
Star [] stars = new Star[50];
ArrayList <Asteroid> frank = new ArrayList <Asteroid>();
ArrayList <Bullet> sammy = new ArrayList <Bullet>();


public void setup() 
{
  size(1280, 720);
  background(0);

  //array for stars
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  //arraylist for asteroids
  for (int i = 0; i < 10; i++) {
    frank.add( new Asteroid());
  }
}
public void draw() { 
  background(0);

  drawStars(); //self explanatory
  KeyCommands(); //processes keys
  BulletHit(); //checks collission for bullets

  roger.move(); //move spaceship
  roger.show(); //show spaceship

  AsteroidCrash(); //check asteroid collision and show them
  chargeFunction();  //do charge stuff
  blah++;
}

public void keyPressed()
{
  if (key == 'q') {
    roger.setSpeed(0); 
    roger.setY();
    roger.setX();
    roger.setDirection();
  }
  if (keyCode == SHIFT) {
    charge = true;
  }
  if (key == 'w') {
    forward = true;
  }
  if (key == 'a') {
    leftturn = true;
  }
  if (key == 'd') {
    rightturn = true;
  }
  if (key == 's') {
    backup = true;
  }
  if (key == 'r') {
    frank.add( new Asteroid());
  }
  if (key == ' ') {
    if(launch == false){blah = 10;}
    
    launch = true;
  }
}

public void keyReleased()
{
  if (keyCode == SHIFT) {
    charge = false;
    roger.accelerate((storedenergy/10));
    storedenergy = 0;
  }
  if (key == 'w') {
    forward = false;
  }
  if (key == 'a') {
    leftturn = false;
  }
  if (key == 'd') {
    rightturn = false;
  }
  if (key == 's') {
    backup = false;
  }
   if (key == ' ') {
    launch = false;
  }
}

public void KeyCommands() {
  //these if statements are the keyboard inputs
  //the keyboard inputs toggle a boolean until they are lifted.
  //when that boolean = true, this behavior happens
  if (rightturn == true) {
    roger.turn(5);
  }
  if (leftturn == true) {
    roger.turn(-5);
  }
  if (forward == true) {
    roger.accelerate(0.1);
  }
  if (backup == true) {
    roger.accelerate(-0.1);
  }

  if (launch && blah % 10 == 0) {
    sammy.add(new Bullet(roger));
  }
}

//collision for the bullet and asteroids
public void BulletHit() {
  if (sammy.size() >= 1) {
    for (int i = sammy.size() -1; i > 0; i--) {
      for (int z = frank.size() -1; z > 0; z--) {
        if (dist(sammy.get(i).getCenterX(), sammy.get(i).getCenterY(), frank.get(z).getCenterX(), frank.get(z).getCenterY()) < 20) {
          frank.remove(z);
          sammy.remove(i);
          break;
        }
      }
    }
  }

  for (int i = sammy.size() -1; i > 0; i--) {
    sammy.get(i).show();
    sammy.get(i).move();
  }
}

public void AsteroidCrash() {

  for (int i = frank.size() -1; i > 0; i--) {
    frank.get(i).move();
    if ((dist(frank.get(i).getCenterX(), frank.get(i).getCenterY(), roger.getCenterX(), roger.getCenterY() ) < 20) && destroybuffer == false) {
      roger.bounce(i);
      frank.remove(i);
      destroybuffer = true;
    } else {
      for (int z = frank.size() -1; z > 0; z--) { 
        if ((dist(frank.get(i).getCenterX(), frank.get(i).getCenterY(), frank.get(z).getCenterX(), frank.get(z).getCenterY() ) < 20) && i != z) {          
          frank.get(i).bounce(z);
        }
      }
      frank.get(i).show();
    }
  }
  destroybuffer = false;
}

public void chargeFunction() {

  if (charge == true) {
    if (storedenergy < (width-20)) {
      storedenergy+= 4;
    }
    fill(36, 234, 240);
    rect(10, 10, storedenergy, 30, 20 );
  }
}

public void drawStars() {

  for (int i = 0; i < stars.length; i++) {
    stars[i].show();
  }
}
