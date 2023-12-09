function y_estimated = perceptron_direct(x, w, f, n, dim)

w_out = cell(1, n);

k = 1;
for i = 1:n
    w_out{i} = reshape(w(1, k:k+dim(i, 1) * dim(i, 2)-1), [dim(i, 1), dim(i, 2)]);
    k = dim(i, 1) * dim(i, 2) + 1;
end

y_estimated = zeros(size(x, 1), 1);

for i=1:size(x, 1)
    out = x(i, :);
    for l=1:size(x, 2)
        out = perceptron_calc(out, w_out{l}, f);
    end
    y_estimated(i) = out;
end
end

