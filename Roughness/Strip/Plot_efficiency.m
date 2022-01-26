%Efficiency plot
%clc
%clear all
%load('Coefs31_01.mat','Coefs31_005.mat','Coefs47_01.mat','Coefs47_005.mat','Coefs60_01.mat','Coefs60_005.mat')
aoa=[2 4 6 8 10 12];
%Coefs=zeros(2,3)


%load('Coefs31_01.mat')
for i=1:1:6
E134_01(1,i)=Coefs134_01(1,i)/Coefs134_01(2,i);
E134_005(1,i)=Coefs134_005(1,i)/Coefs134_005(2,i);
E134_001(1,i)=Coefs134_001(1,i)/Coefs134_001(2,i);
E148_01(1,i)=Coefs148_01(1,i)/Coefs148_01(2,i);
E148_005(1,i)=Coefs148_005(1,i)/Coefs148_005(2,i);
E148_001(1,i)=Coefs148_001(1,i)/Coefs148_001(2,i);
E164_01(1,i)=Coefs164_01(1,i)/Coefs164_01(2,i);
E164_005(1,i)=Coefs164_005(1,i)/Coefs164_005(2,i);
E164_001(1,i)=Coefs164_001(1,i)/Coefs164_001(2,i);
Ebaseline(1,i)=CoefsBaseline(1,i)/CoefsBaseline(2,i);
end


f1=figure(1)
plot(aoa,E134_01,'r',aoa,E148_01,'g',aoa,E164_01,'b',aoa,Ebaseline,'k','linew',2.0)
hold on
%axis([0.08 1000 0 27])
tz=legend("$0.25 < x/c < 0.35$", "$0.45 < x/c < 0.55$", "$0.70 < x/c < 0.80$", "Clean");
ty=ylabel('$E$');
tx=xlabel('$\alpha [deg]$');
tz.FontSize = 40;
tz.Location = 'best';
tx.Interpreter = 'Latex';
ty.Interpreter = 'Latex';
tz.Interpreter = 'Latex';
set(gca, 'TickLabelInterpreter', 'Latex');
ax = gca;
ax.FontSize = 30;
legend boxoff;
grid on
%set(f1,'Position',[100 100 500 500])
set(gcf,'Position',[50 50 1300 750])
print(gcf,'-depsc','-painters','E_lower01.eps')
hold off


f2=figure(2)
plot(aoa,E134_005,'r',aoa,E148_005,'g',aoa,E164_005,'b',aoa,Ebaseline,'k','linew',2.0)
hold on
%axis([0.08 1000 0 27])
tz=legend("$0.25 < x/c < 0.35$", "$0.45 < x/c < 0.55$", "$0.70 < x/c < 0.80$", "Clean");
ty=ylabel('$E$');
tx=xlabel('$\alpha [deg]$');
tz.FontSize = 40;
tz.Location = 'best';
tx.Interpreter = 'Latex';
ty.Interpreter = 'Latex';
tz.Interpreter = 'Latex';
set(gca, 'TickLabelInterpreter', 'Latex');
ax = gca;
ax.FontSize = 30;
legend boxoff;
grid on
%set(f1,'Position',[100 100 500 500])
set(gcf,'Position',[50 50 1300 750])
print(gcf,'-depsc','-painters','E_lower005.eps')
hold off

f3=figure(3)
plot(aoa,E134_001,'r',aoa,E148_001,'g-',aoa,E164_001,'b',aoa,Ebaseline,'k','linew',2.0)
hold on
%axis([0.08 1000 0 27])
tz=legend("$0.25 < x_c < 0.35$", "$0.45 < x_c < 0.55$", "$0.70 < x_c < 0.80$", "Clean");
ty=ylabel('$E$');
tx=xlabel('$\alpha [deg]$');
tz.FontSize = 40;
tz.Location = 'best';
tx.Interpreter = 'Latex';
ty.Interpreter = 'Latex';
tz.Interpreter = 'Latex';
set(gca, 'TickLabelInterpreter', 'Latex');
ax = gca;
ax.FontSize = 30;
legend boxoff;
grid on
%set(f1,'Position',[100 100 500 500])
set(gcf,'Position',[50 50 1300 750])
print(gcf,'-depsc','-painters','E_lower001.eps')
hold off

