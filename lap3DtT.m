% =========================================================================
% DESCRIPTION:    Laplacian 3D function with zero flux boundary conditions
%                 for surface on square grid
%
% AUTHOR:   J. Roberto Romero-Arias
% ADDRESS:  IIMAS, UNAM. Mexico.
% DATE:     January 2026
% =========================================================================

aux=H;
neibx=neib;

lapH=0*aux;

for m=2:Nx-1;
    for n=2:Ny-1;
        for mm=2:Nz-1;

            lapH(m,n,mm)=((aux(m-1,n,mm)-aux(m,n,mm))*adjneibs(m-1,n,mm)+(aux(m+1,n,mm)-aux(m,n,mm))*adjneibs(m+1,n,mm))...
                +((aux(m,n-1,mm)-aux(m,n,mm))*adjneibs(m,n-1,mm)+(aux(m,n+1,mm)-aux(m,n,mm))*adjneibs(m,n+1,mm))...
                +((aux(m,n,mm-1)-aux(m,n,mm))*adjneibs(m,n,mm-1)+(aux(m,n,mm+1)-aux(m,n,mm))*adjneibs(m,n,mm+1));

        end
    end
end

for m=2:Nx-1;
    for n=2:Ny-1;
        for mm=2:Nz-1;


            if yneib(m,n,mm)>0 & (neibx(m,n,mm)==3 | neibx(m,n,mm)==4 | neibx(m,n,mm)==5) %puntos externos a la sup en las lineas
                lapH(m,n,mm)=(aux(m-1,n,mm)-aux(m,n,mm))*adjneibs(m-1,n,mm)*(1-yneib(m-1,n,mm))+(aux(m+1,n,mm)-aux(m,n,mm))*adjneibs(m+1,n,mm)*(1-yneib(m+1,n,mm))...
                    +(aux(m,n-1,mm)-aux(m,n,mm))*adjneibs(m,n-1,mm)*(1-yneib(m,n-1,mm))+(aux(m,n+1,mm)-aux(m,n,mm))*adjneibs(m,n+1,mm)*(1-yneib(m,n+1,mm))...
                    +(aux(m,n,mm-1)-aux(m,n,mm))*adjneibs(m,n,mm-1)*(1-yneib(m,n,mm-1))+(aux(m,n,mm+1)-aux(m,n,mm))*adjneibs(m,n,mm+1)*(1-yneib(m,n,mm+1));

            end



            if yneib(m,n,mm)>0 & neibx(m,n,mm)==2 %puntos externos a la sup en esquina con 2 vecinos



                lapH(m,n,mm)=(aux(m-1,n,mm)-aux(m,n,mm))*adjneibs(m-1,n,mm)+(aux(m+1,n,mm)-aux(m,n,mm))*adjneibs(m+1,n,mm)...
                    +(aux(m,n-1,mm)-aux(m,n,mm))*adjneibs(m,n-1,mm)+(aux(m,n+1,mm)-aux(m,n,mm))*adjneibs(m,n+1,mm)...
                    +(aux(m,n,mm-1)-aux(m,n,mm))*adjneibs(m,n,mm-1)+(aux(m,n,mm+1)-aux(m,n,mm))*adjneibs(m,n,mm+1);



            end

            if yneib(m,n,mm)>0 & neibx(m,n,mm)==3%puntos externos a la sup esquinas con 3 vecinos



                if (adjneibs(m-1,n,mm)==1 & adjneibs(m,n-1,mm)==1 & adjneibs(m,n,mm-1)==1 )
                    lapH(m,n,mm)=(aux(m-1,n,mm)-aux(m,n,mm))*adjneibs(m-1,n,mm)+(aux(m,n-1,mm)-aux(m,n,mm))*adjneibs(m,n-1,mm)...
                        +(aux(m,n,mm-1)-aux(m,n,mm))*adjneibs(m,n,mm-1);
      			 end
                 if (adjneibs(m-1,n,mm)==1 & adjneibs(m,n-1,mm)==1 & adjneibs(m,n,mm+1)==1 )
                     lapH(m,n,mm)=(aux(m-1,n,mm)-aux(m,n,mm))*adjneibs(m-1,n,mm)+(aux(m,n-1,mm)-aux(m,n,mm))*adjneibs(m,n-1,mm)...
                      	  +(aux(m,n,mm+1)-aux(m,n,mm))*adjneibs(m,n,mm+1);
                 end
      			if (adjneibs(m-1,n,mm)==1 & adjneibs(m,n+1,mm)==1 & adjneibs(m,n,mm-1)==1 )
                    lapH(m,n,mm)=(aux(m-1,n,mm)-aux(m,n,mm))*adjneibs(m-1,n,mm)+(aux(m,n+1,mm)-aux(m,n,mm))*adjneibs(m,n+1,mm)...
                        +(aux(m,n,mm-1)-aux(m,n,mm))*adjneibs(m,n,mm-1);
      		   end
               if(adjneibs(m-1,n,mm)==1 &  adjneibs(m,n+1,mm)==1 & adjneibs(m,n,mm+1)==1 )
                   lapH(m,n,mm)=(aux(m-1,n,mm)-aux(m,n,mm))*adjneibs(m-1,n,mm)+(aux(m,n+1,mm)-aux(m,n,mm))*adjneibs(m,n+1,mm)...
                       +(aux(m,n,mm+1)-aux(m,n,mm))*adjneibs(m,n,mm+1);
               end




               if (adjneibs(m+1,n,mm)==1 & adjneibs(m,n-1,mm)==1 & adjneibs(m,n,mm-1)==1 )
                   lapH(m,n,mm)=(aux(m+1,n,mm)-aux(m,n,mm))*adjneibs(m+1,n,mm)+(aux(m,n-1,mm)-aux(m,n,mm))*adjneibs(m,n-1,mm)...
                       +(aux(m,n,mm-1)-aux(m,n,mm))*adjneibs(m,n,mm-1);
               end
               if (adjneibs(m+1,n,mm)==1 &  adjneibs(m,n-1,mm)==1 & adjneibs(m,n,mm+1)==1 )
                   lapH(m,n,mm)=(aux(m+1,n,mm)-aux(m,n,mm))*adjneibs(m+1,n,mm)+(aux(m,n-1,mm)-aux(m,n,mm))*adjneibs(m,n-1,mm)...
                       +(aux(m,n,mm+1)-aux(m,n,mm))*adjneibs(m,n,mm+1);
               end
               if (adjneibs(m+1,n,mm)==1 & adjneibs(m,n+1,mm)==1 & adjneibs(m,n,mm-1)==1 )
                   lapH(m,n,mm)=(aux(m+1,n,mm)-aux(m,n,mm))*adjneibs(m+1,n,mm)+(aux(m,n+1,mm)-aux(m,n,mm))*adjneibs(m,n+1,mm)...
                       +(aux(m,n,mm-1)-aux(m,n,mm))*adjneibs(m,n,mm-1);
               end
               if (adjneibs(m+1,n,mm)==1 &  adjneibs(m,n+1,mm)==1 & adjneibs(m,n,mm+1)==1 )
                   lapH(m,n,mm)=(aux(m+1,n,mm)-aux(m,n,mm))*adjneibs(m+1,n,mm)+(aux(m,n+1,mm)-aux(m,n,mm))*adjneibs(m,n+1,mm)...
                       +(aux(m,n,mm+1)-aux(m,n,mm))*adjneibs(m,n,mm+1);
               end



            end



            if yneib(m,n,mm)>0 & neibx(m,n,mm)==4%puntos externos a la sup esquinas con 3 vecinos

                if   (adjneibs(m-1,n,mm)==1 & adjneibs(m+1,n,mm)==1 )

                    lapH(m,n,mm)= (aux(m,n-1,mm)-aux(m,n,mm))*adjneibs(m,n-1,mm)+(aux(m,n+1,mm)-aux(m,n,mm))*adjneibs(m,n+1,mm)...
                        +(aux(m,n,mm-1)-aux(m,n,mm))*adjneibs(m,n,mm-1)+(aux(m,n,mm+1)-aux(m,n,mm))*adjneibs(m,n,mm+1);

                end

                if (adjneibs(m,n-1,mm)==1 & adjneibs(m,n+1,mm)==1 )

                    lapH(m,n,mm)=(aux(m-1,n,mm)-aux(m,n,mm))*adjneibs(m-1,n,mm)+(aux(m+1,n,mm)-aux(m,n,mm))*adjneibs(m+1,n,mm)...
                        +(aux(m,n,mm-1)-aux(m,n,mm))*adjneibs(m,n,mm-1)+(aux(m,n,mm+1)-aux(m,n,mm))*adjneibs(m,n,mm+1);

                end

                if  (adjneibs(m,n,mm-1)==1 & adjneibs(m,n,mm+1)==1 )

                    lapH(m,n,mm)=(aux(m-1,n,mm)-aux(m,n,mm))*adjneibs(m-1,n,mm)+(aux(m+1,n,mm)-aux(m,n,mm))*adjneibs(m+1,n,mm)...
          				 +(aux(m,n-1,mm)-aux(m,n,mm))*adjneibs(m,n-1,mm)+(aux(m,n+1,mm)-aux(m,n,mm))*adjneibs(m,n+1,mm);

                end

            end

        end
    end
