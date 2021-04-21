%%
clear all 
clc
% ��������
% ����ѵ������
x =  load('E52ST1_1.txt');
% �������ݼ�
test_x=load('E52ST1_2.txt');
N=size(test_x,1);
monitortime=200;
%% �����Ա��PCA����
[P,T_test,SPE,T_alpha,SPE_alpha,contri6,t4,x,test_x,Latent]=PCA1(x,test_x,N,monitortime);
% ��ͼ
figure(1);
subplot(2,1,1),
x_row=1:N;
T_alpha=T_alpha*(ones(size(x_row)));
plot(x_row,T_alpha,'r-','LineWidth',2.5),hold on
plot(T_test,'b-');grid on; xlabel('������');ylabel('T2ͳ����');
subplot(2,1,1),
x_row=1:N;
SPE_alpha=SPE_alpha*(ones(size(x_row)));
plot(x_row,SPE_alpha,'r-','LineWidth',2.5),hold on
plot(SPE,'b-');grid on; xlabel('������');ylabel('SPEͳ����');
% ��
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
subplot(121),bar(t4),title('T2ͳ��������ͼ');
subplot(122),bar(contri6),title('SPEͳ��������ͼ');
figure(3);
boxplot(test_x)
