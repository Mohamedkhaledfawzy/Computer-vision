function[FinalMag]= thin(Dir,Mag)

[x y]=size(Dir);

FinalMag=zeros(x,y);



for r=2:x-1
    for c=2:y-1
        direction=Dir(r,c);
       
        angle=theta(direction);
        if(angle==0 ||angle==180)   
            if (Mag(r,c)>Mag(r,c-1) &&Mag(r,c)>Mag(r,c+1))
                FinalMag(r,c)=Mag(r,c);
                
            end
                
                
            
          
        elseif(angle==45 || angle==-135)
           if (Mag(r,c)>Mag(r-1,c+1) &&Mag(r,c)>Mag(r+1,c-1))
                FinalMag(r,c)=Mag(r,c);
                
           end
            
            
        elseif(angle==90 || angle==-90)    
           if (Mag(r,c)>Mag(r+1,c) &&Mag(r,c)>Mag(r-1,c))
                FinalMag(r,c)=Mag(r,c);
                
           end
            
         
        
        elseif(angle==135 || angle==-45)
            if (Mag(r,c)>Mag(r-1,c-1) &&Mag(r,c)>Mag(r+1,c+1))
                FinalMag(r,c)=Mag(r,c);
                
            end
           
            
            
            
            
             
        end
        
       
    
        
       
    end
          
    
end

end
    