end


for i=1:Nx
    for j=1:Ny
      
         LapH(i,j,1)=0;
      	 LapH(i,Ny,j)=0;
         LapH(1,i,j)=0;
         LapH(Nx,i,j)=0;
         LapH(i,j,Nz)=0;
         LapH(i,1,j)=0;

         if yneib(i,j,1)>0 & neibx(i,j,1)==3 & i>1 & j>1 %puntos externos a la sup esquinas con 3 vecinos


          	if (adjneibs(i-1,j,1)==1 & adjneibs(i,j-1,1)==1 & adjneibs(i,j,2)==1 )
                lapH(i,j,1)=(aux(i-1,j,1)-aux(i,j,1))*adjneibs(i-1,j,1)+(aux(i,j-1,1)-aux(i,j,1))*adjneibs(i,j-1,1)...
                    +(aux(i,j,2)-aux(i,j,1))*adjneibs(i,j,2);
          	 end
             if (adjneibs(i+1,j,1)==1 & adjneibs(i,j-1,1)==1 & adjneibs(i,j,2)==1 )
                 lapH(i,j,1)=(aux(i+1,j,1)-aux(i,j,1))*adjneibs(i+1,j,1)+(aux(i,j-1,1)-aux(i,j,1))*adjneibs(i,j-1,1)...
                     +(aux(i,j,2)-aux(i,j,1))*adjneibs(i,j,2);
             end
          	if (adjneibs(i-1,j,1)==1 & adjneibs(i,j+1,1)==1 & adjneibs(i,j,2)==1 )
                lapH(i,j,1)=(aux(i-1,j,1)-aux(i,j,1))*adjneibs(i-1,j,1)+(aux(i,j+1,1)-aux(i,j,1))*adjneibs(i,j+1,1)...
                    +(aux(i,j,2)-aux(i,j,1))*adjneibs(i,j,2);

            end
            if(adjneibs(i+1,j,1)==1 &  adjneibs(i,j+1,1)==1 & adjneibs(i,j,2)==1 )
                lapH(i,j,1)=(aux(i+1,j,1)-aux(i,j,1))*adjneibs(i+1,j,1)+(aux(i,j+1,1)-aux(i,j,1))*adjneibs(i,j+1,1)...
                    +(aux(i,j,2)-aux(i,j,1))*adjneibs(i,j,2);

            end

         end


    end
end





