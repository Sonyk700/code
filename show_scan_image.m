function show_scan_image
%����ɨ�����ݣ���ʾɨ��ͼ��
aa{1}=['20140307PM1401','.','txt'];
a = importdata(aa{1});%���ⲿ���ı����������ļ���txt.dat���뵽Matlab��a��Ԫ��
b=a(5:51332);
c = reshape(b,401,128);
d = c(3:401,:);
for i=1:399
    for j=1:128
        e=char(d(i,j));
        for k=1:length(e)
            if e(k)=='='
                f=str2num(e(k+1:length(e)));
            end
            
        end
        data(i,j)=f;
    end
end
pcolor(data)%����ɫ��������ֵ������ǰ����λΪ����㣬����Ϊ��ɫֵ
shading interp%hading interp ��flat�Ļ����Ͻ���ɫ�ʵĲ�ֵ����ʹɫ��ƽ������
save f;
save data;
grid off%�رջ�ͼ����
axis off%ȡ��������