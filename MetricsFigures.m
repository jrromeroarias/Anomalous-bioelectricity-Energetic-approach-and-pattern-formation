% =========================================================================
% NAME:  MetricsFigures
% DESCRIPTION:   Code to graph surface an volumetic metrics. 
%                For different harmonics and mass. 
%
% INPUT:   HarmonicDensity.mat
%
% AUTHOR:   J. Roberto Romero-Arias
% ADDRESS:  IIMAS, UNAM. Mexico.
% DATE:     January 2026
% =========================================================================


load HarmonicDensity.mat


%% ||\rho_{vs}(C/m^3)|| for Y_{20} vs Time
figure(1)
clf
hold on
plot(ttt(1:10:end)*5/100,rhoBY20m05(1:10:end),'w','LineWidth',2)
plot(ttt(1:10:end)*5/100,rhoBY20m05(1:10:end),'k^','LineWidth',2)
plot(ttt*5/100,rhoBY20m1,'r','LineWidth',3)
plot(ttt*5/100,rhoBY20m25,'g-.','LineWidth',3)
plot(ttt*5/100,rhoBY20m50,'b--','LineWidth',3)
legend('Y_{20}','\mu_{Τ} = 0.5','\mu_{Τ} = 1.0','\mu_{Τ} = 25.0','\mu_{Τ} = 50.0','Box','off','FontSize',16,'FontWeight','bold','Location','best')

ylabel('||\rho_v(C/m^3)||','FontWeight','normal','FontSize',18)
xlabel('Time(days)','Interpreter','latex ','FontWeight','bold','FontSize',18)
set(gca,'linewidth',2,'FontName','Helvetica','FontSize',18,'FontWeight','bold','box','on')
axis([0 15 0 0.3])

%% ||\rho_{vs}(C/m^3)|| for Y_{21} vs Time
figure(2)
clf
hold on
plot(ttt(1:10:end)*5/100,rhoBY20m05(1:10:end),'w','LineWidth',2)
plot(ttt*5/100,rhoBY21m1,'r','LineWidth',3)
plot(ttt*5/100,rhoBY21m25,'g-.','LineWidth',3)
plot(ttt*5/100,rhoBY21m50,'b--','LineWidth',3)
legend('Y_{21}','\mu_{Τ} = 1.0','\mu_{Τ} = 25.0','\mu_{Τ} = 50.0','Box','off','FontSize',16,'FontWeight','bold','Location','best')

ylabel('||\rho_v(C/m^3)||','FontWeight','normal','FontSize',18)
xlabel('Time(days)','Interpreter','latex ','FontWeight','bold','FontSize',18)
set(gca,'linewidth',2,'FontName','Helvetica','FontSize',18,'FontWeight','bold','box','on')
axis([0 15 0 0.5])

%% ||\rho_{vs}(C/m^3)|| for Y_{32} vs Time
figure(3)
clf
hold on
plot(ttt(1:10:end)*5/100,rhoBY20m05(1:10:end),'w','LineWidth',2)
plot(ttt*5/100,rhoBY32m1,'r','LineWidth',3)
plot(ttt(1:end-14)*5/100,rhoBY32m25(1:end-14),'g-.','LineWidth',3)
plot(ttt*5/100,rhoBY32m50,'b--','LineWidth',3)
legend('Y_{32}','\mu_{Τ} = 1.0','\mu_{Τ} = 25.0','\mu_{Τ} = 50.0','Box','off','FontSize',16,'FontWeight','bold','Location','best')

ylabel('||\rho_v(C/m^3)||','FontWeight','normal','FontSize',18)
xlabel('Time(days)','Interpreter','latex ','FontWeight','bold','FontSize',18)
set(gca,'linewidth',2,'FontName','Helvetica','FontSize',18,'FontWeight','bold','box','on')
axis([0 15 0 2.1])
rhoAY32m1(218)=rhoAY32m1(219);
rhoAY32m25(287:end) = rhoAY32m25(286);

%% ||\rho_{vs}(C/m^3)|| for Y_{20} vs Time
figure(4)
clf
hold on
plot(ttt(1:10:end)*5/100,rhoCY20m05(1:10:end),'w','LineWidth',2)
plot(ttt(1:10:end)*5/100,rhoCY20m05(1:10:end),'k^','LineWidth',2)
plot(ttt*5/100,rhoCY20m1,'r','LineWidth',3)
plot(ttt*5/100,rhoCY20m25,'g-.','LineWidth',3)
plot(ttt*5/100,rhoCY20m50,'b--','LineWidth',3)
legend('Y_{20}','\mu_{Τ} = 0.5','\mu_{Τ} = 1.0','\mu_{Τ} = 25.0','\mu_{Τ} = 50.0','Box','off','FontSize',16,'FontWeight','bold','Location','best')

