% =========================================================================
% NAME:  Biopotentials
% DESCRIPTION:   Code to simulate 3D electric potentials and volumetric
%                charge density of unperturbed cancer for differen
%                spherical harmonics with BVAM-Turing pattern and
%                energetic approach usinf the phase field model
%
% AUTHOR:   J. Roberto Romero-Arias
% ADDRESS:  IIMAS, UNAM. Mexico.
% DATE:     January 2026
% =========================================================================

clear all
tic
%% General Parameters
Nx=60;  % Grid
Ny=60;
Nz=60;
R=10;  %radius
step=1000; % phase field iteration loop
dt=1e-4;  % time scale

ep1=1;   % diffusive scale
ep2=ep1^2;
sigmafi=0.0; % surface tension for fi field

mass=1.0;     % added mass for unit of time
kappa1 = 0.0;  % growth factor for harmonic  Y20
kappa2 = 1.00; % growth factor for harmonic  Y21
kappa3 = 0.00; % growth factor for harmonic  Y22
cutfi = -0.5;  % threshold for surface phase field fi=0 
Dfi = 1;  % diffusion of phase field


%% Parameters for the Turing system BVAM model
Du=0.516;          % u diffusion
Dv=1;              % v diffusion
h=-1.;             % v degradation for u
a=1/.899;          % scale interaction for v on u
b=-.91/.899;       % scale interaction for u on v
c= 0.0;            % no linear interaction for u and v--> For Y21 
cw = 0.57;         % no linear interaction for u and v--> Y20 = 0 for stripes
lgam=((2*Du/((Du*b+1))));  % critical lambda value
kc=(0.85)^2;               % critical wave vector value
delta=0.899/lgam/kc;       % critical length scale 
dx=(1/(1/1))^2;            % space scale
ff= 9;                     % factor simetry--> Y2m=9 ; Y32=4.5; Y41=2.33
eta1=0.899/(delta/(dx/ff));% reaction-diffusion scale
sqrt((eta1*delta/.899));   
(delta/(dx/2.25));
                           % limits of the range of k2
Llmin=(eta1*R*R*Du/2)*((1/Du)+b-sqrt(((1/Du)+b)^2-4*(1/Du)*(b-a*h)));
Llmax=(eta1*R*R*Du/2)*((1/Du)+b+sqrt(((1/Du)+b)^2-4*(1/Du)*(b-a*h)));

dt1=5e-2;         % Turing time scale
itersTuring=60;   % Integration loops

%% Gompertz parameters

alpha = 0.6;     % intrinsic growth rate
beta = 0.2;      % growth deceleration factor
fipo=-160;       % inner electric potential   
fips = -15;      % surface electric potential
radio = 5.6;     % initial tumor radio
etaepsilon = 1*(35.4*10^(-5));   % Conductive–Dielectric ratio      
betao = (1/R)/(etaepsilon*(fipo-fips)/radio);
beta1 = 2*(etaepsilon*(fipo-fips)/radio);    % EQN (2.22) 

%%  Phase field initial conditions
esf3D  %Load the domain. The programs that generate the domain set
       % fi to 1 and -1 inside and outside the interphase.
fi = smooth3(fi);
fix0(:,:)=fi(Nx/2,:,:);
vobs = sum(sum(sum(fi>0)));
vteo = sum(sum(sum(fi>0)));
RR = 1.5*3/(4*pi)*(vteo^(1/3)); % Initial phase field tumor radio

sigma12 = zeros(Nx,Ny,Nz);      % charge density
sigma0 = sigma12;
sigmaf = sigma0;
phipot = sigma0;
Is = sigma0;                    % variables for mass agregation
Iss = Is;
Tur = 0;                        
Turinit = 10;
ccount = 0;

%% Initial conditions for u and v Turing
[X,Y,Z]=meshgrid(1:Nx,1:Ny,1:Nz);
u = sigma0;
v = sigma0;
uw = u;
vw = v;
us = u;

