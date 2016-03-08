PVector [][] ctrl_pts;
int N_u, N_v;

float [] knots_u;
float [] knots_v;
int D_u, D_v; // This is the degree.

Pyramid [][] distObjects = new Pyramid[60][60];
int numOfObjects;

float radius=1000;
float x1= 800; 
float y1=400;
float zoom=1;

int seed=1;
float circX, circY, circZ; // To controll the attractor.
PVector att= new PVector();

String [] label= new String[4];
boolean myMesh=true;
boolean topView=false;
boolean sideView=false;

Button [] switches= new Button[4];


void setup()
{
  size(1200, 800, P3D);
  colorMode(HSB, 1.0);
  makeCtrlPts();
  makeKnots();

  randomSeed(seed);
  textAlign(CENTER);

  for (int i=0; i<distObjects.length; i++)
  {
    for (int j=0; j<distObjects.length; j++)
    {
      distObjects[i][j]= new Pyramid();
    }
  }
  att= new PVector(width/2, -height/2, height/3); // The initial position of the attractor ball

  switches[0]= new Button("HEX", (20+width/5+100), ((height/5+10)/switches.length),     100, (height/5)/switches.length-5);
  switches[1]= new Button("QUAD", (20+width/5+100), ((height/5+10)/switches.length)*2,  100, (height/5)/switches.length-5);
  switches[2]= new Button("TOP", (20+width/5+100), ((height/5+10)/switches.length)*3,  100, (height/5)/switches.length-5);
  switches[3]= new Button("SIDE", (20+width/5+100), ((height/5+10)/switches.length)*4,   100, (height/5)/switches.length-5);
  
  switches[0].onOff=true;
}


void draw()
{
  background(.85);
  environment();
  lights();
  drawSurf(0.01, 0.01);
  drawNrml(0.01, 0.01);
  drawCtrlPts();

  for (int i=0; i<distObjects.length; i++) {
    for (int j=0; j<distObjects.length; j++) {
      distObjects[i][j].distance();
      distObjects[i][j].display();
    }
  }
  drawAttractor();
}



void makeCtrlPts()
{
  N_u = N_v = 4;
  ctrl_pts = new PVector [N_u+1][N_v+1];
  for (int i = 0; i <= N_u; i++) {
    for (int j = 0; j <= N_v; j++) {
      ctrl_pts[i][j] =
        new PVector(i*width/N_u, -j*height/N_v, random(height/3));
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