ylabel('||\rho_{vs}(C/m^3)||','FontWeight','normal','FontSize',18)
xlabel('Time(days)','Interpreter','latex ','FontWeight','bold','FontSize',18)
set(gca,'linewidth',2,'FontName','Helvetica','FontSize',18,'FontWeight','bold','box','on')
axis([0 15 0 0.3])

%% ||\rho_{vs}(C/m^3)|| for Y_{21} vs Time
figure(5)
clf
hold on
plot(ttt(1:10:end)*5/100,rhoCY20m05(1:10:end),'w','LineWidth',2)
plot(ttt*5/100,rhoCY21m1,'r','LineWidth',3)
plot(ttt*5/100,rhoCY21m25,'g-.','LineWidth',3)
plot(ttt*5/100,rhoCY21m50,'b--','LineWidth',3)
legend('Y_{21}','\mu_{Τ} = 1.0','\mu_{Τ} = 25.0','\mu_{Τ} = 50.0','Box','off','FontSize',16,'FontWeight','bold','Location','best')

ylabel('||\rho_{vs}(C/m^3)||','FontWeight','normal','FontSize',18)
xlabel('Time(days)','Interpreter','latex ','FontWeight','bold','FontSize',18)
set(gca,'linewidth',2,'FontName','Helvetica','FontSize',18,'FontWeight','bold','box','on')
axis([0 15 0 0.6])

%% ||\rho_{vs}(C/m^3)|| for Y_{32} vs Time
figure(6)
clf
hold on
plot(ttt(1:10:end)*5/100,rhoCY20m05(1:10:end),'w','LineWidth',2)
plot(ttt*5/100,rhoCY32m1,'r','LineWidth',3)
plot(ttt(1:end-14)*5/100,rhoCY32m25(1:end-14),'g-.','LineWidth',3)
plot(ttt*5/100,rhoCY32m50,'b--','LineWidth',3)
legend('Y_{32}','\mu_{Τ} = 1.0','\mu_{Τ} = 25.0','\mu_{Τ} = 50.0','Box','off','FontSize',16,'FontWeight','bold','Location','best')

ylabel('||\rho_{vs}(C/m^3)||','FontWeight','normal','FontSize',18)
xlabel('Time(days)','Interpreter','latex ','FontWeight','bold','FontSize',18)
set(gca,'linewidth',2,'FontName','Helvetica','FontSize',18,'FontWeight','bold','box','on')
axis([0 15 0 2.1])

%% ||\rho_{vs}(C/m^3)|| for Y_{20} vs R_T
figure(7)
clf
hold on
plot(AAY20m05(20:10:end-41)-0.2,rhoCY20m05(1:10:end),'w','LineWidth',2)
plot(AAY20m05(20:10:end-41)-0.2,rhoCY20m05(1:10:end),'k^','LineWidth',2)
plot(AAY20m1(20:end-41)-0.2,rhoCY20m1,'r','LineWidth',3)
plot(AAY20m25(20:end-41)-0.2,rhoCY20m25,'g-.','LineWidth',3)
plot(AAY20m50(20:end-41)-0.2,rhoCY20m50,'b--','LineWidth',3)
legend('Y_{20}','\mu_{Τ} = 0.5','\mu_{Τ} = 1.0','\mu_{Τ} = 25.0','\mu_{Τ} = 50.0','Box','off','FontSize',16,'FontWeight','bold','Location','best')

ylabel('||\rho_{vs}(C/m^3)||','FontWeight','normal','FontSize',18)
xlabel('$R_T$(mm)','Interpreter','latex ','FontWeight','bold','FontSize',18)
set(gca,'linewidth',2,'FontName','Helvetica','FontSize',18,'FontWeight','bold','box','on')
axis([5 16 0 0.3])

%% ||\rho_{vs}(C/m^3)|| for Y_{21} vs R_T
figure(8)
clf
hold on
plot(AAY21m1(20:end-41)-0.2,rhoCY21m1,'w','LineWidth',3)
plot(AAY21m1(20:end-41)-0.2,rhoCY21m1,'r','LineWidth',3)
plot(AAY21m25(20:end-41)-0.2,rhoCY21m25,'g-.','LineWidth',3)
plot(AAY21m50(20:end-41)-0.2,rhoCY21m50,'b--','LineWidth',3)
legend('Y_{21}','\mu_{Τ} = 1.0','\mu_{Τ} = 25.0','\mu_{Τ} = 50.0','Box','off','FontSize',16,'FontWeight','bold','Location','best')

ylabel('||\rho_{vs}(C/m^3)||','FontWeight','normal','FontSize',18)
xlabel('$R_T$(mm)','Interpreter','latex ','FontWeight','bold','FontSize',18)
set(gca,'linewidth',2,'FontName','Helvetica','FontSize',18,'FontWeight','bold','box','on')
axis([5 16 0 0.6])

