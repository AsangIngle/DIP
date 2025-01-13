clc 
clear all


img=imread("car.jpg");
imshow(img);
size=img(1,3);
display(size);
%only red color
ir_img=img;
ir_img(:,:,2)=0;  
ir_img(:,:,3)=0;

subplot(1,2,2);
imshow(ir_img);
%only green color

ig_img=img;
ig_img(:,:,1)=0;  
ig_img(:,:,3)=0;

subplot(1,2,2);
imshow(ig_img);
%only blue color

ib_img=img;
ib_img(:,:,1)=0;  
ib_img(:,:,2)=0;

subplot(1,2,2);
imshow(ib_img);
%gray img
Igr=img(:,:,1);
imshow(Igr);
%direct using command
Igray=rgb2gray(img);



