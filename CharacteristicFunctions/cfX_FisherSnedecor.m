function cf = cfX_FisherSnedecor(t,df1,df2,coef,niid)
%% cfX_FisherSnedecor 
%  Characteristic function of the central FISHER-SNEDECOR F-distribution
%  with df1 > 0 and df2 > 0 degrees of freedom.
%
%  cfX_FisherSnedecor is an ALIAS NAME of the more general function
%  cf_FisherSnedecor, used to evaluate the characteristic function of a
%  linear combination of independent FISHER-SNEDECOR F-distributed random
%  variables. 
% 
%  The characteristic function of X ~ F(df1,df2) is defined by
%   cf(t) = U(df1/2, 1-df2/2, -1i*(df2/df1)*t),
%  where U(a,b,z) denotes the confluent hypergeometric function of the
%  second kind. 
%
% SYNTAX
%  cf = cfX_FisherSnedecor(t,df1,df2)
%  cf = cfX_FisherSnedecor(t,df1,df2,coef,niid);
%
% INPUTS:
%  t     - vector or array of real values, where the CF is evaluated.
%  df1   - vector of the  degrees of freedom df1 > 0. If empty, default
%          value is df1 = 1.  
%  df2   - vector of the  degrees of freedom df2 > 0. If empty, default
%          value is df2 = 1.
%
% WIKIPEDIA: 
%  https://en.wikipedia.org/wiki/F-distribution.
%
% EXAMPLE 1: 
%   % CF of the F-distribution with df1 = 3, df2 = 5
%   df1 = 3;
%   df2 = 5;
%   t   = linspace(-30,30,2^10+1)';
%   cf  = cfX_FisherSnedecor(t,df1,df2);
%   plot(t,real(cf),t,imag(cf));grid
%   title('Characteristic function of the F-distribution')
%
% EXAMPLE 2: 
%   % PDF/CDF of the F-distribution with df1 = 3, df2 = 5
%   df1 = 3;
%   df2 = 5;
%   x = linspace(0,25,101);
%   prob = [0.9 0.95 0.99];
%   cf = @(t) cfX_FisherSnedecor(t,df1,df2);
%   clear options
%   options.xMin = 0;
%   options.xMax = 500;
%   options.N  = 2^15;
%   result = cf2DistGP(cf,x,prob,options)
%
% EXAMPLE 3: 
%   % PDF/CDF of the compound Binomial-Fisher-Snedecor distribution
%   n = 25;  
%   p = 0.3;
%   df1 = 3;
%   df2 = 5;
%   cfX = @(t) cfX_FisherSnedecor(t,df1,df2);
%   cf = @(t) cfN_Binomial(t,n,p,cfX);
%   x = linspace(0,80,101);
%   prob = [0.9 0.95 0.99];
%   clear options
%   options.isCompound = true;
%   result = cf2DistGP(cf,x,prob,options)
%   disp(result)
%
% REFERENCES:
% [1] PHILLIPS, P.C.B. The true characteristic function of the F
%     distribution. Biometrika (1982), 261-264. 
% [2] WITKOVSKY, V.: On the exact computation of the density and of the
%     quantiles of linear combinations of t and F random variables. Journal
%     of Statistical Planning and Inference 94 (2001), 1�13.

% (c) 2017 Viktor Witkovsky (witkovsky@gmail.com)
% Ver.: 24-Jun-2017 10:07:43

%% ALGORITHM
narginchk(1, 5);
if nargin < 5, niid = []; end
if nargin < 4, coef = []; end
if nargin < 3, df2 = []; end
if nargin < 2, df1 = []; end

cf = cf_LogRV_FisherSnedecor(t,df1,df2,coef,niid);

end