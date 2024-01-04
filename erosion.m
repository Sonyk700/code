global J                      %使用全局变量J
J=imread('3.jpg') %读取图像J
thresh = graythresh(J);           %自动确定二值化阈值
PS = im2bw(J,thresh);           %对图像二值化，且令PS为待处理的图像
PA=PS                       %将图像赋值给PA（用于膨胀）
PB=PS                       %将图像赋值给PB（用于腐蚀）
PC=PS                       %将图像赋值给PC（用于开运算）
PD=PS                       %将图像赋值给PD（用于闭运算）
PE=PS                       %中间量
subplot(2,3,1);                 %分割绘图窗口为2行3列，将当前句柄移到第1个位置
imshow(PS);                  %显示原图像
title('原图像')
[m,n]=size(PS);                %测量图像尺寸参数
for i=2:m-1
    for j=2:n-1    PA(i,j)=PS(i-1,j-1)&&PS(i-1,j)&&PS(i-1,j+1)&&PS(i,j-1)&&PS(i,j)&&PS(i,j+1)&&PS(i+1,j-1)&&PS(i+1,j)&&PS(i+1,j+1);          %选择3*3模板进行腐蚀运算     PE(i,j)=PS(i-1,j-1)||PS(i-1,j)||PS(i-1,j+1)||PS(i,j-1)||PS(i,j)||PS(i,j+1)||PS(i+1,j-1)||PS(i+1,j)||PS(i+1,j+1);                            %选择3*3模板进行膨胀运算
    end
end
subplot(2,3,2);                %分割绘图窗口为2行3列，将当前句柄移到第2个位置
imshow(PA);                 %显示腐蚀后的图像 
title('腐蚀后的图像')
for i=2:m-1
    for j=2:n-1  PB(i,j)=PS(i-1,j-1)||PS(i-1,j)||PS(i-1,j+1)||PS(i,j-1)||PS(i,j)||PS(i,j+1)||PS(i+1,j-1)||PS(i+1,j)||PS(i+1,j+1);                           %选择3*3模板进行膨胀运算     PC(i,j)=PA(i-1,j-1)||PA(i-1,j)||PA(i-1,j+1)||PA(i,j-1)||PA(i,j)||PA(i,j+1)||PA(i+1,j-1)||PA(i+1,j)||PA(i+1,j+1);                          %开运算，对腐蚀后的图像PA进行膨胀得到PC
       PD(i,j)=PE(i-1,j-1)&&PE(i-1,j)&&PE(i-1,j+1)&&PE(i,j-1)&&PE(i,j)&&PE(i,j+1)&&PE(i+1,j-1)&&PE(i+1,j)&&PE(i+1,j+1);       %闭运算，对膨胀后的图像PE进行腐蚀得到PD
    end
end
subplot(2,3,3);              %分割绘图窗口为2行3列，将当前句柄移到第3个位置
imshow(PB);               %显示膨胀后的图像 
title('膨胀后的图像')
subplot(2,3,4);              %分割绘图窗口为2行3列，将当前句柄移到第4个位置
imshow(PC);               %开运算后的图像
title('开运算后的图像')
