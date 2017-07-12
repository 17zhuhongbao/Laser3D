clc; close all; clear all;
%% camera calibration information
disp('---1--- camera calibration');
f_1 = 1359.70203;
f_2 = 1359.11547;
alpha_c = 0;
cc_1 = 604.23227;
cc_2 = 517.47616;

%% ���ñ궨����м䲿�ּ���߶�
disp('---2--- camera-water refraction calibration');
% 12Ϊһ�飬34Ϊһ�飬56Ϊһ�飨б�棩
for i = 1:4
A = imread(['cc_rect' int2str(i) '.bmp']);
figure;imshow(A);
hold on;

[x(1),y(1)] = ginput(1); % ֻ��ѡ�м�λ�õ�һ�����̸�
plot(x(1),y(1),'p', 'MarkerSize', 5, 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'g');
[x(2),y(2)] = ginput(1); 
close all;

H = 33.8; % ����ֵ����λΪ����
Z(i) = sqrt(H^2/( ((x(1)-x(2))/f_1)^2 + ((y(1)-y(2))/f_2)^2) );
end

%% �����ʺ�����ڿ����еĴ�����ֱ����
disp('---3--- compute refraction -N- and camera distance -OK-');
OD1 = Z(1);
OA1 = Z(2);
OD2 = Z(3);
OA2 = Z(4);
% N11 = OA1/OD1;
% N21 = OA2/OD2;

OK = (OA1*OD2 - OA2*OD1)/(OA1+OD2-OA2-OD1)
N = (OA1-OK)/(OD1-OK)  % N2 = (OA2-OK)/(OD2-OK);

result.OK = OK;
result.N = N;
save('result.mat','result');
%ĳ�α궨��� %OK=70.1072 N=1.3226