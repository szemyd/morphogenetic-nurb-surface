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

    //pushMatrix();

    for (int i=0; i<5; i++)
    {
      beginShape(TRIANGLE);
      {
        vertex(pt_AllP[i].x, pt_AllP[i].y, pt_AllP[i].z);
        vertex(pt_AllP[i+1].x, pt_AllP[i+1].y, pt_AllP[i+1].z);
        vertex(nrmlP.x, nrmlP.y, nrmlP.z);
      }
      endShape();
    }
    //println(nrmlP);




    // popMatrix();
  }


  void position(PVector [] pt_All)
  {
    pt_AllP=pt_All;
  }

  void setNrml(PVector nrml, PVector vN_1)
  {
    nrml.mult(10);
    nrmlP = PVector.add(nrml, vN_1);
  }
}