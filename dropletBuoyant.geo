// Gmsh project created on Mon Aug 05 12:49:46 2019
SetFactory("OpenCASCADE");
//+
Point(1) = {0, 0, 0, 1.0};
//+
Point(2) = {-0.1, -0.1, 0, 1.0};
//+
Point(3) = {0.1, -0.1, 0, 1.0};
//+
Point(4) = {0.1, 0.3, 0, 1.0};
//+
Point(5) = {-0.1, 0.3, 0, 1.0};
//+
Circle(1) = {0, -0.05, 0, 0.00175, 0, 2*Pi};
//+
Line(2) = {2, 3};
//+
Line(3) = {3, 4};
//+
Line(4) = {4, 5};
//+
Line(5) = {5, 2};
//+
Curve Loop(1) = {5, 2, 3, 4};
//+
Curve Loop(2) = {1};
//+
Plane Surface(1) = {1, 2};


Extrude {0, 0, -0.01} {
	Surface{1};
	Layers{1};
	Recombine;
}
//+
Physical Surface("cylinderWalls") = {6};
//+
Physical Surface("frontAndback") = {1, 7};
//+
Physical Surface("top") = {2};
//+
Physical Surface("bottom") = {4};
//+
Physical Surface("inlet") = {3};
//+
Physical Surface("outlet") = {5};
//+
Physical Volume("internal") = {1};
