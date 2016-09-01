  int screen = 1;
  PImage HeartEmoji;
  PImage Ambroise;
  
  void setup ()
  {
  fullScreen();
  background(0,100,0);
  noStroke();
 
 HeartEmoji = loadImage("HeartEmoji.png");
 Ambroise = loadImage("Ambroise.png");
 
  imageMode(CENTER);
  image(HeartEmoji,width/4.2, height/1.75,700,700);

  fill (0,0,0);
  textSize(100);
  text("Lovers", 160, 400);

  fill (0,0,0);
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
  
  screen = 0; //Home screen
  }
  
  void draw()
  {
    if (screen == 0 & mousePressed & mouseX >= 0 & mouseX <= 800 & 
    mouseY >= 0 & mouseY <= 450)
    {
      exit();
    }
    
    imageMode(CENTER);
    image(HeartEmoji,width/4.2, height/1.75,700,700);
    
    imageMode(CENTER);
    image(Ambroise,width/1.3, height/1.75, 500, 650);
  }
  