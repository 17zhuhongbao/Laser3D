clc; clear all; close all;
%% ͼ������
%     A = imread('32.bmp');
%     B = imresize(A, 0.25);
%     imwrite(B ,['cc' '6.bmp']);

%% ������ͼ
for x = 0.01:0.01:pi/4
    y = tan(asin(sin(x)/1.6))/tan(x);
    plot(x,y,'*-');
    hold on;
end




