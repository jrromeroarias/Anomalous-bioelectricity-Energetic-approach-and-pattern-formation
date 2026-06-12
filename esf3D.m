% =========================================================================
% DESCRIPTION:    The programs that generate the domain set
%                  fi to 1 and -1 inside and outside the interphase.
%
% AUTHOR:   J. Roberto Romero-Arias
% ADDRESS:  IIMAS, UNAM. Mexico.
% DATE:     January 2026
% =========================================================================

dd=ones(Nx,Ny);

fi=ones(Nx,Ny,Nz);

for i=1:Nx
    for j=1:Ny
        for k=1:Nz
      r(i,j,k)=sqrt((i-Nx/2)^2+(j-Ny/2)^2+(k-Nz/2)^2);
      if r(i,j,k)>=R
      fi(i,j,k)=-1;
      end
        end
   
   end
end