%% Solving Turing system
%%
for itter=1:360 % 20 iterations -->1 day
    %
    itter
    if itter == Turinit
        Tur = 1;
        u=1*(rand(Nx,Ny,Nz)-.5);
        v=1*(rand(Nx,Ny,Nz)-.5);
        uw=u;
        vw=v;
    end

    if Tur == 1
        %%% Turing
        %% Solving Turing system
        u(find((fi)<=cutfi))=0;
        v(find((fi)<=cutfi))=0;
        uw(find((fi)<=cutfi))=0;
        vw(find((fi)<=cutfi))=0;
        
        %zero flux boundary condition over fi~0
        adjneibs=zeros(Nx,Ny,Nz);      
        adjneibs(find((fi)>cutfi))=1;

        neibs;
        neib((find((fi)<=cutfi)))=0;
        yneib=0.*neib;
        yneib(find(neib==5))=1; 
        yneib(find(neib==4))=1;
        yneib(find(neib==3))=1;
        yneib(find(neib==2))=1;

        ccount = ccount +1 ;
        cir = 20;
        if ccount > 20
            cir = 0.2;
        end

        for j=1:cir*itersTuring

            H=u;
            lap3DtT
            lapu=lapH;
            H=v;
            lap3DtT
            lapv=lapH;

            H=uw;
            lap3DtT
            lapuw=lapH;
            H=vw;
            lap3DtT
            lapvw=lapH;
            
            % for Y21
            u=u+dt1*(Du*dx*lapu+eta1*(u + a*v - c*u.*v - u.*v.^2));
            v=v+dt1*(Dv*dx*lapv+eta1*(b*v + h*u + c*u.*v + u.*v.^2));
            
            % for Y21 o Ymn
            uw=uw+dt1*(Du*dx*lapuw+eta1*(uw + a*vw - cw*uw.*vw - uw.*vw.^2));
            vw=vw+dt1*(Dv*dx*lapvw+eta1*(b*vw + h*uw + cw*uw.*vw + uw.*vw.^2));

        end

        ffn= ff*(2*RR/R)^2; % simetry conservation
        eta1=0.899/(delta/(dx/ffn));

    end
    %%
    % mass agregation
    if itter > 10
        Is = alpha.*fi.*(1 - (beta/alpha).*log(vteo/vobs));
        Iss = mass*Is.*u;  % Y21 or Ymn
    end

    if Tur == 1
        Iss(find((fi<cutfi)))=0;
        Iss(find((u<0)))=0; % Y21 or Ymn
        Is(find((fi<cutfi)))=0;
    else

        Is(find((fi<cutfi)))=0; %only mass agregation on internal domain
        %us = sigma0;
        Iss = sigma0;
    end


    %%%%spherical tumor
    vteo = sum(sum(sum(fi>0)));
    RR = 1.5*3/(4*pi)*(vteo^(1/3));
    % surface charge
    sigma12 = sigma0;
    phipot = sigma0;
    sigma12(find(abs(fi)<-cutfi))=etaepsilon*(fipo - fips)/RR - beta1*sigmaf(find(abs(fi)<-cutfi));
    % charge density contributions
    sigmaf = sigmaf + 4*dt*(kappa1*vw + kappa2*u + kappa3*v); % accumulated sigma 
                             % Y20       Y21        Y22

    for iitter=1:step
        % electrical potential
        phipot(Nx/2-1:Nx/2+1,Ny/2-1:Ny/2+1,Nz/2-1:Nz/2+1)= fipo-mass*0.01;
        phipot(find(abs(fi)<-cutfi)) = fips;
        phipot = smooth3(phipot);

        H=phipot;
        lap3Dt
        lapphipot=lapH;
        % Poisson equation
        phipot = phipot +sigmaf + 4*dt*(lapphipot + sigma12);
        % spontaneous curvature
        Co = betao*sigma12;
        % Cahn Hilliard
        H=fi;
        lap3Dt
        lapfi=lapH;
        % chemical potential phase field
        mu=(fi).*(fi.^2-1)-ep2*lapfi;
        % mechanical-electric interaction
        bfi = ep1*Co.*(fi.^2-1);
        H=bfi;
        lap3Dt
        lapbfi=lapfi;
        % variations of chemical potential
        mufi = 2*ep1*Co.*fi.*bfi - ep2*lapbfi;
        H=mu;
        lap3Dt
        lapmu=lapH;
        % Variations of the Cahn-Hilliard energy 
        F  = mu+ mufi;
        H=F;
        lap3Dt
        lapF=lapH;
        % Evolution
        fi = fi + dt*Dfi*(lapF  + Is + Iss);

    end

    vteot(itter) = vteo;
    sig12(itter) = etaepsilon*(fipo - fips)/RR;

    %For movies using cine3D y cine2D

    Fim(:,:,:,itter)=fi(:,:,:);
    Uim(:,:,:,itter)=uw(:,:,:);
    Vim(:,:,:,itter)=vw(:,:,:);
    Phim(:,:,:,itter)=phipot(:,:,:);
    sigmaim(:,:,:,itter)=sigma12(:,:,:);
    sigmaF(:,:,:,itter)=sigmaf(:,:,:);

    hh=max(max(max(isnan(fi(:,:,:)))));
    if hh==1;
        'nans'
        break
    end

    %% Figures
    
    xslice = [Nx/2-RR:2:Nx/2+RR,Nx/2-RR:2:Nx/2+RR];
    yslice = [Ny/2-RR:2:Ny/2+RR,Ny/2-RR:2:Ny/2+RR];
    zslice = [0:2:Nz/2,0:3:RR];
    %% Turing spherical harmonic
    figure(1)
    clf 
    cdata = smooth3(uw,'box',3);
    fir = smooth3(fi,'box',3);
    p4=patch(isosurface(fir,0));
    isonormals(fir,p4);
    isocolors(cdata,p4);
    set(p4,'FaceColor','interp','EdgeColor','none'),
    colormap jet
    lighting phong
    view(90,90),
    axis equal, axis off,
    cmap = flip(jet) ; 
    colormap(cmap)
    pause(0.01)
    title('Turing pattern--Ynm');
    set(gca,'linewidth',2,'FontName','Helvetica','FontSize',14,'FontWeight','bold','box','on')
    
 %%   Electrical biopotential
    figure(2) % contour plots
    clf
    hold on
    fix(:,:)=  fi(:,:,Nx/2);
    phipotx(:,:)=phipot(:,:,Nx/2);
    contour(fix+fips,[fips fips],'k--','LineWidth',1)
    contour(fix0,[0 0],'r--','LineWidth',2)
    contour(phipotx,'LineWidth',2,'ShowText','on')
    colorbar
    cmap = flip(jet) ; 
    colormap(cmap)
    hold off
    box on
    axis equal
    set(gca,'linewidth',2,'FontName','Helvetica','FontSize',14,'FontWeight','bold','box','on')
    title('$\Phi_0 - \Phi_s $ (mV)','Interpreter','latex ','FontWeight','bold','FontSize',20,'Position',[72 30],'Rotation',270)


%%  Charge density
    figure(3)
    clf
    hold on
    contourslice(X,Y,Z,sigmaf,xslice,yslice,zslice)
    colorbar
    axis off
    axis equal
    cmap = flip(jet) ; 
    colormap(cmap)
    view(90,90)
    set(gca,'linewidth',2,'FontName','Helvetica','FontSize',14,'FontWeight','bold','box','on')
    title('$\rho_v$ (C/$m^3$)','Interpreter','latex ','FontWeight','bold','FontSize',24,'Position',[30 56],'Rotation',270)

end

toc