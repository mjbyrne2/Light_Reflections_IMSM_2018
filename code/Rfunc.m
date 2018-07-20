% Generalized Rvachev functions                                                           
%                                                            
%                                                            
% Input(s)                                                   
%   f,g: Input functions
%   op:  Operator - 
%          union:        'v'
%          intersection: '^'
%          difference:   '\'
%                                                            
% Output(s)                                                  
%   h: Resultant function after Rvachev operator applied to f and g                                                         
%                                                            
% Example:                                                   
% h = Rfunct(f,'^',g);
%
% Difference of a sphere with itself:
% f = @(x,y,z) x^2 + y^2 + z^2 - 1;
% h = Rfunc(f,'\',f)
% h = @(x,y,z)-sqrt(2.0).*sqrt((x.^2+y.^2+z.^2-1.0).^2)
%
% Union of two neighboring spheres
% g = @(x,y,z) (x-1.5).^2 + y.^2 + z.^2 - 1;
% h = Rfunc(f,'^',g);
% figure; ezimplot3(h,100);
%                                                            
% See also:                                                  
%                                                            
%                                                            
                                                             
% Dependencies: None                                             
%                                                            
%                                                            
% Copyright 2017 MIT Lincoln Laboratory. All rights reserved.
% 05-May-2017, John Peach                                    
%                                                            
% Revisions:                                                 
                                                             
                                                             
function h = Rfunc(f,op,g)

% Convert to symbolic form
f = sym(f);
g = sym(g);

% Rvachev operation
switch lower(op)
    case{'^'}
        h = f + g + sqrt(f.^2 + g.^2);
    case{'v'}
        h = f + g - sqrt(f.^2 + g.^2);
    case{'\'}
        h = f - g - sqrt(f.^2 + g.^2);
    otherwise
        error('Unknown Rvachev operator')
end

% Convert result back to anonymous function
%h = matlabFunction(simplify(h));
h = matlabFunction(h);