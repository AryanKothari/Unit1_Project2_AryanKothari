
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer song;
AudioPlayer song2;
AudioPlayer input;
int screen = 0;
PImage HeartEmoji;
PImage Bob;
PImage Pizza;
PImage Broc;
float velY = 5;
float velX = 5;
float bobX = 50;
float r = random(255);
float g = random(255);
float b = random(255);
float bobY;
float barrierY[] = new float [10];
float barrierX[] = new float [6];
float randomSize[] = new float [10];
int nums[] = new int[500];
void setup ()
{
  fullScreen();
  background(0, 100, 0);
  noStroke();

  minim = new Minim(this); //Music 
  song = minim.loadFile("MinionSong.mp3");
  song2 = minim.loadFile("TaaDaa.mp3");
  song.loop();

  for (int i = 0; i < nums.length; i++)
  {
    nums[i] = int(random(70));
  }

  bobY = height/2;

for(int i = 0; i<barrierX.length; i++)
{
  barrierX[i] = i * 200 + 200;
}

for(int i = 0; i<barrierY.length; i++)
{
  barrierY[i] = 0;
}

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



    fill(r, g, b);
    background(0, 100, 0);
    noStroke();

    fill(0, 0, 0);
    textSize(30);
    text("Use Arrow Keys to Reach the Pizza. Dodge all other objects!", width/4.5, height/20);

    Barriers();
    BarrierRestrictions();

    imageMode(CENTER);
    image(Pizza, width/1.1, height/2, 50, 50);

    imageMode(CENTER);
    image(Bob, bobX, bobY, 50, 50);


    if (bobX > width/1.1)
    {

      background(0, 100, 0);
      song.pause();
      song2.play();
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
  if (keyCode == LEFT)
  {
    bobX = bobX - 12;
  }
}




void BarrierRestrictions()
{
  for (int i = 0; i < barrierY.length; i++)
  {
    if (barrierY[i] > height)
    {
      barrierY[i] = velY*-1;
      r = random(255);
      g = random(255);
      b = random(255);

      randomSize[i] = 20 + (i+1)*random(0,15);
    }
  }
}

void Barriers()
{
  fill(r, g, b);

  for (int i=0; i < barrierX.length; i++)
  {
    fill(r, g, b);
    rect(barrierX[i], barrierY[i], randomSize[i], randomSize[i]);
    barrierY[i] = barrierY[i] + random(0, 20);
  }
}