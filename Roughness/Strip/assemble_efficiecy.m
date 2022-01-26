%Assembling efficiency
clc
clear all

S = csvread('history01_8.csv',1,0);

CD = S(:,4);

CDformean = CD(length(CD)-19:length(CD));
Coefs134_001(2,4) = mean (CDformean);

CL = S(:,5);
CLformean = CL(length (CL)-19:length(CL));
Coefs134_001(1,4) = mean (CLformean);

%----------------------------------------------------
S = csvread('history01_10.csv',1,0);

CD = S(:,4);

CDformean = CD(length(CD)-19:length(CD));
Coefs134_001(2,5) = mean (CDformean);

CL = S(:,5);
CLformean = CL(length (CL)-19:length(CL));
Coefs134_001(1,5)= mean (CLformean);

%-------------------------------------------
S = csvread('history001_12.csv',1,0);

CD = S(:,4);

CDformean = CD(length(CD)-19:length(CD));
Coefs134_001(2,6) = mean (CDformean);

CL = S(:,5);
CLformean = CL(length (CL)-19:length(CL));
Coefs134_001(1,6) = mean (CLformean);