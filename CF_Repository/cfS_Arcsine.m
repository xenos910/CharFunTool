function cf = cfS_Arcsine(t,coef,niid)
%% cfS_Arcsine
%  Characteristic function of the zero-mean symmetric ARCSINE distribution
%  defined on the interval (-1,1). 
%
%  cfS_Arcsine is an ALIAS of the more general function
%  cf_ArcsineSymmetric, used to evaluate the characteristic function of a 
%  linear combination of independent ARCSINE distributed random variables.
%
%  The characteristic function of the symmetric ARCSINE distribution is
%   cf(t) = besselj(0,t);
%
% SYNTAX:
%  cf = cfS_Arcsine(t);
%  cf = cfS_Arcsine(t,coef,niid);
%
% INPUTS:
%  t      - vector or array of real values, where the CF is evaluated.
% 
% WIKIPEDIA: 
%  https://en.wikipedia.org/wiki/Arcsine_distribution.
%
% EXAMPLE 1:
% % CF of the symmetric Arcsine distribution on (-1,1)
%   t = linspace(-50,50,501);
%   cf = cfS_Arcsine(t);
%   figure; plot(t,cf),grid
%   title('CF of the the Arcsine distribution on (-1,1)')
%
% EXAMPLE 2:
% % PDF/CDF of the symmetric Arcsine distribution on (-1,1)
%   cf = @(t) cfS_Arcsine(t);
%   x = linspace(-1,1,501);
%   xRange = 2;
%   clear options
%   options.N = 2^12;
%   options.dt = 2*pi/xRange;
%   result = cf2DistGP(cf,x,[],options)
%
% REFERENCES:
%  WITKOVSKY V. (2016). Numerical inversion of a characteristic
%  function: An alternative tool to form the probability distribution of
%  output quantity in linear measurement models. Acta IMEKO, 5(3), 32-44.  

% (c) 2017 Viktor Witkovsky (witkovsky@gmail.com)
% Ver.: 02-Jun-2017 12:08:24

%% ALGORITHM
narginchk(1, 3);
if nargin < 3, niid = []; end
if nargin < 2, coef = []; end

cf = cf_ArcsineSymmetric(t,coef,niid);

end