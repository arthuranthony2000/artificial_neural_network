clc
clear
close all

x = [0 0; 0 1; 1 0; 1 1];
w = cell(1, 2);
w{1} = [-0.424 -0.74 -0.961; 0.358 -0.577 -0.961];
w{2} = [-0.017; -0.893; 0.148];

n = 2;
m = 9;

f = @(x) 1/(1 + exp(1)^-x);

y = [0 1 1 0];

error_w0 = evaluate(x, w, f, y);

dim = zeros(n, 2);

for i = 1:n
    dim(i, 1) = size(w{i}, 1);
    dim(i, 2) = size(w{i}, 2);
end

w0 = [];

for i = 1:n
    w0 = [w0 reshape(w{i}, [1 dim(i, 1) * dim(i, 2)])];
end

itermax = 1000;

fobj = @(w) fitness(x, w, n, f, y, dim, @evaluate);

g = @(w) direct(x, w, f, n, dim);

learning_rate = 10;

tic
w_out = gradient_descent(g, w0, y, learning_rate, itermax);
time = toc

error = fobj(w_out)