%% ||\rho_{vs}(C/m^3)|| for Y_{32} vs R_T
figure(9)
clf
hold on
plot(AAY32m1(20:end-41)-0.2,rhoCY32m1,'w','LineWidth',3)
plot(AAY32m1(20:end-41)-0.2,rhoCY32m1,'r','LineWidth',3)
plot(AAY32m25(20:end-41-14)-0.2,rhoCY32m25(1:end-14),'g-.','LineWidth',3)
plot(AAY32m50(20:end-41)-0.2,rhoCY32m50,'b--','LineWidth',3)
legend('Y_{32}','\mu_{Τ} = 1.0','\mu_{Τ} = 25.0','\mu_{Τ} = 50.0','Box','off','FontSize',16,'FontWeight','bold','Location','best')

ylabel('||\rho_{vs}(C/m^3)||','FontWeight','normal','FontSize',18)
xlabel('$R_T$(mm)','Interpreter','latex ','FontWeight','bold','FontSize',18)
set(gca,'linewidth',2,'FontName','Helvetica','FontSize',18,'FontWeight','bold','box','on')
axis([5 18 0 2.1])

%% ||\rho_{v}(C/m^3)|| for Y_{20} vs R_T
figure(10)
clf
hold on
plot(AAY20m05(20:10:end-41)-0.2,rhoBY20m05(1:10:end),'w','LineWidth',2)
plot(AAY20m05(20:10:end-41)-0.2,rhoBY20m05(1:10:end),'k^','LineWidth',2)
plot(AAY20m1(20:end-41)-0.2,rhoBY20m1,'r','LineWidth',3)
plot(AAY20m25(20:end-41)-0.2,rhoBY20m25,'g-.','LineWidth',3)
plot(AAY20m50(20:end-41)-0.2,rhoBY20m50,'b--','LineWidth',3)
legend('Y_{20}','\mu_{Τ} = 0.5','\mu_{Τ} = 1.0','\mu_{Τ} = 25.0','\mu_{Τ} = 50.0','Box','off','FontSize',16,'FontWeight','bold','Location','best')

ylabel('||\rho_{v}(C/m^3)||','FontWeight','normal','FontSize',18)
xlabel('$R_T$(mm)','Interpreter','latex ','FontWeight','bold','FontSize',18)
set(gca,'linewidth',2,'FontName','Helvetica','FontSize',18,'FontWeight','bold','box','on')
axis([5 16 0 0.3])

%% ||\rho_{v}(C/m^3)|| for Y_{21} vs R_T
figure(11)
clf
hold on
plot(AAY21m1(20:end-41)-0.2,rhoBY21m1,'w','LineWidth',3)
plot(AAY21m1(20:end-41)-0.2,rhoBY21m1,'r','LineWidth',3)
plot(AAY21m25(20:end-41)-0.2,rhoBY21m25,'g-.','LineWidth',3)
plot(AAY21m50(20:end-41)-0.2,rhoBY21m50,'b--','LineWidth',3)
legend('Y_{21}','\mu_{Τ} = 1.0','\mu_{Τ} = 25.0','\mu_{Τ} = 50.0','Box','off','FontSize',16,'FontWeight','bold','Location','best')

ylabel('||\rho_{v}(C/m^3)||','FontWeight','normal','FontSize',18)
xlabel('$R_T$(mm)','Interpreter','latex ','FontWeight','bold','FontSize',18)
set(gca,'linewidth',2,'FontName','Helvetica','FontSize',18,'FontWeight','bold','box','on')
axis([5 16 0 0.5])

%%  ||\rho_{v}(C/m^3)|| for Y_{32} vs R_T
figure(12)
clf
hold on
plot(AAY32m1(20:end-41)-0.2,rhoBY32m1,'w','LineWidth',3)
plot(AAY32m1(20:end-41)-0.2,rhoBY32m1,'r','LineWidth',3)
plot(AAY32m25(20:end-41-14)-0.2,rhoBY32m25(1:end-14),'g-.','LineWidth',3)
plot(AAY32m50(20:end-41)-0.2,rhoBY32m50,'b--','LineWidth',3)
legend('Y_{32}','\mu_{Τ} = 1.0','\mu_{Τ} = 25.0','\mu_{Τ} = 50.0','Box','off','FontSize',16,'FontWeight','bold','Location','best')

ylabel('||\rho_{v}(C/m^3)||','FontWeight','normal','FontSize',18)
xlabel('$R_T$(mm)','Interpreter','latex ','FontWeight','bold','FontSize',18)
set(gca,'linewidth',2,'FontName','Helvetica','FontSize',18,'FontWeight','bold','box','on')
axis([5 18 0 2.1])

%%

