function matching()
cat= rgb2gray(imread('D:\FCI\Second term\Computer Vision\assignments\Matching\cat.jpg'));
dog= rgb2gray(imread('D:\FCI\Second term\Computer Vision\assignments\Matching\dog.jpg'));

[J, rect] = imcrop(cat);
r = normxcorr2(J,cat);
r = imrect;
position = wait(r);

imshow(r)
