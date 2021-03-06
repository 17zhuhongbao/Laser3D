function [laserMask, mask] = getLaserHeight(filename,  model)
% 为了降低激光平面的校准难度，对实验设备的精度有严格设置。
%model:1--rows--(laser_x), 2--cols-(laser_y)
% clear all; close all; clc;
laserimage = imread(filename);
image = laserimage(:,:,1);
imshow(image);

%% 加载整体激光高度图像字典
disp('1--load laser height dictionary');
laserH_dictionary = getLaserH_dictionary(image);

% %% 尺度调整统一
% [rows, cols] = size(image);
% image = image(rows*1/8+1:rows*7/8, cols*1/8+1:cols*7/8);
% laserH_dictionary.x = laserH_dictionary.x(rows*1/8+1:rows*7/8, cols*1/8+1:cols*7/8);
% laserH_dictionary.y = laserH_dictionary.y(rows*1/8+1:rows*7/8, cols*1/8+1:cols*7/8);
% laserH_dictionary.z = laserH_dictionary.z(rows*1/8+1:rows*7/8, cols*1/8+1:cols*7/8);

%% 加载激光掩膜
disp('2--load laser mask');
mask = findlaser(image, model);%model:1--rows--(laser_x), 2--cols-(laser_y)
% figure; imshow(mask);

%% 计算激光点世界坐标系下高度
disp('3--compute laser height');
laserMask.x = laserH_dictionary.x .* mask;
laserMask.y = laserH_dictionary.y .* mask;
laserMask.z = laserH_dictionary.z .* mask;

% h_z_mask = laserMask.z;
% Z = flipud(h_z_mask);
% figure;mesh(Z);
% pause;