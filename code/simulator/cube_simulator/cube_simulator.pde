/*
 * Processing Script to simulate the 3x3x3 cube. 
 * Use to test lighting patterns.
 * 
 * Moving the mouse on the x axis changes the 
 * camera x position. Clicking toggles locking of
 * the current view.
 */

int CUBE_SIZE=100;
Cube[][][] cubes;
boolean viewLocked = true;

class Cube
{
  int x, y, z;
  int r=255, g=255, b=255;
  
  Cube(int ix, int iy, int iz)
  {
    x = ix;
    y = iy;
    z = iz;
  }
  
  void changeColor(int ir, int ig, int ib)
  {
    r = ir;
    g = ig;
    b = ib;
    fill(r,g,b);
    display();
  }
  
  void rampColor(int ir, int ig, int ib)
  {
    int rd = 0, gd = 0, bd = 0;
      if(r-ir > 0) rd = -1;
      else if(r-ir < 0) rd = 1;
      if(g-ig > 0) gd = -1;
      else if(g-ig < 0) gd = 1;
      if(b-ib > 0) bd = -1;
      else if(b-ib < 0) bd = 1;
  
      // fill delta values
      fill(r+rd, g+gd, b+bd);
      display();
      delay(1);
      r += rd;
      g += gd;
      b += bd;
      if(r == ir) rd = 0;
      if(g == ig) gd = 0;
      if(b == ib) bd = 0;
  }
  
  void display()
  {
    pushMatrix();
    translate(x, y, z);
    box(CUBE_SIZE);
    popMatrix();
    redraw();
  }
}

void mouseReleased()
{
  if(viewLocked) viewLocked = false;
  else viewLocked = true;
}

void setup()
{
  size(640, 640, P3D); 
  background(128);
  lights();
  camera(width/1.2, height/100, 
        (height/2.0) / tan(PI*30.0 / 180.0), 
        width/2.0, height/2.0, 0, 0, 1, 0);
  
  cubes = new Cube[3][3][3];
  
  for(int col = 1; col <= 3; ++col)
  {
    for(int dep = 0; dep <3; ++dep)
    {
      for(int row=1; row <= 3; ++row)
      {
        Cube c = new Cube(2*CUBE_SIZE*col-CUBE_SIZE, 
                  2*CUBE_SIZE*row-CUBE_SIZE, 
                  -((CUBE_SIZE*2)*dep));
        c.display();
        c.changeColor(255, 255, 255);
        cubes[col-1][dep][row-1] = c;
      }
    }
  }
}

void draw()
{
  background(128);
  fill(0,0,0);
  text("testString", 50, 50);
  textSize(36);
  if(!viewLocked)
  {
    camera(mouseX*2-width/2, height/100, 
          (height/2.0) / tan(PI*30.0 / 180.0), 
          width/2.0, height/2.0, 0, 0, 1, 0);
  }
  pattern();
}

void pattern()
{
  // TODO: selection controls
  //randomPattern();
  rampPattern();
}

void randomPattern()
{
  for(int col = 0; col < 3; ++col)
  {
    for(int dep = 0; dep < 3; ++dep)
    {
      for(int row=0; row < 3; ++row)
      {
        cubes[row][dep][col].changeColor((int)random(255),
                                         (int)random(255), 
                                         (int)random(255));
        delay(20);
      }
    }
  }
}

void rampPattern()
{
  for(int col = 0; col < 3; ++col)
  {
    for(int dep = 0; dep < 3; ++dep)
    {
      for(int row=0; row < 3; ++row)
      {
        cubes[row][dep][col].rampColor(123,123,255);
      }
    }
  }
}
