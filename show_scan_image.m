function show_scan_image
%导入扫描数据，显示扫描图像
aa{1}=['20140307PM1401','.','txt'];
a = importdata(aa{1});%从外部将文本或者数据文件如txt.dat导入到Matlab中a单元中
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
pcolor(data)%用颜色填充坐标的值，其中前面两位为坐标点，后面为颜色值
shading interp%hading interp 在flat的基础上进行色彩的插值处理，使色彩平滑过渡
save f;
save data;
grid off%关闭画图网线
axis off%取消坐标轴