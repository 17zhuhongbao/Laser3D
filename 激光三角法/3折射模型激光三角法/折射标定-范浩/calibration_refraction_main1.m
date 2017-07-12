clc; clear; close all;
%% camera calibration information
disp('---1--- camera calibration');
f_1 = 707.03023; %�Ժ���Ϊ��λ���궨
f_2 = 706.89991;
alpha_c = 0;
cc_1 = 315.93375;
cc_2 = 231.14271;

%% ���ñ궨����м䲿�ּ���߶�
disp('---2--- camera-water refraction calibration');
% 12Ϊһ�飬34Ϊһ�飬56Ϊһ�飨б�棩
for i = 1:2
A = imread([int2str(i) '.bmp']);
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
OA = Z(1);  %����
OD = Z(2); %ˮ��
% N11 = OA1/OD1;
% N21 = OA2/OD2;


N = 1.333;
OK = (OA-N*OD)/(1-N);
result.OK = OK;
result.N = N
save('result.mat','result');
%ĳ�α궨��� %OK=53 N=1.3226