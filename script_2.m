clc
clear
close all

n = 2;
w = cell(1, n);
w{1} = [-0.424 -0.74 -0.961; 0.358 -0.577 -0.961];
w{2} = [-0.017; -0.893; 0.148];

w_vector = [];

for i = 1:n
    w_vector = [w_vector reshape(w{i}, [1 size(w{i}, 1) * size(w{i}, 2)])];
end

w_out = cell(1, n);

k = 1;
for i = 1:n
    w_out{i} = reshape(w_vector(1, k:k+size(w{i}, 1) * size(w{i}, 2)-1), [size(w{i}, 1), size(w{i}, 2)]);
    k = size(w{i}, 1) * size(w{i}, 2) + 1;
end


