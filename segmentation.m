function []= segmentation( str,p )
img  = imread(str);
% subplot(221), imshow(img), title('original image');
img_gray = rgb2gray(img);
% img_gray = double(img_gray);
% img_gray = im2bw(img_gray,0.9);
% F = img_gray;
% d = fspecial('gaussian',3,0.5);
% img_gray = imfilter(img_gray,d);
% w1 = [1 4 1;4 -20 4;1 4 1];
% w2 = [0 1 0;1 -4 1;0 1 0];
% w3 = [1 1 1;1 -8 1;1 1 1];
% w4 = fspecial('sobel');
% 
% w5 = w4.';
% g1 = imfilter(img_gray,w4);
% g2 = imfilter(img_gray,w5);
% G = abs(g1)+abs(g2);



% img1 = imfilter(img_gray,h,'corr','replicate');
% F = im2bw(F,0.9);
% figure,imshow(F1);
% the canny edge of image
% img_gray = imerode(img_gray,[0 1 0;1 1 1;0 1 0]);
% % % % % se = strel('line',20,0);
% % % % % img_gray = imerode(img_gray,se);
% % % img_gray = imopen(img_gray,ones(5,5));
% img_gray = imerode(img_gray,strel('line',20,90));
% figure,imshow(img_gray);
% img_gray = imerode(img_gray,strel(ones(3,3),ones(3,3)));
% h = fspecial('log',5,2);
% img_gray = imfilter(img_gray,h,'corr','replicate');
% d = fspecial('gaussian',3,0.5);
% img_gray = imfilter(img_gray,d);
BW = edge(img_gray,'sobel');
% subplot(223), imshow(BW), title('image edge');
% the theta and rho of transformed space
[H,Theta,Rho] = hough(BW);
% subplot(222), imshow(H,[],'XData',Theta,'YData',Rho,'InitialMagnification','fit'),...
%     title('rho\_theta space and peaks');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
% label the top 14 intersections
P  = houghpeaks(H,16,'threshold',ceil(0.1*max(H(:))));
x = Theta(P(:,2)); 
y = Rho(P(:,1));
plot(x,y,'*','color','r');
%segmentation
A=[];
B=[];
% D=[1:1:36];%index
lines = houghlines(BW,Theta,Rho,P,'FillGap',600,'MinLength',40);
figure, imshow(img), hold on
max_len = 0;
for k = 1:length(lines)
 xy = [lines(k).point1; lines(k).point2];
 if xy(1,1)==xy(2,1)
     A=[A,xy(1,1)];
 end
 if xy(1,2)==xy(2,2)
     B=[B,xy(1,2)];
 end
 plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','r');
end
A=sort(A);
B=sort(B);
n = 1;

k =0;
for i=1:length(A)-1
    for j=1:length(B)-1
        C=img(B(j):B(j+1),A(i):A(i+1));
        [l,h] = size(C);
        if(l>1000&&h>1000)
            k = k+1;
        end
    end
end
disp(p);
% if(k<20)
%     G  = imread(str);
%     f_name = ['file_' num2str(p) '.jpg'];
%     path2 = strcat('D:\residue\',f_name);
%     imwrite(G,path2,'JPG');
% if(k==20)
    mkdir(['D:\分割结果4\' num2str(p) '\']);
    dir_name = ['D:\分割结果4\' num2str(p) '\'];
    for i=1:length(A)-1
        for j=1:length(B)-1
            C=img(B(j):B(j+1),A(i):A(i+1));
            [l,h] = size(C);
            if(l>1000&&h>1000)
                filename=['file_' num2str(n) '.png'];
                path = strcat(dir_name,filename);
                imwrite(C,path,'png');
                n=n+1;
            end
        end
    end
%     delete(str);
end

