%clear all
%clc

%% LOTW

% SU2

T = readtable("0_7l.csv");

% "angle" in airfoil points. 
beta =0.026637330387070;

Cf_0 =0.001636669971;
Cf_1 =-4.21239165e-05;
Cf = (Cf_0.*cos(beta))+(Cf_1.*sin(beta));

% Freestream velocity
U  = 3.0722;

uTau = sqrt(0.5*U*U*Cf);
ypVisc = logspace(-5,5,100);
ypLog = logspace(-5,5,100);
u  = (T.Velocity_0.*cos(beta))+(T.Velocity_1.*sin(beta));
upsim = u./uTau;
nu = T.Laminar_Viscosity(end)./T.Density(end);


k = 0.41;
ypsim = uTau.*T.arc_length./nu;

uvisc = ypVisc;

C = 5;
ulog_clean = (1/k)*log(ypLog) + C;

f1=figure(1)
semilogx(ypVisc,uvisc,'r', ypLog, ulog_clean, 'b', ypsim, upsim, 'k','linew',2.5);
hold on
axis([0.08 1000 0 40])
tz=legend("$u^+ = y^+$", "$u^+ = \frac{1}{k}\log{y^+} + C$", "SA + BC");
ty=ylabel('$u^+$');
tx=xlabel('$y^+$');
tz.FontSize = 50;
tz.Location = 'best';
tx.Interpreter = 'Latex';
ty.Interpreter = 'Latex';
tz.Interpreter = 'Latex';
set(gca, 'TickLabelInterpreter', 'Latex');
ax = gca;
ax.FontSize = 37;
legend boxoff;
grid on
%set(f1,'Position',[100 100 500 500])
set(gcf,'Position',[50 50 1300 750])
print(gcf,'-depsc','-painters','LS_V3.0722_0.7.eps')



