/*
*   LargeED Cube
*
*
*
*/

#define RED 101
#define GREEN 102
#define BLUE 103

#define STARTLED 0
#define ENDLED 81
#define TESTDEL 0.3
#define PAUSEDEL 40

#include "Tlc5940.h"
#include "lamps.h"

void setup()
{
  // init tlc5940 shields
  Tlc.init();
}

void fade_up(int led)
{
  for(int i = 0; i <= 4095; ++i)
  {
    Tlc.set(led, i);
    Tlc.update();
    delay(TESTDEL);
  }
  //delay(PAUSEDEL);
}

void fade_down(int color)
{
  for(int i = 4095; i <= 0; --i)
  {
    Tlc.set(color, i);
    Tlc.update();
    delay(TESTDEL);
  }
  //delay(PAUSEDEL);
}

void fade_all()
{
  for(int brightness = 0; brightness <= 4095; ++brightness)
  {
    for(int led = STARTLED; led <= ENDLED; led=led+3)
    {
      Tlc.set(led, brightness);
      Tlc.update();
      delay(TESTDEL);
    }
    for(int led = STARTLED; led <= ENDLED; led=led+4)
    {
      Tlc.set(led, brightness);
      Tlc.update();
      delay(TESTDEL);
    }
    for(int led = STARTLED; led <= ENDLED; led=led+5)
    {
      Tlc.set(led, brightness);
      Tlc.update();
      delay(TESTDEL);
    }
  } 
  // down again
  for(int brightness = 4096; brightness >= 0; --brightness)
  {
    for(int led = STARTLED; led <= ENDLED; led=led+3)
    {
      Tlc.set(led, brightness);
      Tlc.update();
      delay(TESTDEL);
    }
    for(int led = STARTLED; led <= ENDLED; led=led+4)
    {
      Tlc.set(led, brightness);
      Tlc.update();
      delay(TESTDEL);
    }
    for(int led = STARTLED; led <= ENDLED; led=led+5)
    {
      Tlc.set(led, brightness);
      Tlc.update();
      delay(TESTDEL);
    }    
    //delay(1);
  }
}

// fade up all leds of given color
void fade_up_all(int color)
{
  if(color == RED)
  {
    
  }
  
  for(int brightness = 0; brightness <= 4095; ++brightness)
  {
    for(int led = 15; led <= 50; ++led)
    { 
      Tlc.set(led, brightness);
      Tlc.update();
    }
    delay(1);
  }
}

void all()
{
  for(int i=0; i<=81; i++)
  {
    Tlc.set(i, 4095);
    Tlc.update();
  }
}

void test()
{
  fade_up(random(0, 80));
  fade_down(random(0, 80));  
  Tlc.update();
}

void loop()
{
  Tlc.clear();
  //fade_up_all(RED);
  //test();
  //all();
  fade_all();
}
