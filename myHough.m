function myHough()
clc
clear all;
%%%%%%%%%%%%%Hough%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

RGB = imread('gantrycrane.png');
subplot(2,3,1);
imshow(RGB);
title('gantrycrane.png');
I  = rgb2gray(RGB);
BW = edge(I,'canny');
[H,T,R] = hough(BW,'RhoResolution',0.5,'ThetaResolution',0.5);
title('gantrycrane.png');
subplot(2,3,2);
imshow(imadjust(mat2gray(H)),'XData',T,'YData',R,...
      'InitialMagnification','fit');
title('Hough transform of gantrycrane.png');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
colormap(hot);

%%%%%%%%%%%%%%%%%%%%%%%%%%HoughPeaks%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

II  = rgb2gray(RGB);

BW = edge(imrotate(II,50,'crop'),'canny');
[HH,TT,RR] = hough(BW);
P  = houghpeaks(HH,10);
subplot(2,3,3);
imshow(HH,[],'XData',TT,'YData',RR,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
plot(TT(P(:,2)),RR(P(:,1)),'s','color','white');

%%%%%%%%%%%%%%%%%%%%%%%Houghlines%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

rotI = imrotate(II,33,'crop');
BW = edge(rotI,'canny');
[HHH,TTT,RRR] = hough(BW);
subplot(2,3,4)
imshow(HHH,[],'XData',TTT,'YData',RRR,...
            'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
P  = houghpeaks(HHH,10);
x = TTT(P(:,2)); y = RRR(P(:,1));
plot(x,y,'s','color','white');

lines = houghlines(BW,TTT,RRR,P,'FillGap',5,'MinLength',7);

subplot(2,3,5)
imshow(rotI), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end


plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');







end
