%% EXPERIMENTW002
%  20-Sep-2017 10:12:13

% Gil-Pelaez integral (PDF) calculated by using the BAKHVALOV-VASILEVA
% method for computing the Fourier Integral (for non-negative
% distributions).
% The CDF is calculated by the GIL-PELAEZ formula:
%  f(x) =  2 * (1/pi * Int_0^Inf exp(i*t*x) * Real(cf(t)) dt)
%       =  2/pi * Int_0^Inf exp(i*t*x) * Real(cf(t)) dt
% 

clear 
%% LogNormal distribution

mu = 0;
b = 1;
cf = @(t)cfX_LogNormal(t,mu,b);
fun = @(t) real(cf(t));
A = 1e-12;
B = 50;
x = linspace(0,7,501);

[FI,coefs] = FourierIntegral_BV(x,fun,A,B);
PDF = 2*real(FI)/pi;
plot(x,PDF,'.-');grid
hold on
plot(x,lognpdf(x,0,1))
hold off

figure
plot(coefs,'o-');grid

%% ChiSquare distribution

nu = 2;
cf = @(t)cf_ChiSquare(t,nu);
fun = @(t) real(cf(t));
A = 1e-12;
B = 500;
x = linspace(0,15,501);
nPts = 150;

[FI,coefs] = FourierIntegral_BV(x,fun,A,B,nPts);
PDF = 2*real(FI)/pi;
plot(x,PDF,'.-');grid
hold on
plot(x,chi2pdf(x,nu))
hold off

figure
plot(coefs,'o-');grid
%% Weibull distribution

a = 1.5;
b = 1;
cf = @(t)cfX_Weibull(t,a,b);
fun = @(t) real(cf(t));
A = 1e-13;
B = 70;
nPts = 70;
x = linspace(0,5,501);

[FI,coefs] = FourierIntegral_BV(x,fun,A,B,nPts);
PDF = 2*real(FI)/pi;
plot(x,PDF,'.-');grid
hold on
plot(x,wblpdf(x,1/a,b))
hold off

figure
plot(coefs,'o-');grid

%% Compound LogNormal-Poisson distribution

mu = 0;
b = 1;
lambda = 5;
cfX = @(t)cfX_LogNormal(t,mu,b);
cf = @(t) cfN_Poisson(t,lambda,cfX);
fun = @(t) real(cf(t));
A = -1e-12;
B = 2.5;
x = linspace(0,50,501);
nPts = 150;

[FI,coefs] = FourierIntegral_BV(x,fun,A,B,nPts);
PDF = 2*real(FI)/pi;
plot(x,PDF,'.-');grid

figure

plot(coefs,'o-');grid

%% Compound Weibull-Poisson distribution

a = 1.5;
b = 1;
lambda = 5;
cfX = @(t)cfX_Weibull(t,a,b);
cf = @(t) cfN_Poisson(t,lambda,cfX);
fun = @(t) real(cf(t));
A = 1e-12;
B = 5;
nPts = 75;
x = linspace(0,15,501);

tic;[FI,coefs] = FourierIntegral_BV(x,fun,A,B,nPts);toc
PDF = 2*real(FI)/pi;
plot(x,PDF,'.-');grid

figure
plot(coefs,'o-');grid
