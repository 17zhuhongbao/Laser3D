g_src = './';
imgDir  = dir([g_src '*.bmp']); % ��������tif��ʽ�ļ�
%�ļ�����ʽ��[Investigation].[texturename].[rotation].[slant].[tilt].[format]

g_pic_num = length(imgDir);
for i = 1:g_pic_num          % �����ṹ��һһ����ͼƬ
    %��ȡ����ͼƬ������ƴ��Ϊһ�������I
    image = imread([g_src imgDir(i).name]); %��ȡÿ��ͼƬ
    image = imresize(image, 0.25);
    imwrite(image, ['b' imgDir(i).name]);
end