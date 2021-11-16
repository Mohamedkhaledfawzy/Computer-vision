function [ output_args ]=Assignment_1( input_args )
dog=imread('cat.jpg');
cat=imread('dog.jpg');
gausfilter1=fspecial('gaussian',30, 8 );
I=imfilter(cat,gausfilter1,'same');
sharpened=cat-I;
imshow(sharpened);


gausfilter2=fspecial('gaussian',10, 8 );
smoothed=imfilter(dog,gausfilter2,'same');
figure,imshow(smoothed)
hybird=smoothed+sharpened;
figure,imshow(hybird)

% sizeI=imresize(hybird, 0.75);
% figure
% imshow(sizeI)
% sizeII=imresize(hybird, 0.5);
% figure
% imshow(sizeII)
% sizeIII=imresize(hybird, 0.25);
% figure
% imshow(sizeIII)



end