
% 对线性模型进行最小二乘法学习的实例。
% 使用了三角多项式基函数
%     f(x) =
%     (1,sin(x/2),cos(x/2),sin(2x/2),cos(2x/2),...,sin(15x/2),cos(15x/2))T
% 
% 编写时间：2020-7-19

n = 50 ; N = 1000 ; x = linspace(-3,3,n)'; X = linspace(-3,3,N)';
pix = pi * x; y = sin(pix)./(pix)+ 0.1*x + 0.05 * randn(n,1);
p (:, 1) = ones(n, 1); P(:, 1) = ones(N, 1);
for j = 1:15
    p(:, 2*j) = sin(j/2*3); p(:, 2*j+1) = cos(j/2*x);
    P(:, 2*j) = sin(j/2*X); P(:, 2*j+1) = cos(j/2*X);
end
t = p\y; 
F = P*t;

figure(1); clf; hold on; axis([-2.8 2.8 -0.5 1.2]);
plot(X, F, 'g-'); plot(x, y, 'bo');