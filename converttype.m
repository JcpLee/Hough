
img_path_list = dir('D:\Signature\����\');% 
img_num = length(img_path_list);%���ļ���������  
disp(img_num)
sum = 0;
p = 0;
for k=3:img_num
    file_name = img_path_list(k).name;% ���ļ�����
    path = strcat('D:\Signature\����\',file_name);
    f = dir([path '\']);
    l1 = length(f);
    path3 = strcat(path,'\');
    disp(l1)
    p = p+1;
    for i=3:l1
        file_name = f(i).name;% ���ļ����� 
%         disp(file_name)
        path = strcat(path3,file_name);
        path = strcat(path,'\');
        file_list = dir(strcat(path,'*.png'));%���ļ��������е�.png�ļ�
        l = length(file_list);
%         disp(l)
        f_name = 'sign_';
        w =  floor(log10(p))+1;
        for h = 1:4-w
           f_name =  strcat(f_name,'0');
        end
        f_name = strcat(f_name,num2str(p));
        f_path = strcat('D:\Signature\SignatureDataset\',f_name);
        ff_path = strcat(f_path,'\');
        f_path = strcat(ff_path,'neg\');
        f1_path = strcat(ff_path,'pos\');
        if(i==3)
            mkdir(f_path);
            for j=1:l
            path1 = strcat(path,file_list(j).name);  
            G = imread([path file_list(j).name]);
            B = imrotate(G,-90,'nearest'); 
            filename=['file_' num2str(j) '.png'];
            vpath = strcat(f_path,filename);
            imwrite(B,vpath,'png'); 
%             disp(j)
            end
        end
        if(i==4)
            mkdir(f1_path);
            for j=1:l
            path1 = strcat(path,file_list(j).name);  
            G = imread([path file_list(j).name]);
            B = imrotate(G,90,'nearest'); 
            filename=['file_' num2str(j) '.png'];
            vpath = strcat(f1_path,filename);
            imwrite(B,vpath,'png'); 
%             disp(j)
            end
        end  
    
    end
end
% disp(sum);
% sprintf('%d',img_num);
% c = zeros(1,img_num);
% c = [];
% p=1;
% x = 1;
% if img_num > 0 %������������ͼ��  
%         for j = 3:img_num %��һ��ȡͼ�� 
%             file_name = img_path_list(j).name;% ���ļ���   
%             path = strcat('D:\�ָ���\',file_name);
%             file_list = dir(strcat(path,'\'));
%             l = length(file_list); 
%             if(l < 20)
% %                 disp(img_path_list(j).name);
%                 c(1,x) = (str2num(img_path_list(j).name));
%                 x = x+1;
%             end  
%             l=0;
%         end
% end  
% disp(c);
% % all_img = dir('E:\360Downloads\ǩ��1');
% % num = length(all_img);
% % for i = 1:length(c)
% %     path1 = strcat('E:\360Downloads\ǩ��1\',all_img(c(i)+2).name);
% %     G = imread(path1);
% %     path2 = ['D:\residue\' num2str(i) '.jpg'];
% %     imwrite(G,path2,'jpg');
% % end
    