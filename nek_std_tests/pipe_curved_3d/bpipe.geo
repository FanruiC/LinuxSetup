//Bend-pipe geometry and meshing version 1.1
//15-4-23, Author: Fanrui
//Characteristic length: Pipe diameter = 1
//======================================================================
//Geometry Parameters:
R_pipe = 0.5;
R_square = R_pipe*0.6;
//--------------------
R_curve = R_pipe*3;
alpha = Pi/2;
L_arc = alpha*R_curve;
//--------------------
L_in = 10;
L_out = 10;
//----------------------------------------------------------------------
//Meshing Parameters:
//2D meshing:
T_boundary = 4; P_b = 1.6;
T_circle = 4;
//3D meshing:
//--------L_curve_meshing--------
n_curve = 5;
layer_one = L_arc/n_curve;
//--------L_in_meshing------------
P_in = 1.01;
n_in = Ceil(Log(L_in*(P_in-1)/layer_one + 1)/Log(P_in));
Printf("number of layer of L_in is", n_in);
//--------L_out_meshing-----------
P_out = 1.01;
n_out = Ceil(Log(L_out*(P_out-1)/layer_one + 1)/Log(P_out));
Printf("number of layer of L_out is", n_out);
//======================================================================
Point(1) = {0, 0, 0, 1.0};
Point(2) = {0, 0, R_pipe, 1.0};
Point(3) = {0, R_pipe, 0, 1.0};
Point(4) = {0, 0, -R_pipe, 1.0};
Point(5) = {0, -R_pipe, 0, 1.0};
Point(6) = {0, 0 ,R_square, 1.0};
Point(7) = {0, R_square ,0, 1.0};
Point(8) = {0, 0 ,-R_square, 1.0};
Point(9) = {0, -R_square ,0, 1.0};
Circle(1) = {2, 1, 3};
Circle(2) = {3, 1, 4};
Circle(3) = {4, 1, 5};
Circle(4) = {5, 1, 2};
Line(5) = {6, 7};
Line(6) = {7, 8};
Line(7) = {8, 9};
Line(8) = {9, 6};
Line(9) = {6, 2};
Line(10) = {7, 3};
Line(11) = {8, 4};
Line(12) = {9, 5};
Curve Loop(1) = {5, 10, -1, -9};
Plane Surface(1) = {1};
Curve Loop(2) = {6, 11, -2, -10};
Plane Surface(2) = {2};
Curve Loop(3) = {7, 12, -3, -11};
Plane Surface(3) = {3};
Curve Loop(4) = {8, 9, -4, -12};
Plane Surface(4) = {4};
Curve Loop(5) = {8, 5, 6, 7};
Plane Surface(5) = {5};
Transfinite Curve {-9, -10, -11, -12} = T_boundary Using Progression P_b;
Transfinite Curve {8, 5, 6, 7, 4, 1, 2, 3} = T_circle Using Progression 1;
Transfinite Surface {5};
Transfinite Surface {4};
Transfinite Surface {1};
Transfinite Surface {2};
Transfinite Surface {3};
//======================================================================
//----------L_in Mesh
q_in = 1/P_in;
one_in[0] = 1;
ratio_in[0] = (q_in-1)/(q_in^n_in-1);
For i In {1 : n_in-1}
    one_in[i] =1;
    ratio_in[i] = ratio_in[i-1] + ratio_in * q_in^i;
EndFor
Printf("layer_ratio of L_in is", ratio_in[]);
L_in_rounded = layer_one*(P_in^n_in-1)/(P_in-1);
Printf("L_in rounded is", L_in_rounded);
Extrude {L_in_rounded, 0, 0} {
    Surface{3}; Surface{2}; Surface{5}; Surface{1}; Surface{4}; 
    Layers {one_in[], ratio_in[]}; 
    Recombine;
  }
//-----------L_curve Mesh
Extrude {{0, 0, 1}, {L_in_rounded, R_curve, 0}, alpha} {
    Surface{100}; Surface{122}; Surface{78}; Surface{34}; Surface{56}; 
    Layers{n_curve}; 
    Recombine;
  }
//-----------L_out Mesh
q_out = P_out;
one_out[0] = 1;
ratio_out[0] = (q_out-1)/(q_out^n_out-1);
For i In {1 : n_out-1}
    one_out[i] =1;
    ratio_out[i] = ratio_out[i-1] + ratio_out * q_out^i;
EndFor
Printf("layer_ratio of L_out is", ratio_out[]);
L_out_rounded = layer_one*(P_out^n_out-1)/(P_out-1);
Printf("L_out rounded is", L_out_rounded);
Extrude {0, L_out_rounded, 0} {
    Surface{188}; Surface{166}; Surface{144}; Surface{232}; Surface{210}; 
    Layers {one_out[], ratio_out[]}; 
    Recombine;
  }
//====================== BCs ===========================================
Physical Surface("Inlet", 501) = {3, 4, 1, 5, 2};
Physical Surface("Outlet", 502) = {342, 254, 320, 298, 276};
Physical Surface("Walls", 503) = {117, 95, 161, 139, 271, 293, 337, 315, 205, 227, 29, 51};
Physical Volume("Domain", 504) = {4, 3, 2, 1, 5, 9, 10, 8, 6, 7, 12, 15, 11, 14, 13};
//===================== End ============================================
//Checkpoints
//30 degree
xyz[] = Point{69};
//+
Rotate {{0, 0, 1}, {xyz[0], xyz[1], xyz[2]}, -Pi/3} {
  Duplicata { Point{54}; }
}
Rotate {{0, 0, 1}, {xyz[0], xyz[1], xyz[2]}, -Pi/6} {
  Duplicata { Point{54}; }
}
//+
Translate {0, 2, 0} {
  Duplicata { Point{54}; }
}
//+
Translate {0, 4, 0} {
  Duplicata { Point{54}; }
}
//+
Translate {0, 6, 0} {
  Duplicata { Point{54}; }
}
//+
Translate {0, 8, 0} {
  Duplicata { Point{54}; }
}
Translate {-2, 0, 0} {
  Duplicata { Point{19}; }
}
Translate {-4, 0, 0} {
  Duplicata { Point{19}; }
}
Translate {-6, 0, 0} {
  Duplicata { Point{19}; }
}
Translate {-8, 0, 0} {
  Duplicata { Point{19}; }
}
// // Mesh 3;
// // SetOrder 2;

