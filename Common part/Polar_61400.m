clc
clear all

%% Polar with SA, BC transition model, turbulence intensity = 0.002, Re = 61400

% Experimental data

expalpha = [-2.80 -1.14 0.26 2.07 3.32 4.98];
expCL = [-0.005 0.240 0.454 0.649 0.770 0.911];
expCD = [0.0628 0.0386 0.0383 0.0391 0.0430 0.0509];

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

alpha = [-5 -3.5 -3 -2 0 2 4 6 8 10 12 13 14];

efficiency = meanCL./meanCD;
expefficiency = expCL./expCD;

CLdef = meanCL;
CDdef = meanCD;

%% PLOTS 

figure 

plot(alpha(1:13), CLdef(1:13),'-*', 'Color',[0 0.4470 0.7410], 'LineWidth',2) 
hold on
plot (expalpha, expCL, '-o','Color',[0 0.75 0.2], 'LineWidth',2)
title ('CL vs alpha','FontSize', 18)
subtitle('Re = 61400')

tz=legend({"SU2 SA-BC", "Experimental data"},'Location','northwest', 'FontSize', 18);
ty=ylabel('$C_{L}$');
tx=xlabel('$\alpha$');

% fig stuff
legend boxoff
tx.Interpreter='latex';
ty.Interpreter='latex';
tz.Interpreter='latex';
tz.Location='best';
set(gca,'TickLabelInterpreter', 'latex');
x0=10;
y0=10;
width=500;
height=400;
set(gcf,'position',[x0,y0,width,height])
ax = gca;
ax.FontSize = 18;
grid on

figure 

plot(alpha(1:13), CDdef(1:13),'-*', 'Color',[0.8500 0.3250 0.0980], 'LineWidth',2)
hold on
plot(expalpha, expCD, '-o', 'Color',[0 0.75 0.2], 'LineWidth',2)
title('CD vs alpha','FontSize', 16)
subtitle('Re = 61400')


tz=legend({"SU2 SA-BC", "Experimental data"},'Location','northwest', 'FontSize', 18);
ty=ylabel('$C_{D}$');
tx=xlabel('$\alpha$');

% fig stuff
legend boxoff
tx.Interpreter='latex';
ty.Interpreter='latex';
tz.Interpreter='latex';
tz.Location='best';
set(gca,'TickLabelInterpreter', 'latex');
x0=10;
y0=10;
width=500;
height=400;
set(gcf,'position',[x0,y0,width,height])
ax = gca;
ax.FontSize = 18;
grid on



figure 

plot(CDdef(1:13),CLdef(1:13),'-*', 'Color',[0.4940 0.1840 0.5560],'LineWidth',2) 
hold on
plot(expCD, expCL, '-o', 'Color',[0 0.75 0.2], 'LineWidth',2)
title('Drag polar', 'FontSize', 16)
subtitle('Re = 61400')


tz=legend({"SU2 SA-BC", "Experimental data"},'Location','northwest', 'FontSize', 18);
ty=ylabel('$C_{L}$');
tx=xlabel('$C_{D}$');

% fig stuff
legend boxoff
tx.Interpreter='latex';
ty.Interpreter='latex';
tz.Interpreter='latex';
tz.Location='best';
set(gca,'TickLabelInterpreter', 'latex');
x0=10;
y0=10;
width=500;
height=400;
set(gcf,'position',[x0,y0,width,height])
ax = gca;
ax.FontSize = 18;
grid on


figure 

plot(alpha(1:13), efficiency(1:13), '-*', 'Color',[0.6350 0.0780 0.1840], 'LineWidth',2)
hold on
plot(expalpha, expefficiency, '-o', 'Color',[0 0.75 0.2], 'LineWidth',2)
title('Efficiency ratio vs alpha','FontSize', 16)
subtitle('Re = 61400')


tz=legend({"SU2 SA-BC", "Experimental data"},'Location','northwest', 'FontSize', 18);
ty=ylabel('$\frac{L}{D}$');
tx=xlabel('$\alpha$');

% fig stuff
legend boxoff
tx.Interpreter='latex';
ty.Interpreter='latex';
tz.Interpreter='latex';
tz.Location='best';
set(gca,'TickLabelInterpreter', 'latex');
x0=10;
y0=10;
width=500;
height=400;
set(gcf,'position',[x0,y0,width,height])
ax = gca;
ax.FontSize = 18;
grid on





