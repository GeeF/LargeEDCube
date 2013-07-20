/*
 * Processing Script to simulate the 3x3x3 cube. 
 * Use to test lighting patterns.
 */

int CUBE_SIZE=100;
Cube[][][] cubes;

class Cube
{
  int x, y, z;
  
  Cube(int ix, int iy, int iz)
  {
    x = ix;
    y = iy;
    z = iz;
  }
  
  void changeColor(int ir, int ig, int ib)
  {
    fill(ir,ig,ib);
    display();
  }
  
  void display()
  {
    pushMatrix();
    translate(x, y, z);
    box(CUBE_SIZE);
    popMatrix();
  }
}

void setup()
{
  size(640, 640, P3D); 
  background(0);
  lights();
  //noLoop();
  frameRate(5);
  camera(width/1.2, height/4, 
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
        c.changeColor(123, 123, 255);
        cubes[col-1][dep][row-1] = c;
      }
    }
  }
}

void draw()
{
  background(0);
  camera(mouseX/1.2, height/4, 
        (height/2.0) / tan(PI*30.0 / 180.0), 
        width/2.0, height/2.0, 0, 0, 1, 0);
  pattern();
}

void pattern()
{
  // TODO: selection controls
  randomPattern();
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
      }
    }
  }
}