class Pyramid
{
  PMatrix3D mine;
  float pHeight;
  PVector pt_1P, pt_2P, pt_3P, pt_4P, pt_5P, pt_6P;

  Pyramid()
  {
    pHeight=random(0,10);
    mine=new PMatrix3D();
  }


  void display(PVector nrml, PVector vN_1, PVector vN_2, PVector vN_3)
  {
    vN_1.normalize();
    vN_2.normalize();
    vN_3.normalize();

    if(mine==null)
    {
      mine.set(vN_2.x,   vN_3.x,   nrml.x,   vN_1.x,
        vN_2.y,   vN_3.y,   nrml.y,   vN_1.y,
        vN_2.z,   vN_3.z,   nrml.z,   vN_1.z,
        0.0,      0.0,      0.0,      0.0);
      }

      for (int i=0; i<6; i++)
      {
        pushMatrix();
        mine.rotateZ(PI/3);
        applyMatrix(mine);

        beginShape();
        {
          vertex(pt_1P.x, pt_1P.y, pt_1P.z);
          vertex(pt_2P.x, pt_2P.y, pt_2P.z);
          vertex(nrml.x, nrml.y, nrml.z*pHeight);
        }
        endShape();
        popMatrix();
      }


    }

    void position(PVector pt_1, PVector pt_2)
    {
      pt_1P= pt_1;
      pt_2P= pt_2;
    }
  }
