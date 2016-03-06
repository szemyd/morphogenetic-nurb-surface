void drawSurf(float du, float dv)
{
  fill(1);
  noStroke();

  boolean odd=false;

  for (float v = knots_v[D_v]; v <= knots_v[knots_v.length-D_v-1]; v += dv) {
    odd=!odd; // Every second row is selected

    for (float u = knots_u[D_u]; u <= knots_u[knots_u.length-D_u-1]; u += du*3) {

      float pastU=u; // Memorize current position.
      if (odd) {u+=du*1.5;} // Every second row should be shifted.

      //strokeWeight(.2);
      //stroke(0);

      float myCoor= sqrt(0.75); // Calculate the 'v' distance from the middle point.
      PVector pt_1 = surfPos (u-du,       v          );
      PVector pt_2 = surfPos (u-du*0.5,   v+dv*myCoor   );
      PVector pt_3 = surfPos (u+du*0.5,   v+dv*myCoor   );
      PVector pt_4 = surfPos (u+du,       v          );
      PVector pt_5 = surfPos (u+du*0.5,   v-dv*myCoor   );
      PVector pt_6 = surfPos (u-du*0.5,   v-dv*myCoor   );


      beginShape();
      vertex(pt_1.x, pt_1.y, pt_1.z);
      vertex(pt_2.x, pt_2.y, pt_2.z);
      vertex(pt_3.x, pt_3.y, pt_3.z);
      vertex(pt_4.x, pt_4.y, pt_4.z);
      vertex(pt_5.x, pt_5.y, pt_5.z);
      vertex(pt_6.x, pt_6.y, pt_6.z);
      vertex(pt_1.x, pt_1.y, pt_1.z);
      endShape();

      int i=floor(u);
      int j=floor(v);

      if(distObjects[i][j].mine==null)
      {
        distObjects[i][j].position(pt_1, pt_2);
      }

      u=pastU; // Set the counter back to the orginal.
    }
  }
}

void drawNrml(float du, float dv)
{
  stroke(0,1,1);
  for (float u = knots_u[D_u]; u <= knots_u[knots_u.length-D_u-1]; u += du) {
    for (float v = knots_v[D_v]; v <= knots_v[knots_v.length-D_v-1]; v += dv) {
      PVector vN_1 = surfPos(u        , v );
      PVector vN_2 = surfPos(u+0.0001, v );
      PVector vN_3 = surfPos(u, v+0.0001 );

      PVector tan_U = PVector.sub(vN_1, vN_2);
      PVector tan_V = PVector.sub(vN_1, vN_3);

      PVector nrml  = tan_V.cross(tan_U);
      nrml.normalize();

      pushMatrix();
      translate(vN_1.x, vN_1.y, vN_1.z);
      line(0,0,0, nrml.x*10, nrml.y*10, nrml.z*10);
      popMatrix();

      int i=floor(u);
      int j=floor(v);


      //distObjects[i][j].position(nrml);
      distObjects[i][j].display(nrml, vN_1, vN_2, vN_3);
    }
  }
}

void drawCtrlPts()
{
  fill(0.5, 1, 1);
  noStroke();
  for (int i = 0; i <= N_u; i++) {
    for (int j = 0; j <= N_v; j++) {
      pushMatrix();
      translate( ctrl_pts[i][j].x, ctrl_pts[i][j].y, ctrl_pts[i][j].z );
      sphere(5);
      popMatrix();
    }
  }
}
