int screen = 0;
PImage HeartEmoji;
PImage Bob;
PImage Pizza;
PImage Broc;
float velY = 5;
float velX = 5;
float bobX = 50;
float r = 0;
float g = 0;
float b = 0;
float bobY;
float barrierY[] = new float [10];
int barrierX[] = new int[10];
int nums[] = new int[500];
void setup ()
{
  fullScreen();
  background(0, 100, 0);
  noStroke();

  for (int i = 0; i < nums.length; i++)
  {
    nums[i] = int(random(70));
  }

  bobY = height/2;

  barrierX[1] = width/2;
  barrierX[0] = width/3;
  barrierX[2] = 0;
  barrierX[3] = width;

  //barrierY int Values 
  barrierY[0] = height/2;
  barrierY[1] = 0;
  barrierY[2] = 0;
  barrierY[3] = height;
  HeartEmoji = loadImage("HeartEmoji.png");
  Bob = loadImage("Bob.png");
  Pizza = loadImage("imgres.png");
  Broc = loadImage("broc.png");

  imageMode(CENTER);
  image(HeartEmoji, width/4.2, height/1.75, 500, 500);

  imageMode(CENTER);
  image(Bob, width/1.3, height/1.75, 300, 500);

  imageMode(CENTER);
  image(Pizza, width/5.5, height/5.2, 150, 150);

  fill (0, 0, 100);
  textSize(100);
  text("Lovers of Bob", 350, 200);

  fill (0, 0, 0);
  textSize(30);
  text("Created by Aryan Kothari", 1050, 860);

  fill(0, 255, 0);
  rect(620, 400, 180, 50);

  fill(0, 255, 0);
  rect(620, 480, 180, 50);

  fill(0, 0, 255);
  textSize(35);
  text("Play now!", 635, 440);

  fill(0, 0, 255);
  textSize(30);
  text("Quit", 625, 520);
}


void draw()
{

  if (screen == 0 & mousePressed & mouseX >= 620 & mouseX <= 800 & 
    mouseY >= 400 & mouseY <= 450) //Go to Play
  {
    background(0, 100, 0);
    fill(255, 0, 0);
    screen = 1;
  }

  if (screen == 1)
  {


    BarrierRestrictions();

    fill(r, g, b);
    background(0, 100, 0);
    noStroke();

    fill(0, 0, 0);
    textSize(30);
    text("Use Arrow Keys to Reach the Pizza. Dodge all other objects!", width/4.5, height/20);
    
    Barriers();

    imageMode(CENTER);
    image(Pizza, width/1.1, height/2, 50, 50);

    imageMode(CENTER);
    image(Bob, bobX, bobY, 50, 50);


    if (bobX > width/1.1)
    {
      background(0, 100, 0);
      for (int i = 0; i < nums.length; i++)
      {
        imageMode(CENTER);
        image(Bob, random(width), random(height), nums[i], nums[i]);
        fill(random(255));
      }
    }
  }


  if (screen == 0 & mousePressed & mouseX >= 620 & mouseX <= 800 & 
    mouseY >= 480 & mouseY <= 520) //Exit Game 
  {
    exit();
  }
}



void keyPressed()
{
  if (keyCode == RIGHT)
  {
    bobX = bobX + 12;
  }
  if (keyCode == UP)
  {
    bobY = bobY - 12;
  }
  if (keyCode == LEFT)
  {
    bobX = bobX - 12;
  }
  if (keyCode == DOWN)
  {
    bobY = bobY + 12;
  }
}




void BarrierRestrictions()
{
  if (barrierY[0] > height)
  {
    barrierY[0] = velY*-1;
    r = random(255);
    g = random(255);
    b = random(255);
  }
  if (barrierY[0] < 0)
  {
    barrierY[0] = velY*-1;
    r = random(255);
    g = random(255);
    b = random(255);
  }
  if (barrierY[1] > height)
  {
    barrierY[1] = velY*-1;
    r = random(255);
    g = random(255);
    b = random(255);
  }
  if (barrierY[1] < 0)
  {
    barrierY[1] = velY*-1;
    r = random(255);
    g = random(255);
    b = random(255);
  }
  
   if (barrierY[2] > height)
  {
    barrierY[2] = velY*-1;
    r = random(255);
    g = random(255);
    b = random(255);
  }
  if (barrierY[2] < 0)
  {
    barrierY[2] = velY*-1;
    r = random(255);
    g = random(255);
    b = random(255);
  }
     if (barrierY[3] > height)
  {
    barrierY[3] = velY*-1;
    r = random(255);
    g = random(255);
    b = random(255);
  }
  if (barrierY[3] < 0)
  {
    barrierY[3] = velY*-1;
    r = random(255);
    g = random(255);
    b = random(255);
  }
}

void Barriers()
{
  fill(r, g, b);
  rect(barrierX[0], barrierY[0], 80, 80);
  rect(barrierX[1], barrierY[1], 50, 50);
  barrierY[0] = barrierY[0] + 5;
  barrierY[1] = barrierY[1] + 10;
  rect(barrierX[2], barrierY[2], 50, 50);
  barrierX[2] = barrierX[2] + 3;
  barrierY[2] = barrierY[2] + 3;
  rect(barrierX[3], barrierY[3], 50, 50);
  barrierX[3] = barrierX[3] - 3;
  barrierY[3] = barrierY[3] - 3;
}