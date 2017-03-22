clear all;
clc;
close all;
d1 = imread('R:\Documents\Computers\Matlab\Project OD\images\d1.jpg');
d1_gray = rgb2gray(d1);
subplot(2,2,1);
imshow(d1_gray);

se = strel('line',11,90);
d1_dil = imdilate(d1_gray,se);
subplot(2,2,2);
imshow(d1_dil);

d1_ero = imerode(d1_gray,se);
subplot(2,2,3);
imshow(d1_ero);

[x y z] = size(d1_ero);
for i=2:x-3
    for j=2:y-3
        d1_mix(i,j) = abs(d1_ero(i+1,j+1)) + abs(d1_ero(i-1,j-1));
    end
end
subplot(2,2,4);
imshow(d1_mix);
figure
for i=2:x-1
    for j=2:y-1
        d1_hor(i,j) = d1_ero(i,j+1) - d1_ero(i,j-1);
    end
end
subplot(2,2,1);
imshow(d1_hor);

for i=2:x-1
    for j=2:y-1
        d1_ver(i,j) = d1_ero(i+1,j) - d1_ero(i-1,j);
    end
end
subplot(2,2,2);
imshow(d1_ver);

for i=2:x-1
    for j=2:y-1
        d1_dia(i,j) =abs( d1_ero(i,j)) + abs(d1_ero(i,j));
    end
end
subplot(2,2,3);
imshow(d1_dia);

f = ones(3,3)/9;
d1_fil = filter2(f,d1_ero,'same');
subplot(2,2,4);
imshow(d1_fil);
