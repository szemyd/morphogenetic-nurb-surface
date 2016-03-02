void environment()
{
  hud();
  cameras(0);
}

//---> Function for cameras.
void cameras(int num)
{
  switch(num)
  {
    case 0:
    lights();
    if (keyPressed)
    {
      if (key==CODED) if (keyCode==SHIFT)
      {
        x1=mouseX;
        y1=mouseY;
      }
    }
    //---> Camera Manipulation
    radius=250;
    float a=cos(radians(x1*360/width))*sin(radians(y1*180/width))*radius;
    float b=sin(radians(x1*360/width))*sin(radians(y1*180/width))*radius;
    float c=cos(radians(y1*180/width))*radius;
    camera(a/zoom, b/zoom, (c)/zoom, 0.0, 0.0, 0.0, 0.0, 0.0, -1);
    //<---
    break;
    case 1:
    noLights();
    camera();
    break;
  }
}


/*
void mouseDragged()
{
for (int i=0; i<chain.length; i++)
{
for (int j=0; j<chain[i].length; j++)
{
if (mouseX <= box1.x+i*12 +150+4 &&
mouseX >= box1.x+i*12 +150-4&&
mouseY <= box1.y+j*12+4-5 &&
mouseY >= box1.y+j*12-4-5 )
{
if (mousePressed)
{
disable[i][j]= !disable[i][j];
}
}
}
}



for (int i=0; i<4; i++)
{
if (mouseX <= box1.x+120 &&
mouseX >= box1.x-120&&
mouseY <= box1.y+7.5+i*20 &&
mouseY >= box1.y-7.5+i*20 )
{
rectMode(CORNER);
fill(255);
p[i]=mouseX-120;//-box1.x-120;
}
}


mass=p[0]/(240/400.0);
k=p[1]/(240/60.0);
restL=p[2]/(240/20.0);
damping=p[3]/(240/0.75);
}
*/

void mouseDragged()
{
  for (int i=0;i<ctrl_pts.length;i++)
  {
    for (int j=0;j<ctrl_pts.length;j++)
    {
      PVector screenPos=new PVector();
      screenPos.x= screenX(ctrl_pts[i][j].x,ctrl_pts[i][j].y,ctrl_pts[i][j].z);
      screenPos.y= screenY(ctrl_pts[i][j].x,ctrl_pts[i][j].y,ctrl_pts[i][j].z);



      if(mouseX<screenPos.x+2.5 &&
        mouseX>screenPos.x-2.5 &&
        mouseY<screenPos.y+2.5 &&
        mouseY>screenPos.y-2.5)
        {
          float changeX= mouseX;
          float changeY= mouseY;


          ctrl_pts[i][j].x+=changeX-mouseX;
          ctrl_pts[i][j].y+=changeY-mouseY;
        }
      }

    }
  }



  void keyPressed()
  {
    if (key == ' ')
    {

      seed++;

      makeCtrlPts();
    }

  }

  void hud()
  {
    //cameras(1);

  }
