class Pyramid
{
  float pHeight;
  PVector [] pt_AllP;
  PVector nrmlP;

  Pyramid()
  {
    pHeight= 50; //random(0, 60);
    nrmlP= new PVector();
    pt_AllP=new PVector[6];

    for (int i=0; i<pt_AllP.length; i++)
    {
      pt_AllP[i]= new PVector();
    }
  }

  void position(PVector [] pt_All)
  {
    pt_AllP=pt_All;
  }

  void setNrml(PVector nrml, PVector vN_1)
  {
    nrml.mult(pHeight);
    nrmlP = PVector.add(nrml, vN_1);
  }

  void display()
  {
    for (int i=0; i<6; i++)
    {
      beginShape(TRIANGLE);
      {
        vertex(pt_AllP[(i + 6)%6].x, pt_AllP[(i + 6)%6].y, pt_AllP[(i + 6)%6].z);
        vertex(pt_AllP[(i +1 + 6)%6].x, pt_AllP[(i +1 + 6)%6].y, pt_AllP[(i +1 + 6)%6].z);
        vertex(nrmlP.x, nrmlP.y, nrmlP.z);
      }
      endShape();
    }
  }

  void distance()
  {
    PVector direction;

    direction= PVector.sub(nrmlP, att);


    float distance = pt_AllP[0].dist(att);
    //float distance= direction.mag();
    distance= abs(distance);


    //if (distance<400)
    {
      pHeight = 50+200/(sqrt(distance*0.5));
      println(pHeight);
      //println("I'm close");
    } //else pHeight=50;
  }
}