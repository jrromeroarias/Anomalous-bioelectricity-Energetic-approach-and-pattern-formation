% =========================================================================
% DESCRIPTION:   Intersection of points on a square grid with a surface
%
% AUTHOR:   J. Roberto Romero-Arias
% ADDRESS:  IIMAS, UNAM. Mexico.
% DATE:     January 2026
% =========================================================================

aux=[];
aux=adjneibs;
% check the number of neibors with adjacent matrix
%the value of the funtion should be zero out the domain that will be
%integer
neibos=zeros(Nx,Ny,Nz);
neib=neibos;


for m=2:Nx-1;
    for n=2:Ny-1
        for mm=2:Nz-1;
            neibos(m,n,mm)=aux(m-1,n,mm)+aux(m+1,n,mm)+aux(m,n-1,mm)+aux(m,n+1,mm)+aux(m,n,mm-1)+aux(m,n,mm+1);
        end
        neibos(m,n,1)=neibos(m,n,1)+aux(m-1,n,1)+aux(m+1,n,1)+aux(m,n-1,1)+aux(m,n+1,1)+aux(m,n,2);
    end
end

neibos(1,:,:)=neibos(1,:,:)+aux(2,:,:);
neibos(:,1,:)=neibos(:,1,:)+aux(:,2,:);
neibos(Nx,:,:)=neibos(Nx,:,:)+aux(Nx-1,:,:);
neibos(:,Ny,:)=neibos(:,Ny,:)+aux(:,Ny-1,:);
neibos(:,:,Nz)=neibos(:,:,Nz)+aux(:,:,Nz-1);

neib=neibos;