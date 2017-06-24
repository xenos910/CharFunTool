function cf = cfX_Exponential(t,lambda)
%% cfX_Exponential
%  Characteristic function of the EXPONENTIAL distribution with the rate
%  parameter lambda > 0.
%
%  cfX_Exponential is an ALIAS NAME of the more general function
%  cf_Exponential, used to evaluate the characteristic function of a lienar
%  combination of independent EXPONENTIAL distributed random variables.
%
%  The characteristic function of the EXPONENTIAL distribution is
%   cf(t) = lambda / (lambda - 1i*t)
%
% SYNTAX:
%  cf = cfX_Exponential(t,lambda)
%
% INPUTS:
%  t      - vector or array of real values, where the CF is evaluated.
%  lambda - vector of the 'rate' parameters lambda > 0. If empty, default
%           value is lambda = 1.   
% 
% WIKIPEDIA: 
%  https://en.wikipedia.org/wiki/Exponential_distribution.
%
% EXAMPLE 1:
%  % CF of the Exponential distribution with lambda = 5
%  lambda = 5;  
%  t = linspace(-50,50,501);
%  cf = cfX_Exponential(t,lambda);
%  figure; plot(t,real(cf),t,imag(cf)),grid
%  title('CF of the Exponential distribution with lambda = 5')
%
% EXAMPLE 2:
%  % PDF/CDF of the Exponential distribution with lambda = 5
%  lambda = 5;  
%  cf = @(t) cfX_Exponential(t,lambda);
%  x  = linspace(0,1.5,101);
%  clear options
%  options.xMin = 0;
%  options.SixSigmaRule = 8;
%  result = cf2DistGP(cf,x,[],options)
%
% EXAMPLE 3:
% % PDF/CDF of the compound Binomial-Exponential distribution
%  n = 25;  
%  p = 0.3;
%  lambda = 5;
%  cfX  = @(t) cfX_Exponential(t,lambda);
%  cf   = @(t) cfN_Binomial(t,n,p,cfX);
%  x    = linspace(0,5,101);
%  prob = [0.9 0.95 0.99];
%  clear options
%  options.isCompound = true;
%  result = cf2DistGP(cf,x,prob,options)

% (c) 2017 Viktor Witkovsky (witkovsky@gmail.com)
% Ver.: 24-Jun-2017 10:07:43

%% ALGORITHM
narginchk(1, 2);
if nargin < 2, lambda  = []; end
if isempty(lambda), lambda = 1; end

cf =  cf_Exponential(t,lambda);

end