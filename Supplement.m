%%
clear all 
clc
% 载入数据
% 构造训练样本
x =  load('E52ST1_1.txt');
% 正常数据集
test_x=load('E52ST1_2.txt');
N=size(test_x,1);
monitortime=200;
%% 调用自编的PCA函数
[P,T_test,SPE,T_alpha,SPE_alpha,contri6,t4,x,test_x,Latent]=PCA1(x,test_x,N,monitortime);
% 绘图
figure(1);
subplot(2,1,1),
x_row=1:N;
T_alpha=T_alpha*(ones(size(x_row)));
plot(x_row,T_alpha,'r-','LineWidth',2.5),hold on
plot(T_test,'b-');grid on; xlabel('样本点');ylabel('T2统计量');
subplot(2,1,1),
x_row=1:N;
SPE_alpha=SPE_alpha*(ones(size(x_row)));
plot(x_row,SPE_alpha,'r-','LineWidth',2.5),hold on
plot(SPE,'b-');grid on; xlabel('样本点');ylabel('SPE统计量');
% 误报
count =0;
for i=1:N
    if T_test(i)>T_alpha(i)
        count=count+1
    end
end
false_alarm=count/N
count2=0;
for i=1:N
  if SPE(i)>SPE_alpha(i)
        count2=count2+1
    end
end  
false_alarm2=count2/N
figure(2);
subplot(121),bar(t4),title('T2统计量贡献图');
subplot(122),bar(contri6),title('SPE统计量贡献图');
figure(3);
boxplot(test_x)
