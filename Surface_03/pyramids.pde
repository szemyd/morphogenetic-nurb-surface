class Pyramid
{
  PMatrix3D mine;
  float pHeight;
  PVector [] pt_AllP;
  PVector nrmlP;

  Pyramid()
  {
    pHeight=random(0, 2);
    //mine=new PMatrix3D();
    pt_AllP=new PVector[6];
    nrmlP= new PVector();

    for (int i=0; i<pt_AllP.length; i++)
    {
      pt_AllP[i]= new PVector();
    }
  }


  void display()
  {
    for (int i=0; i<6; i++)
    {
      beginShape(TRIANGLE);
      {
        vertex(pt_AllP[(i + 6)%6].x, pt_AllP[(i + 6)%6].y, pt_AllP[(i + 6)%6].z);
        vertex(pt_AllP[(i+1 + 6)%6].x, pt_AllP[(i+1 + 6)%6].y, pt_AllP[(i+1 + 6)%6].z);
        vertex(nrmlP.x, nrmlP.y, nrmlP.z);
      }
    }
    endShape();
  }



  void position(PVector [] pt_All)
  {
    pt_AllP=pt_All;
  }

  void setNrml(PVector nrml, PVector vN_1)
  {
    nrml.mult(100);
    nrmlP = PVector.add(nrml, vN_1);
  }
}