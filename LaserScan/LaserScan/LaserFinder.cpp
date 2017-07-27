#include "LaserFinder.h"
#include <iostream>
#include <fstream>

using namespace std;
using namespace cv;

LaserFinder::LaserFinder()
{

}

LaserFinder::~LaserFinder()
{

}

Mat LaserFinder::FindLaserMask(const Mat &im)
{
	Mat mask = Mat::zeros(im.rows, im.cols, CV_8UC1);//8λ�޷������͵�ͨ������
	int model = 1;
	int idrows, idcols;//��¼�����±�
	int count = 0;//���ÿһ�л���ÿһ�е����ֵ�ĸ���
	uchar max;         //��ÿ�л��е����ֵ
	//ofstream in;
	//in.open("./data.txt", ios::out);
	//in << "hhh";//�����Ƿ�д��data.txt

	// The laser line is horizontal. Process each column
	/*if (model == 1)  //model=1ÿһ�����ֵ
	{
		for (int i = 0; i < im.rows; i++)
		{
			max = im.at<uchar>(i,0);
			for (int j = 0; j < im.cols; j++)//��ѭ�������ֵ
			{
				if (im.at<uchar>(i,j) >=max)
				{
					max = im.at<uchar>(i,j);
					//���ÿһ�����ֵ
					idrows = i;
					idcols = j;
					//cout << "��" << i << "�����ֵΪ��" << max << endl;
					in<< "��" << i << "�����ֵΪ��" << max <<endl;
					//���ҵ��������ֵ
					in.close();
				}

			}
			for (int j = 0; j < im.cols; j++)//��ѭ����ǳ������ֵ��ȵ����ֵ
			{
				if (im.at<uchar>(i, j) == max)
				{
					count = count + 1;
					idrows = i;
					idcols = j;
					in << "��" << i << "�е�"<<count<<"�����ֵΪ��" << max << " ����Ϊ��(" << idrows << "," << idcols << ")" << endl;
					in.close();
				}
			}
			mask.at<uchar>(idrows,idcols) == 255;
		}
	}
	*/


	for (int j = 0; j < im.cols; j++)
	{
		count = 0;
		vector<int> row_id;
		max = im.at<uchar>(0, j);
		row_id.push_back(0);
		for (int i = 1; i < im.rows; i++)//��ѭ�������ֵ
		{
			if (im.at<uchar>(i, j) > max)
			{
				max = im.at<uchar>(i, j);
				row_id.clear();
				row_id.push_back(i);

				//���ÿһ�����ֵ
				//idrows = i;
				//idcols = j;
				//cout << "��" << j << "�����ֵΪ��" << max << endl;
				//in << "��" << i << "�����ֵΪ��" << max << endl;
				//���ҵ��������ֵ
				//in.close();
			}
			else if (im.at<uchar>(i, j) == max)
			{
				row_id.push_back(i);
			}
		}
		for (int k = 0; k < row_id.size(); ++k)
		{
			mask.at<uchar>(row_id[k], j) == 255;
		}
		/*
		for (int i = 0; i < im.rows; i++)//��ѭ�������ֵ
		{
			if (im.at<uchar>(i, j) == max)
			{
				count = count + 1;
				idrows = i;
				idcols = j;
				in << "��" << i << "�е�" << count << "�����ֵΪ��" << max << " ����Ϊ��(" << idrows << "," << idcols << ")" << endl;
				in.close();
			}
		}
		*/
		
	}

	return mask;
}