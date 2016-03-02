PVector [][] ctrl_pts;
int N_u, N_v;

float [] knots_u;
float [] knots_v;
int D_u, D_v; // This is the degree.

Pyramid [][] distObjects = new Pyramid[4][4];;
int numOfObjects;

float radius;
float x1= 1; float y1=1;
float zoom=1;

void setup()
{
  size(500, 500, P3D);
  colorMode(HSB, 1.0);
  makeCtrlPts();
  makeKnots();



  for(int i=0; i<distObjects.length; i++)
  {
    for(int j=0; j<distObjects.length; j++)
    {
      distObjects[i][j]= new Pyramid();
    }
  }
}


void draw()
{
  environment();

  background(0);
  lights();
  drawSurf(0.01, 0.01);
  drawNrml(0.01, 0.01);
  drawCtrlPts();
}



void makeCtrlPts()
{
  N_u = N_v = 4;
  ctrl_pts = new PVector [N_u+1][N_v+1];
  for (int i = 0; i <= N_u; i++) {
    for (int j = 0; j <= N_v; j++) {
      ctrl_pts[i][j] =
      new PVector(i*width/N_u, random(height), -j*height/N_v);
    }
  }
}

void makeKnots()
{
  D_u = D_v = 2;
  knots_u = new float [N_u + D_u + 2];
  knots_v = new float [N_v + D_u + 2];
  for (int i = 0; i < knots_u.length; i++) {
    knots_u[i] = float(i) / float(N_u + D_u + 1);
  }
  for (int j = 0; j < knots_u.length; j++) {
    knots_v[j] = float(j) / float(N_v + D_v + 1);
  }
}