function cf = cfS_Triangular(t,coef,niid)
%cfS_Triangular(t)
%  Characteristic function of the zero-mean symmetric TRIANGULAR
%  distribution defined on the interval (-1,1). 
%
%  cfS_Triangular is an ALIAS of the more general function
%  cf_TriangularSymmetric, used to evaluate the characteristic function of
%  a linear combination of independent TRIANGULAR distributed random
%  variables.
%
%  The characteristic function of X ~ TriangularSymmetric is defined by
%   cf(t) = (2-2*cos(t))/t^2;;
%
% SYNTAX:
%  cf = cfS_Triangular(t);
%  cf = cfS_Triangulart,coef,niid);
%
% INPUTS:
%  t      - vector or array of real values, where the CF is evaluated.
%
% WIKIPEDIA: 
%  https://en.wikipedia.org/wiki/Triangular_distribution
%
% EXAMPLE 1:
% % CF of the symmetric Triangular distribution on (-1,1)
%   t = linspace(-50,50,501);
%   cf = cfS_Triangular(t);
%   figure; plot(t,cf),grid
%   title('CF of the the symmetric Triangular distribution on (-1,1)')
%
% EXAMPLE 2:
% % PDF/CDF of the the symmetric Triangular distribution on (-1,1)
%   cf = @(t) cfS_Triangular(t);
%   x = linspace(-1,1,101);
%   xRange = 2;
%   clear options
%   options.dt = 2*pi/xRange;
%   result = cf2DistGP(cf,x,[],options)
%
% REFERENCES:
%   WITKOVSKY V. (2016). Numerical inversion of a characteristic
%   function: An alternative tool to form the probability distribution of
%   output quantity in linear measurement models. Acta IMEKO, 5(3), 32-44.  

% (c) 2017 Viktor Witkovsky (witkovsky@gmail.com)
% Ver.: 02-Jun-2017 12:08:24

%% ALGORITHM
narginchk(1, 3);
if nargin < 3, niid = []; end
if nargin < 2, coef = []; end

cf = cf_TriangularSymmetric(t,coef,niid);

end