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
    radius=1000;
    float a=cos(radians(x1*360/width))*sin(radians(y1*180/width))*radius;
    float b=sin(radians(x1*360/width))*sin(radians(y1*180/width))*radius;
    float c=cos(radians(y1*180/width))*radius;
    camera(a/zoom+width/2, b/zoom-height/2, (c)/zoom+height/2, width/2, -height/2,height/2, 0.0, 0.0, -1);
    //<---
    break;
  case 1:
    noLights();
    camera();
    break;
  }
}


void attractorMan()
{
  cameras(1);
  stroke(0.6);
  rect(20, 20, 200, 200, 5);
  fill(0);
  ellipse((200/width)*att.x+20, (200/height)*att.y+20, 10, 10);
}



void mouseDragged()
{
  for (int i=0; i<ctrl_pts.length; i++)
  {
    for (int j=0; j<ctrl_pts.length; j++)
    {
      PVector screenPos=new PVector();
      screenPos.x= screenX(ctrl_pts[i][j].x, ctrl_pts[i][j].y, ctrl_pts[i][j].z);
      screenPos.y= screenY(ctrl_pts[i][j].x, ctrl_pts[i][j].y, ctrl_pts[i][j].z);



      if (mouseX<screenPos.x+2.5 &&
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
  //if (key == 's') attractor();
}

void hud()
{
  cameras(1);
  attractorMan();
}