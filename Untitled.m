
file_path =  'E:\360Downloads\ǩ��1\';% ͼ���ļ���·��  
img_path_list = dir(strcat(file_path,'*.jpg'));%��ȡ���ļ���������jpg��ʽ��ͼ��  
img_num = length(img_path_list);%��ȡͼ��������  
if img_num > 0 %������������ͼ��  
        for j = 1:img_num %��һ��ȡͼ��  
            image_name = img_path_list(j).name;% ͼ����  
            image =  imread(strcat(file_path,image_name));  
%             fprintf('%d %d %s\n',i,j,strcat(file_path,image_name));% ��ʾ���ڴ����ͼ����  
            segmentation(strcat(file_path,image_name),j);
        end  
end  
