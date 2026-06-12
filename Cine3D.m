% =========================================================================
% NAME:  Cine 3D
% DESCRIPTION:   Code to make videos
%
% INPUT:   Biopotentials
%
% AUTHOR:   J. Roberto Romero-Arias
% ADDRESS:  IIMAS, UNAM. Mexico.
% DATE:     January 2026
% =========================================================================

clear  mmoc
vidfile = VideoWriter('testmovie.mp4','MPEG-4');
open(vidfile);
%
for ttr = 1:300

    itter =ttr +20
    fi(:,:,:) = Fim(:,:,:,itter);
    phipot(:,:,:)=Phim(:,:,:,itter);
    sigma12p(:,:,:)=sigmaim(:,:,:,itter);
    sigmafp(:,:,:)=sigmaF(:,:,:,itter);
    uwp(:,:,:)=Uim(:,:,:,itter);
    xslice = [Nx/2-RR:2:Nx/2+RR,Nx/2-RR:2:Nx/2+RR];
    yslice = [Ny/2-RR:2:Ny/2+RR,Ny/2-RR:2:Ny/2+RR];
    zslice = [0:2:Nz/2,0:3:RR];
    %%
    for kk = 1:200

        phipot(Nx/2-1:Nx/2+1,Ny/2-1:Ny/2+1,Nz/2-1:Nz/2+1)= fipo-20;
        phipot(find(abs(fi)<-cutfi)) = fips;
        phipot = smooth3(phipot);

        phi_old = phipot;

        H=phipot;
        lap3Dt
        lapphipot=lapH;

        phipot = phipot - 300*sigmafp + 1000*dt*(lapphipot + 1*sigma12p);

        err = max(abs(phipot(:) - phi_old(:)));
    end


    %%
    %figure(1)   % uncomment to plot and comment figure 2
    %clf

    %
    % cdata = smooth3(uwp,'box',3);
    %
    % fir = smooth3(fi,'box',3);
    % p4=patch(isosurface(fir,0));
    % isonormals(fir,p4);
    % isocolors(cdata,p4);
    % set(p4,'FaceColor','interp','EdgeColor','none'),
    % %camlight(0,-85,'infinite')
    % %camlight('right')
    % colormap jet
    % lighting phong
    % %view(90,90),
    % view(80,50)
    % %colorbar
    % %colormap polarmap
    % %xlabel('x'); ylabel('y');
    % %camlight; lighting phong
    %
    % axis equal, axis off,
    % %colorbar
    %  cmap = flip(jet) ;
    % colormap(cmap)
    % pause(0.01)
    % set(gca,'linewidth',2,'FontName','Helvetica','FontSize',14,'FontWeight','bold','box','on')


    %%

    figure(2)   % comment to plot figure 1 and uncomment figure 1
    clf
    hold on
    subplot(2,2,[1,3]), title('Phyllotaxis');

    fix(:,:)=  fi(:,:,Nx/2);
    phipotx(:,:)=phipot(:,:,Nx/2);%

    [C,h] = contour(phipotx,'LineWidth',2);
    clabel(C,h,'FontSize',14,'Color','b','FontName','Helvetica','FontWeight','bold')
    hold on
    contour(fix+fips,[fips fips],'k--','LineWidth',2)
    cmap = flip(jet) ;
    colormap(cmap)


    colorbar('westoutside','position',[.1 .33 .02 .4],'YTick',[-170,-130,-90,-50,0])

    clim([-170, 0])

    view(-90,-90)

    box on
    axis([1 Nx 1 Ny])
    axis equal
    axis off

    hold off
    set(gca,'linewidth',2,'FontName','Helvetica','FontSize',16,'FontWeight','bold','box','on')
    title('$\Phi_0 - \Phi_s $ (mV)~~~~~~~~~~~~~$\rho_v$ (C/$m^3$)','Interpreter','latex ','FontWeight','bold','FontSize',22,'Position',[-10 -11],'Rotation',0)
    txt = sprintf('Time:  %.1f Days', 15*ttr/300);
    text(66, 12, txt,'FontName','Helvetica','FontSize',16,'FontWeight','bold');
 

    %%%%%%%%%%%%
    subplot(2,2,[2,4]),

    contourslice(X,Y,Z,-0.4*1000*sigmafp,xslice,yslice,zslice)

    colorbar('eastoutside','position',[.905 .33 .02 .4],'YTick',[-3,-1.5,0.00,1.5,3])

    %clim([-0.15, 0.05]) % Y20
    %clim([-0.5, 0.51]) % Y21
    %clim([-0.31, 0.31]) % Y21
    %clim([-4, 4.1]) % Y32
    clim([-3, 3.1]) % Y41

    axis equal
    axis([1 Nx 1 Ny 1 Nz])
    axis off

    cmap = flip(jet) ;
    colormap(cmap)

    view(-90,10)  %Y20
    %view(-10,50) % Y21

    %view(-50,10) %Y32
    %view(2,30) %Y41

    %view(80,40) %Y41 stripes

    %view(-0,15)
    %view(89,50)

    set(gca,'linewidth',2,'FontName','Helvetica','FontSize',16,'FontWeight','bold','box','on')

    figure(2)  % put here the figure that is plotted
    mmoc(ttr)=getframe(gcf);

end

%%
video=VideoWriter('testmovie.mp4','MPEG-4');
video.FrameRate = 20;

open(video)
writeVideo(video,mmoc);
close(video)



