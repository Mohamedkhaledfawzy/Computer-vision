function [] = panorama( )

% buildingDir = fullfile(toolboxdir('vision'), 'visiondata', 'building');
% buildingScene = imageSet(buildingDir);
I1 = imread('D:\FCI\Second term\Computer Vision\Assignements\assignments\MyPanorama\mountain1.jpg');
I2 = imread('D:\FCI\Second term\Computer Vision\Assignements\assignments\MyPanorama\mountain2.jpg');
% I1 = read(buildingScene, 1);
gI1 = rgb2gray(I1);
figure;
imshow(I1)
% I2 = read(buildingScene, 2);
gI2 = rgb2gray(I2);
figure;
imshow(I2)
% size(img1);
% size(img2);
%tform= projective2d(eye(3));
p1 = detectSURFFeatures(gI1)
[f1, p1] = extractFeatures(gI1, p1);
p2 = detectSURFFeatures(gI2);
[f2, p2] = extractFeatures(gI2, p2);

mp= matchFeatures(f1,f2);
p1 = p1(mp(1:20,1));
p2 = p2(mp(1:20,2)); 
tform = estimateGeometricTransform(p2,p1,'projective'); 

showMatchedFeatures(I1,I2,p1,p2);
title('Matched inlier points');
imageSize = size(I1);
panorama = ones([imageSize(1) imageSize(2)*2 3],'like',I1)*255;
Tinv = invert(tform);

blender = vision.AlphaBlender('Operation', 'Binary mask','MaskSource', 'Input port'); %overlay 2 images

% Create a 2-D spatial reference object defining the size of the panorama.

panoramaView = imref2d([1100 1100]);
    % Transform I into the panorama.
      warpedImage = imwarp(I2, tform, 'OutputView', panoramaView); %appply trans on image

     panorama = step(blender, panorama, warpedImage, warpedImage(:,:,1));
%    figure;
   % imshow(panorama);
    tform.T=tform.T*Tinv.T; %get inverse of trans
    %------------------------------------------------------------------------------------%
    % Transform I into the panorama.
    warpedImage = imwarp(I1, tform, 'OutputView', panoramaView);
    % Generate a binary mask.
%     mask = imwarp(true(size(img2,1),size(img2,2)), tform, 'OutputView', panoramaView);
    % Overlay the warpedImage onto the panorama.
%     panorama = step(blender, panorama, warpedImage(:,:,1));
    panorama = step(blender, panorama, warpedImage, warpedImage(:,:,1));
    

% figure;
figure;
imshow(panorama);

end