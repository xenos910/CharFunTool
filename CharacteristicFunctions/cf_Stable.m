function cf = cf_Stable(t,alpha,mu,sigma,coef,niid)
%% cf_Stable
%  Characteristic function of a linear combination (resp. convolution) of
%  independent location-scale ALPHA-STABLE random variables.
%
%  cf_Stable evaluates the characteristic function cf(t) of  Y
%  =  sum_{i=1}^N coef_i * X_i, where X_i ~ Stable(alpha_i,mu_i,sigma_i)
%  are inedependent RVs with the symmetric ALPHA-STABLE (location�scale
%  symmetric stable Paretian) distributions, with the stability parameters
%  0 < alpha <= 2, the location parameters mu in Real, and the scale
%  parameters sigma > 0, for all i = 1,...,N.
% 
%
%  Characteristic function of the Stable(alpha,mu,sigma) distribution is 
%   cf(t) = cf_Stable(t,alpha,mu,sigma) = exp( 1i*mu*t - |sigma*t|^alpha).
%
% SYNTAX
%  cf = cf_Stable(t,alpha,mu,sigma,coef,niid)
% 
% INPUTS:
%  t     - vector or array of real values, where the CF is evaluated.
%  alpha - vector of stability parameters, 0 < alpha_i <= 2, i = 1,...,N.
%          If empty, default value is alpha = 2.  
%  mu    - vector of location parameters, mu in (-pi,pi). If empty, default
%          value is mu = 0. 
%  sigma - vector of scale parameters, sigma_i > 0. If empty, default value
%          is sigma = 1.
%  coef  - vector of the coefficients of the linear combination of the
%          IGamma random variables. If coef is scalar, it is assumed
%          that all coefficients are equal. If empty, default value is
%          coef = 1.
%  niid  - scalar convolution coeficient niid, such that Z = Y +...+ Y is
%          sum of niid iid random variables Y, where each Y = sum_{i=1}^N
%          coef_i * X_i is independently and identically distributed
%          random variable. If empty, default value is niid = 1. 
%
% WIKIPEDIA: 
%  https://en.wikipedia.org/wiki/Stable_distribution.
%
% EXAMPLE 1:
% % CF of the symmetric Alpha Stable distribution with alpha=1.75
%  alpha = 1.75;
%  t     = linspace(-10,10,201);
%  cf    = cf_Stable(t,alpha);
%  figure; plot(t,cf),grid
%  title('CF of the alpha-Stable distribution with alpha=1.75')
%
% EXAMPLE2 (PDF/CDF the symmetric Alpha Stable distribution with alpha=1)
%  alpha = 1;
%  x = linspace(-5,5,501);
%  cf = @(t) cf_Stable(t,alpha);
%  clear options
%  options.N = 2^12;
%  options.SixSigmaRule = 3;
%  result = cf2DistGP(cf,x,[],options)

% (c) 2017 Viktor Witkovsky (witkovsky@gmail.com)
% Ver.: 24-Jun-2017 18:25:56

%% ALGORITHM
%cf = cf_Stable(t,alpha,mu,sigma,coef,niid);

%% CHECK THE INPUT PARAMETERS
narginchk(1, 6);
if nargin < 6,  niid = []; end
if nargin < 5,  coef = []; end
if nargin < 4, sigma = []; end
if nargin < 3,    mu = []; end
if nargin < 2, alpha = []; end

%%
if isempty(alpha), alpha = 2; end
if isempty(mu),       mu = 0; end
if isempty(sigma), sigma = 0; end
if isempty(coef),   coef = 1; end
if isempty(niid),   niid = 1; end

[errorcode,coef,alpha,mu,sigma] = ...
    distchck(4,coef(:)',alpha(:)',mu(:)',sigma(:)');
if errorcode > 0
    error(message('InputSizeMismatch'));
end

%% Characteristic function of the Exponential distribution
szt = size(t);
t   = t(:);
cf  = prod(exp(1i*t*(mu.*coef) - ...
      abs(t*(sigma.*coef)).^(ones(size(t))*(alpha.*coef))),2);
cf  = reshape(cf,szt);
cf(t==0) = 1;

if ~isempty(niid)
    if isscalar(niid)
        cf = cf .^ niid;
    else
        error('niid should be a scalar (positive integer) value');
    end
end

end