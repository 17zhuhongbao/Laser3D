function [laserMask, mask] = getLaserHeight(filename,model)
% Ϊ�˽��ͼ���ƽ���У׼�Ѷȣ���ʵ���豸�ľ������ϸ����á�laser1 ��ֱ���⣻ laser2 ˮƽ����
% clear all; close all; clc;
laserimage = imread(filename);
image = laserimage(:,:,1);
% imshow(image);

%% �������弤��߶�ͼ���ֵ�
disp('1--load laser height dictionary');
laserH_dictionary = getLaserH_dictionary(image);

%% ���ؼ�����Ĥ
disp('2--load laser mask');
mask = findlaser(image, model); %model:1--rows--(laser_x), 2--cols-(laser_y)
% figure; imshow(mask);

%% ���㼤�����������ϵ�¸߶�
disp('3--compute laser height');
laserMask.x = laserH_dictionary.x .* mask;
laserMask.y = laserH_dictionary.y .* mask;
laserMask.z = laserH_dictionary.z .* mask;

% h_z_mask = laserMask.z;
% Z = flipud(h_z_mask);
% figure;mesh(Z);
% pause;