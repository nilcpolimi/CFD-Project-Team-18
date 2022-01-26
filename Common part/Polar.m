clc
clear all

%% Polar with SA, BC transition model, turbulennce intensity = 0.002, Re = 203100

%Experimental data

expalpha = [-2.89 -1.38 0.21 1.66 3.32 4.95 6.94 8.08 10.10 11.30];
expCL = [0.285 0.437 0.602 0.744 0.903 1.059 1.238 1.328 1.426 1.406];
expCD = [0.0193 0.0150 0.0145 0.0135 0.0147 0.0157 0.0179 0.0197 0.0239 0.0314];

files = dir('*.csv');

for i = 1:length (files)
    data = readmatrix (files(i).name);
    Lengthmat (i) = length (data);
    CD = data(:,4);
    CDformean = CD(Lengthmat(i)-19:Lengthmat(i));
    meanCD (i) = mean (CDformean);
    
    CL = data(:,5);
    CLformean = CL(Lengthmat(i)-19:Lengthmat(i));
    meanCL (i) = mean (CLformean);
end

alpha = [-10 -8 -6 -5 -3.5 -3 -2 0 2 4 6 8 10 12 12.5 13 14 15];

n = [17 18 15 13 10 11 9 1 8 12 14 16 2 4 3 5 6 7];
 
for i = 1:18
ni = n(i);
CLdef (i)= meanCL(ni);
CDdef (i) = meanCD(ni);
end 

efficiency = CLdef./CDdef;
expefficiency = expCL./expCD;

figure 

plot(alpha(4:18), CLdef(4:18),'-*', 'Color',[0 0.4470 0.7410], 'LineWidth',2) 
hold on
plot (expalpha, expCL, '-o','Color',[0 0.75 0.2], 'LineWidth',2)
legend({'SU2','Experimental'},'Location','northwest', 'FontSize', 14)
title ('CL vs alpha // Experimental data', 'FontSize', 16)
xlabel('alpha')
ylabel('CL')
grid on

figure 

plot(alpha(4:18), CDdef(4:18),'-*', 'Color',[0.8500 0.3250 0.0980], 'LineWidth',2)
hold on
plot(expalpha, expCD, '-o', 'Color',[0 0.75 0.2], 'LineWidth',2)
legend({'SU2','Experimental'},'Location','northwest', 'FontSize', 14)
title('CD vs alpha // Experimental data','FontSize', 16)
grid on
xlabel('alpha')
ylabel('CD')

figure 

plot(CDdef(4:18),CLdef(4:18),'-*', 'Color',[0.4940 0.1840 0.5560],'LineWidth',2) 
hold on
plot(expCD, expCL, '-o', 'Color',[0 0.75 0.2], 'LineWidth',2)
legend({'SU2','Experimental'},'Location','northeast', 'FontSize', 14)
title('Drag polar // Experimental data', 'FontSize', 16)
xlabel('CD')
ylabel('CL')
grid on

figure 

plot(alpha(4:18), efficiency(4:18), '-*', 'Color',[0.6350 0.0780 0.1840], 'LineWidth',2)
hold on
plot(expalpha, expefficiency, '-o', 'Color',[0 0.75 0.2], 'LineWidth',2)
legend({'SU2','Experimental'},'Location','northwest', 'FontSize', 14)
title('Efficiency ratio vs alpha // Experimental data','FontSize', 16)
grid on
xlabel('alpha')
ylabel('L/D')




