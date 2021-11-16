function canny()
im=imread('lena.jpg');
subplot(2,3,1);
imshow(im);
gausfilter=fspecial('gaussian',50, 1 );
image=rgb2gray(im);
smoothed=imfilter(image,gausfilter,'same');
subplot(2,3,2);
imshow(smoothed);
[Gmag,Gdir] = imgradient(smoothed,'sobel');
%{
h=[-1 0 1];
h2=transpose(h);
Ix=conv2(double(smoothed),h,'same');
Iy=conv2(double(smoothed),h2,'same');

Gmag=[];
Gdir=[];
Gmag=sqrt(power(Ix,2)+power(Iy,2));
Gdir=atan2(Iy,Ix);
Gdir=Gdir*180/pi;
%}
subplot(2,3,3);
imshow(uint8(Gmag));


[x y]=size(Gdir);

thinImg=thin(Gdir,Gmag);
subplot(2,3,4);
imshow(uint8(thinImg));
t=thinImg(:);
Max=max(t);

average=Max/2;
LowThreshold=average-180;
HighThreshold=average+180;

h=1;
l=0;
for i=1:x
    for j=1:y
        if(thinImg(i,j)>HighThreshold)
            thinImg(i,j)=h;
        elseif(thinImg(i,j)<LowThreshold)
           thinImg(i,j)=l;
        end
        
    end
end

for i=2:x-1
    for j=2:y-1
        if(thinImg(i,j)<=HighThreshold &&thinImg(i,j)>=LowThreshold)
            if(thinImg(i-1,j-1)==1||thinImg(i-1,j)==1||thinImg(i,j-1)==1||thinImg(i,j+1)==1||thinImg(i+1,j-1)==1||thinImg(i+1,j)==1||thinImg(i+1,j+1)==1)
                              
                       thinImg(i,j)=1;
                
            else
                thinImg(i,j)=1;
            
                
                
        end
        
        
    end
end







subplot(2,3,5);
imshow(thinImg);

canny=edge(image,'canny',[0.05 .5],1);

subplot(2,3,6);
imshow(canny);





end

