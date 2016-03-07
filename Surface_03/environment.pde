void environment()
{
  hud();
  if (!topView) cameras(0);
  else if (topView)cameras(2);
  else if (sideView) cameras(3);
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
    float a=cos(radians(x1*360/width))*sin(radians(y1*180/width))*radius;
    float b=sin(radians(x1*360/width))*sin(radians(y1*180/width))*radius;
    float c=cos(radians(y1*180/width))*radius;
    camera(a/zoom+width/2, b/zoom-height/2, (c)/zoom+height/2, width/2, -height/2, height/2, 0.0, 0.0, -1);
    //<---
    break;
  case 1:
    noLights();
    camera();
    break;
    
    case 2:
    lights();
    camera(width/2, height/2, height, width/2, -height/2, 0, 0.0, 0.0, -1);
    break;
    
    case 3:
    lights();
    camera(width/2, height/2, 0, width/2, -height/2, 0, 0.0, 0.0, -1);
    break;
  }
}


void attractorMan()
{
  cameras(1);
  stroke(0.6);
  rect(20, 20, width/5, height/5, 5);
  fill(0.3);

  circX= map(att.x, width, 0, 0, width/5);
  circY= map(att.y, 0, -height, 0, height/5);
  circZ= map(att.z, 0, height, 0, height/5);

  fill(0.3);
  line(40+width/5, 20, 40+width/5, height/5+20);

  pushMatrix();
  {
    translate(circX, circY, 0);
    ellipse(20, 20, 10, 10);
  }
  popMatrix();



  pushMatrix();
  {
    translate(40+width/5, circZ, 0);
    ellipse(0, 0, 10, 10);
  }
  popMatrix();
}



void mouseDragged()
{
  topView=false;
  sideView=false;
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
  if (mouseX<circX+20+35 &&
    mouseX>circX+20-35 &&
    mouseY<circY+20+35 &&
    mouseY>circY+20-35)
  {
    att.x=map(mouseX-20, width/5, 0, 0, width);
    att.y=map(mouseY-20, 0, -height/5, 0, height);
  }

  if (mouseX<40+width/5+35 &&
    mouseX>40+width/5-35 &&
    mouseY<circZ+20+45 &&
    mouseY>circZ+20-45)
  {
    att.z=map(mouseY, 0, height/5, 0, height);
  }

  if (mouseButton == RIGHT) 
  {
    radius=mouseY-width/200;
  }
}

void mousePressed()
{
  if (mouseX<(20+width/5+40)+width/10+10 &&
    mouseX>40+width/5+10 &&
    mouseY<(height/10+30)/label.length+20+35 &&
    mouseY>(height/10+30)/label.length+20-35)
  {
    myMesh=!myMesh;
    for (int i=0; i<distObjects.length; i++)
    {
      for (int j=0; j<distObjects.length; j++)
      {
        distObjects[i][j]= new Pyramid();
      }
    }
  }

  if (mouseX<(20+width/5+40)+width/10+10 &&
    mouseX>40+width/5+10 &&
    mouseY<((height/10+30)/label.length)*2+20+35 &&
    mouseY>((height/10+30)/label.length)*2+20-35)
  {
    topView=!topView;
  }

  if (mouseX<(20+width/5+40)+width/10+10 &&
    mouseX>40+width/5+10 &&
    mouseY<((height/10+30)/label.length)*3+20+20 &&
    mouseY>((height/10+30)/label.length)*3+20-20)
  {
    topView=!topView;
    sideView=false;
  }

  if (mouseX<(20+width/5+40)+width/10+10 &&
    mouseX>40+width/5+10 &&
    mouseY<((height/10+30)/label.length)*4+20+20 &&
    mouseY>((height/10+30)/label.length)*4+20-20)
  {
    sideView=!sideView;
    topView=false;
  }
}

void keyPressed()
{
  if (key == ' ')
  {
    seed++;
    makeCtrlPts();
  }
  if (key == 's') myMesh=!myMesh;
}

void hud()
{
  cameras(1);
  attractorMan();

  fill(0.9);
  noFill();
  for (int i=0; i<label.length; i++)
  {
    pushMatrix();
    {
      translate((20+width/5+40), ((height/5+10)/label.length)*i +20);

      if (myMesh) 
      {
        if (i==0) fill(0.7);
        else noFill();
      } else if (topView)
      {
        if (i==2) fill(0.7);
        else noFill();
      } else if (sideView)
      {
        if (i==3) fill(0.7);
        else noFill();
      }
      rect(0, 0, width/10, (height/10+30)/label.length, 5);

      if (myMesh)
      {
        if (i==0) fill(0.9);
        else fill(0.5);
      } else if (topView)
      {
        if (i==2) fill(0.9);
        else fill(0.5);
      } else if (sideView)
      {
        if (i==3) fill(0.9);
        else fill(0.5);
      }
      text(label[i], width/20, (height/10+30)/label.length/2+5);
    }
    popMatrix();
  }
}