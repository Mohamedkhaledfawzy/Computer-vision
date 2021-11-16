function panor()
buildingDir = fullfile(toolboxdir('vision'), 'visiondata', 'building');
buildingScene = imageSet(buildingDir);
I = read(buildingScene, 1);
grayImage = rgb2gray(I);
figure;
imshow(grayImage)
points = detectSURFFeatures(grayImage);
features = extractFeatures(grayImage, points);

I2 = read(buildingScene, 2);
grayImage2 = rgb2gray(I2);
figure;
imshow(grayImage2)

points2 = detectSURFFeatures(grayImage2);
features2 = extractFeatures(grayImage2, points2);
index_pairs = matchFeatures(features,features2);
matchedPtsOriginal  = points(index_pairs(:,1));
matchedPtsDistorted = points2(index_pairs(:,2));
figure; 

showMatchedFeatures(grayImage,grayImage2,matchedPtsOriginal(1:20,:),matchedPtsDistorted(1:20,:),'montage','Parent',axes);
tform =estimateGeometricTransform(matchedPtsDistorted,matchedPtsOriginal,'similarity');
outputView = imref2d(size(grayImage2))

Ir = imwarp(grayImage2,tform,'OutputView',outputView);
figure; 
imshow(Ir); 
blender = vision.AlphaBlender('Operation', 'Binary mask','MaskSource', 'Input port');

mask = ones(size(Ir));
 mask(:,1:end/2) = 0;
 panorama = step(blender,grayImage,Ir,mask);
 figure
imshow(panorama)

end