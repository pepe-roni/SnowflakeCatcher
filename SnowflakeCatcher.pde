Snowflake pepe [] = new Snowflake[200];
boolean stop=false;

void setup()
{
  noCursor();
  size(300, 300);

  for (int i=0; i<pepe.length; i++)
  {
    pepe[i]=new Snowflake();
  }
}
void mousePressed()
{
  fill(60, 90, 120);
  stop=true;
}
void draw()
{
  background(0);
  for (int i=0; i<pepe.length; i++)
  {
    pepe[i].show();
    pepe[i].move();
    pepe[i].wrap();
    pepe[i].lookDown();
  }
  if (stop=true)
  {
    fill(90, 90, 220);
    rect(mouseX-12, mouseY-6, 25, 6);
    stop=false;
  }
}

class Snowflake
{
  int snowpile;
  float travel, x, y;
  boolean moving;
  Snowflake()
  {
    travel=(float)(Math.random()*2)+1;
    x = (int)(Math.random()*300);
    y=-400;
    moving=true;
    snowpile=0;
  }
  void show()
  {
    fill(255);
    noStroke();
    ellipse(x, y, 5, 5);
    //snowpile
    rect(0, 299-snowpile, 300, 500);
  }
  void lookDown()
  {

    int dis = (int)(dist(mouseX, mouseY, x, y));
    if (dis>=-50&& dis<=10)
    {
      moving=false;
    } else
    {
      moving=true;
    }
  }

  void move()
  {
    if (moving)
    {
      y=y+travel;
    }
    if (!stop)
    {
      y--;
    }
  }
  void wrap()
  {
    if (y>310)
    {
      y=-190;
      x = (int)(Math.random()*300);
      travel=(float)(Math.random()*2)+1;
      snowpile+=3;
    }
  }
}

