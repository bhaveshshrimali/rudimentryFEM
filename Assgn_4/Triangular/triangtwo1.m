% Input File: Two Trianglular Elements Under Axial Load
%
% Copyright (C) Arif Masud and Tim Truster
%
% This input file should be run prior to executing the FEA_Program routine.
%
% Format of required input:
%
%   numnp:           = number of nodes in the mesh (length(NodeTable))
%                                                                                                                                      
%   numel:           = number of elements in the mesh
%
%   nen:             = maximum number of nodes per element (4)
%
%   PSPS:            = flag for plane stress ('s') or plane strain ('n')
%
%   NodeTable:       = table of mesh nodal coordinates defining the
%                      geometry of the mesh; format of the table is as
%                      follows:
%                          Nodes  |             x-coord  y-coord
%                          n1     |  NodeTable = [x1     y1
%                          n2     |               x2     y2
%                          ...    |               ..     ..
%                          nnumnp |               xnumnp ynumnp];
%
%   ix:              = table of mesh connectivity information, specifying
%                      how nodes are attached to elements and how materials
%                      are assigned to elements; entries in the first nen
%                      columns correspond to the rows of NodeTable
%                      representing the nodes attached to element e;
%                      entries in the last nen+1 column are rows from MateT
%                      signifying the material properties assigned to
%                      element e; format of the table is as follows:
%                          Elements  |         n1    n2    n3    n4   mat
%                          e1        |  ix = [e1n1  e1n2  e1n3  e1n4 e1mat
%                          e2        |        e2n1  e2n2  e2n3  e2n4 e2mat
%                          ...       |         ..    ..    ..    ..   ..
%                          enumel    |        values for element numel   ];
%
%   MateT:           = table of mesh material properties for each distinct
%                      set of material properties; these sets are
%                      referenced by element e by setting the value of
%                      ix(e,nen+1) to the row number of the desired
%                      material set; format of the table is as follows:
%                          Materials  |           E   v   t
%                          mat1       |  MateT = [E1  v1  t1
%                          mat2       |           E2  v2  t2
%                          ...        |           ..  ..  ..];
%
%   BCLIndex:        = list of the number of boundary conditions and loads
%                      applied to the mesh; first entry is the number of
%                      prescribed displacements at nodes; second entry is
%                      the number of nodal forces
%
%   NodeBC:          = table of prescribed nodal displacement boundary
%                      conditions; it contains lists of nodes, the
%                      direction of the displacement prescribed (x=1, y=2),
%                      and the value of the displacement (set 0 for fixed
%                      boundary); the length of the table must match the
%                      entry in BCLIndex(1), otherwise an error will result
%                      if too few conditions are given or extra BCs will be
%                      ignored in the model input module;  format of the 
%                      table is as follows:
%                          BCs  |            nodes direction value
%                          bc1  |  NodeBC = [bc1n   bc1dir   bc1u
%                          bc2  |            bc2n   bc2dir   bc2u
%                          ...  |             ..     ..       .. ];
%
%   NodeLoad:        = table of prescribed nodal forces; it contains lists 
%                      of nodes, the direction of the force prescribed 
%                      (x=1, y=2), and the value of the force; the length 
%                      of the table must match the entry in BCLIndex(2), 
%                      otherwise an error will result if too few conditions
%                      are given or extra loads will be ignored in the 
%                      model input module; format of the table is as
%                      follows:
%                          Loads  |              nodes direction value
%                          P1     |  NodeLoad = [ P1n    P1dir    P1P
%                          P2     |               P2n    P2dir    P2P
%                          ...    |               ..     ..       .. ];
%
%
%           4 -------------- 3       2
%           |                |       | \
%           |                |       |  \
%           |                |       |   \
%           |                |       |    \
%           |                |       |     \
%           |                |       |      \
%           1 -------------- 2       3-------1
%

% Arbitrary data for assistance in defining the mesh
%x1 = 20;


% Mesh Nodal Coordinates
NodeTable = [0 0
             0.5 0
             1 0
             1.5 0
             2 0
             2.5 0
             3 0
             3 0.5
             2.5 0.5
             2 0.5
             1.5 0.5
             1 0.5
             0.5 0.5
             0 0.5
             0 1
             0.5 1
             1 1
             1.5 1
             2 1
             2.5 1
             3 1];
numnp = length(NodeTable);

% Mesh Element Connectivities
ix = [1 13 14 0 1
      1 2 13 0 1
      2 12 13 0 1
      2 3 12 0 1
      3 11 12 0 1
      3 4 11 0 1
      4 10 11 0 1
      4 5 10 0 1
      5 9 10 0 1
      5 6 9 0 1
      6 8 9 0 1
      6 7 8 0 1
      13 15 14 0 1
      13 16 15 0 1
      12 16 13 0 1
      12 17 16 0 1
      11 17 12 0 1
      11 18 17 0 1
      10 18 11 0 1
      10 19 18 0 1
      9 19 10 0 1
      9 20 19 0 1
      8 20 9 0 1
      8 21 20 0 1      
      ];

nen = 4;
numel = 24;

% Mesh Boundary Conditions and Loads
BCLIndex = [10 2]';
NodeBC = [1 1 0
          1 2 0
          2 1 0
          3 1 0
          4 1 0
          5 1 0
          6 1 0
          7 1 0
          14 1 0
          15 1 0];
NodeLoad = [8 1 3.75
            21 1 3.125];

% Mesh Material Properties
young = 10e5;
pois = .25;
thick = 1;
PSPS = 'n';
MateT = [young pois thick];
FEA_Program